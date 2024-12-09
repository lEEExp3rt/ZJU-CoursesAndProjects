#ifndef __SYSCALL_H__
#define __SYSCALL_H__

#include "stdint.h"
#include "stddef.h"
#include "proc.h"

void syscall(struct pt_regs* regs);

#define SYS_WRITE 64
#define SYS_GETPID 172

size_t sys_write(unsigned int fd, const char* buf, size_t count);
uint64_t sys_getpid();

#endif /* __SYSCALL_H__ */