#include "stdint.h"
#include "string.h"
#include "printk.h"
#include "defs.h"
#include "proc.h"
#include "mm.h"
#include "syscall.h"

// Interrupts.
#define SUPERVISOR_TIMER_INTERRUPT_TYPE 0x8000000000000005 // 1 << 63 | 5

// Exceptions.
#define ENVIRONMRNT_CALL_FROM_U_MODE_TYPE 0x8
#define INSTRUCTION_PAGE_FAULT_TYPE       0xC
#define LOAD_PAGE_FAULT_TYPE              0xD
#define STORE_PAGE_FAULT_TYPE             0xF

extern struct task_struct *current;
extern char _sramdisk[];
extern char _eramdisk[];
extern void create_mapping(uint64_t *pgtbl, uint64_t va, uint64_t pa, uint64_t sz, uint64_t perm);

void do_page_fault(struct pt_regs *regs) {
    // Check bad address.
    uint64_t addr = csr_read(stval); // Get the faulting address.
    struct vm_area_struct *vma = find_vma(&current->mm, addr); // Find the vma that contains the faulting address.
    if (!vma) error("Bad address for page fault at 0x%lx", addr); // Bad address.

    // Check permission.
    uint64_t perm = vma->vm_flags; // Get the permission of the vma.
    uint64_t cause = csr_read(scause); // Get the cause of the trap.
    bool is_illegal = (
        cause == INSTRUCTION_PAGE_FAULT_TYPE && !(perm & VM_EXEC) ||
        cause == LOAD_PAGE_FAULT_TYPE        && !(perm & VM_READ) ||
        cause == STORE_PAGE_FAULT_TYPE       && !(perm & VM_WRITE)
    );
    if (is_illegal) error("Illegal access to 0x%lx", addr); // Permission denied.
    log(GREEN "[PID = %d PC = 0x%lx] Valid page fault at 0x%lx, cause = 0x%lx, perm = 0x%lx\n" CLEAR, current->pid, regs->sepc, addr, cause, perm);

    // Legal access, continue.
    uint64_t *page = (uint64_t *)alloc_page();
    memset((void *)page, 0x0, PGSIZE);
    if (!(perm & VM_ANON)) {
        uint64_t *src = (uint64_t *)((uint64_t)_sramdisk + PGROUNDDOWN(vma->vm_pgoff + addr - vma->vm_start));
        if (addr >= PGROUNDDOWN(vma->vm_start + vma->vm_filesz) && addr < PGROUNDUP(vma->vm_start + vma->vm_filesz)) {
            memcpy((void *)page, (void *)src, PGOFFSET(vma->vm_filesz));
        } else if (addr < PGROUNDDOWN(vma->vm_start + vma->vm_filesz)) memcpy((void *)page, (void *)src, PGSIZE);
    }
    create_mapping(current->pgd, PGROUNDDOWN(addr), VA2PA((uint64_t)page), PGSIZE, 0b11010001 | (perm & (VM_READ | VM_WRITE | VM_EXEC)));
}

void trap_handler(uint64_t scause, uint64_t sepc, struct pt_regs *regs) {
    // 通过 `scause` 判断 trap 类型
    // 如果是 interrupt 判断是否是 timer interrupt
    // 如果是 timer interrupt 则打印输出相关信息，并通过 `clock_set_next_event()` 设置下一次时钟中断
    // `clock_set_next_event()` 见 4.3.4 节
    // 其他 interrupt / exception 可以直接忽略，推荐打印出来供以后调试

    switch (scause) {
        // Interrupts.
        case SUPERVISOR_TIMER_INTERRUPT_TYPE:
            clock_set_next_event();
            do_timer();
            break;
        // Exceptions.
        case ENVIRONMRNT_CALL_FROM_U_MODE_TYPE:
            syscall(regs);
            break;
        case INSTRUCTION_PAGE_FAULT_TYPE:
            [[fallthrough]];
        case LOAD_PAGE_FAULT_TYPE:
            [[fallthrough]];
        case STORE_PAGE_FAULT_TYPE:
            do_page_fault(regs);
            break;
        // default.
        default:
            uint64_t _stval = csr_read(stval);
            printk("[S] Unknown trap with scause = 0x%lx, sepc = 0x%lx, stval = 0x%lx\n", scause, sepc, _stval);
    }
}