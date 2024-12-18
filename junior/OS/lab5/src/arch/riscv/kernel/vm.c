#include "defs.h"
#include "printk.h"
#include "stdint.h"
#include "mm.h"
#include "string.h"

/* early_pgtbl: 用于 setup_vm 进行 1GiB 的映射 */
uint64_t early_pgtbl[512] __attribute__((__aligned__(0x1000)));

void setup_vm() {
    /* 
     * 1. 由于是进行 1GiB 的映射，这里不需要使用多级页表 
     * 2. 将 va 的 64bit 作为如下划分： | high bit | 9 bit | 30 bit |
     *     high bit 可以忽略
     *     中间 9 bit 作为 early_pgtbl 的 index
     *     低 30 bit 作为页内偏移，这里注意到 30 = 9 + 9 + 12，即我们只使用根页表，根页表的每个 entry 都对应 1GiB 的区域
     * 3. Page Table Entry 的权限 V | R | W | X 位设置为 1
    **/
    early_pgtbl[(PHY_START >> 30) & 0x1FF] = ((PHY_START >> 12) << 10) | 0xF;
    early_pgtbl[(VM_START >> 30) & 0x1FF] = ((PHY_START >> 12) << 10) | 0xF;
    printk("...setup_vm done.\n");
    return ;
}

/* swapper_pg_dir: kernel pagetable 根目录，在 setup_vm_final 进行映射 */
uint64_t swapper_pg_dir[512] __attribute__((__aligned__(0x1000)));

extern uint64_t _stext[];
extern uint64_t _etext[];
extern uint64_t _srodata[];
extern uint64_t _erodata[];
extern uint64_t _sdata[];

/* 创建多级页表映射关系 */
/* 不要修改该接口的参数和返回值 */
void create_mapping(uint64_t *pgtbl, uint64_t va, uint64_t pa, uint64_t sz, uint64_t perm) {
    /*
     * pgtbl 为根页表的基地址
     * va, pa 为需要映射的虚拟地址、物理地址
     * sz 为映射的大小，单位为字节
     * perm 为映射的权限（即页表项的低 8 位）
     * 
     * 创建多级页表的时候可以使用 kalloc() 来获取一页作为页表目录
     * 可以使用 V bit 来判断页表项是否存在
     **/
    uint64_t *pgtbl2 = pgtbl;
    uint64_t *pgtbl1;
    uint64_t *pgtbl0;
    uint64_t vend = va + sz;
    uint64_t vpn2, vpn1, vpn0;

    uint64_t size = PGROUNDUP(sz);
    log(YELLOW "pgtbl: %p, [%p, %p) -> [%p, %p), perm: %lx\n" CLEAR, pgtbl, pa, pa + size, va, va + size, perm);

    while (va < vend) {
        vpn2 = (va >> 30) & 0x1FF;
        vpn1 = (va >> 21) & 0x1FF;
        vpn0 = (va >> 12) & 0x1FF;

        if (pgtbl2[vpn2] & 0x1) pgtbl1 = (uint64_t *)((pgtbl2[vpn2] >> 10 << 12) + PA2VA_OFFSET);
        else {
            pgtbl1 = (uint64_t *)kalloc();
            pgtbl2[vpn2] = ((uint64_t)pgtbl1 - PA2VA_OFFSET) >> 12 << 10 | 0x1;
        }

        if (pgtbl1[vpn1] & 0x1) pgtbl0 = (uint64_t *)((pgtbl1[vpn1] >> 10 << 12) + PA2VA_OFFSET);
        else {
            pgtbl0 = (uint64_t *)kalloc();
            pgtbl1[vpn1] = ((uint64_t)pgtbl0 - PA2VA_OFFSET) >> 12 << 10 | 0x1;
        }

        if (!(pgtbl0[vpn0] & 0x1)) pgtbl0[vpn0] = pa >> 12 << 10 | perm;

        va += PGSIZE;
        pa += PGSIZE;
    }
}

void setup_vm_final() {
    memset(swapper_pg_dir, 0x0, PGSIZE);

    // No OpenSBI mapping required

    // mapping kernel text X|-|R|V
    create_mapping(swapper_pg_dir, (uint64_t)_stext, (uint64_t)_stext - PA2VA_OFFSET, (uint64_t)_etext - (uint64_t)_stext, 0xCB);

    // mapping kernel rodata -|-|R|V
    create_mapping(swapper_pg_dir, (uint64_t)_srodata, (uint64_t)_srodata - PA2VA_OFFSET, (uint64_t)_erodata - (uint64_t)_srodata, 0xC3);

    // mapping other memory -|W|R|V
    create_mapping(swapper_pg_dir, (uint64_t)_sdata, (uint64_t)_sdata - PA2VA_OFFSET, PHY_END + PA2VA_OFFSET - (uint64_t)_sdata, 0xC7);

    // set satp with swapper_pg_dir
    uint64_t _satp = 0x8000000000000000 | (((uint64_t)swapper_pg_dir - PA2VA_OFFSET) >> 12);
    csr_write(satp, _satp);

    // flush TLB
    asm volatile("sfence.vma zero, zero");

    printk("...setup_vm_final done.\n");
    return;
}