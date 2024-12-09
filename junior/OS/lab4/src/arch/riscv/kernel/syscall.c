#include "syscall.h"
#include "stddef.h"
#include "proc.h"
#include "stdint.h"
#include "printk.h"

void syscall(struct pt_regs *regs) {
    // Syscall number in a7 -> x17 -> regs.regs[16].
    switch (regs->regs[16]) {
        case SYS_WRITE:
            regs->regs[9] = sys_write(regs->regs[9], (const char *)regs->regs[10], regs->regs[11]);
            break;
        case SYS_GETPID:
            regs->regs[9] = sys_getpid();
            break;
        default:
            printk("[U] Unsupported syscall number: %lu\n", regs->regs[16]);
    }
    regs->sepc += 4;
}

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

extern struct task_struct *current;
uint64_t sys_getpid() {
    return current->pid;    
}