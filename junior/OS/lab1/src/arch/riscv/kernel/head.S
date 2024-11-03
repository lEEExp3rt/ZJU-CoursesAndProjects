    .extern start_kernel
    .section .text.init # Changed from ".text.entry" to ".text.init"
    .globl _start
_start:
    # set stack pointer to top of boot stack
    la sp, boot_stack_top

    # set stvec = _traps
    la t0, _traps
    csrw stvec, t0
     
    # set sie[STIE] = 1
    csrr t0, sie
    li t1, 0x20
    or t0, t0, t1
    csrw sie, t0

    # set first time interrupt
    li t0, 0x10000000
    csrw stimecmp, t0

    # set sstatus[SIE] = 1
    csrr t0, sstatus
    li t1, 0x2
    or t0, t0, t1
    csrw sstatus, t0

    # jump to start_kernel
    la t0, start_kernel
    jalr ra, 0(t0)

    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096 # Stack size of 4KiB

    .globl boot_stack_top
boot_stack_top: