#ifndef __SYSCALL_H__
#define __SYSCALL_H__

#include "stdint.h"
#include "stddef.h"
#include "proc.h"

#define SYS_WRITE  64
#define SYS_GETPID 172
#define SYS_CLONE  220

void syscall(struct pt_regs* regs);

#endif /* __SYSCALL_H__ */