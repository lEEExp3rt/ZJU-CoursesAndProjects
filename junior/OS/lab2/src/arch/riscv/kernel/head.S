    .extern start_kernel
    .extern mm_init
    .extern task_init
    .section .text.init # Changed from ".text.entry" to ".text.init"
    .globl _start
_start:
    # set stack pointer to top of boot stack
    la sp, boot_stack_top

    # Initialize memory management unit
    call mm_init

    # Initialize tasks.
    call task_init

    # set stvec = _traps
    la t0, _traps
    csrw stvec, t0

    # set sie[STIE] = 1
    csrr t0, sie
    ori t0, t0, 0x20
    csrw sie, t0

    # set first time interrupt
    rdtime t0
    li t1, 10000000
    add t0, t0, t1
    csrw stimecmp, t0

    # set sstatus[SIE] = 1
    csrr t0, sstatus
    ori t0, t0, 0x2
    csrw sstatus, t0

    # jump to start_kernel
    call start_kernel

    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096 # Stack size of 4KiB

    .globl boot_stack_top
boot_stack_top: