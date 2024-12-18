#include "syscall.h"
#include "mm.h"
#include "stddef.h"
#include "proc.h"
#include "stdint.h"
#include "string.h"
#include "printk.h"
#include "defs.h"

/* SYS_WRITE. */
size_t sys_write(unsigned int fd, const char* buf, size_t count) {
    size_t ret = 0;
    switch (fd) {
        case 1: // stdout.
            for (size_t i = 0; i < count; i++) {
                printk("%c", buf[i]);
                ret++;
            }
            break;
        default:
            printk("[U] sys_write: unsupported file descriptor %d\n", fd);
    }
    return ret;
}

/* SYS_GETPID. */

extern struct task_struct *current;
uint64_t sys_getpid() {
    return current->pid;    
}

/* SYS_CLONE. */

bool find_pte(uint64_t *pgtbl, uint64_t va) {
    uint64_t *pgtbl2 = pgtbl;
    uint64_t vpn2 = (va >> 30) & 0x1FF;
    if (!(pgtbl2[vpn2] & 0x1)) return false;

    uint64_t *pgtbl1;
    uint64_t vpn1 = (va >> 21) & 0x1FF;
    pgtbl1 = (uint64_t *)((pgtbl2[vpn2] >> 10 << 12) + PA2VA_OFFSET);
    if (!(pgtbl1[vpn1] & 0x1)) return false;

    uint64_t *pgtbl0;
    uint64_t vpn0 = (va >> 12) & 0x1FF;
    pgtbl0 = (uint64_t *)((pgtbl1[vpn1] >> 10 << 12) + PA2VA_OFFSET);
    return pgtbl0[vpn0] & 0x1;
}

extern uint64_t nr_tasks;
extern struct task_struct *task[NR_TASKS];
extern uint64_t swapper_pg_dir[];
extern void __ret_from_fork();
extern void create_mapping(uint64_t *pgtbl, uint64_t va, uint64_t pa, uint64_t sz, uint64_t perm);
uint64_t do_fork(struct pt_regs *regs) {
    log(BLUE "Forking...\n" CLEAR);
    struct task_struct *_task = (struct task_struct *)alloc_page();

    // Copy kernel stack.
    memcpy((void *)_task, (void *)current, PGSIZE);

    // Copy kernel page table.
    _task->pgd = (uint64_t *)alloc_page();
    memset((void *)_task->pgd, 0x0, PGSIZE);
    memcpy((void *)_task->pgd, (void *)swapper_pg_dir, PGSIZE);

    // Copy VMA.
    _task->mm.mmap = NULL;
    struct vm_area_struct *vma = current->mm.mmap;
    while (vma) {
        do_mmap(&_task->mm, vma->vm_start, vma->vm_end - vma->vm_start, vma->vm_pgoff, vma->vm_filesz, vma->vm_flags);
        for (uint64_t va = PGROUNDDOWN(vma->vm_start); va <= vma->vm_end; va += PGSIZE) {
            if(find_pte(current->pgd, va)) {
                uint64_t *page = (uint64_t *)alloc_page();
                memcpy((void *)page, (void *)va, PGSIZE);
                log(PURPLE "Fork page table start ↓↓↓\n" CLEAR);
                create_mapping(_task->pgd, va, VA2PA((uint64_t)page), PGSIZE, 0b11010001 | (vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)));
                log(PURPLE "Fork page table done  ↑↑↑\n" CLEAR);
            }
        }
        vma = vma->vm_next;
    }

    // Return.
    _task->thread.ra = (uint64_t)__ret_from_fork;
    _task->thread.sp = (uint64_t)_task - (uint64_t)current + regs->regs[reg_sp];
    _task->thread.sscratch = csr_read(sscratch);

    struct pt_regs *child_regs = (struct pt_regs *)((uint64_t)_task - (uint64_t)current + (uint64_t)regs);
    child_regs->regs[reg_sp] = _task->thread.sp;
    child_regs->regs[reg_a0] = 0;
    child_regs->sepc += 4;

    task[_task->pid = nr_tasks++] = _task; // Add to task table.
    log(BLUE "[PID = %lu] forked from [PID = %lu]\n" CLEAR, _task->pid, current->pid);
    return _task->pid;
}

void syscall(struct pt_regs *regs) {
    switch (regs->regs[reg_a7]) {
        case SYS_WRITE:
            regs->regs[reg_a0] = sys_write(regs->regs[reg_a0], (const char *)regs->regs[reg_a1], regs->regs[reg_a2]);
            break;
        case SYS_GETPID:
            regs->regs[reg_a0] = sys_getpid();
            break;
        case SYS_CLONE:
            regs->regs[reg_a0] = do_fork(regs);
            break;
        default:
            printk("[U] Unsupported syscall number: %lu\n", regs->regs[reg_a7]);
    }
    regs->sepc += 4;
}
