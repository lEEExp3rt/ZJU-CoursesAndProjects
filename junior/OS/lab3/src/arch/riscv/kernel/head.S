    .extern start_kernel
    .extern mm_init
    .extern task_init
    .extern setup_vm
    .extern setup_vm_final
    .section .text.init # Changed from ".text.entry" to ".text.init"
    .globl _start
_start:
    # set stack pointer to top of boot stack
    la sp, boot_stack_top

    # Setup VM.
    call setup_vm
    call relocate

    # Initialize memory management unit
    call mm_init

    # Set up vm final
    call setup_vm_final

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

relocate:
    # set ra = ra + PA2VA_OFFSET
    # set sp = sp + PA2VA_OFFSET (If you have set the sp before)
    li t0, 0xffffffdf80000000
    add ra, ra, t0
    add sp, sp, t0

    # need a fence to ensure the new translations are in use
    sfence.vma zero, zero

    # set satp with early_pgtbl
    la t0, early_pgtbl
    srli t0, t0, 12 # PPN
    li t1, 0x8000000000000000 # set mode to SV39
    or t0, t0, t1
    csrw satp, t0

    ret

    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096# Stack size of 4KiB

    .globl boot_stack_top
boot_stack_top: