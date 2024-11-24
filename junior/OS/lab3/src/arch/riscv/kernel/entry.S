    .extern trap_handler
    .section .text.entry
    .align 2
    .globl _traps
_traps:
    # 1. save 32 registers and sepc to stack
    addi sp, sp, -31*8
    sd ra, 0(sp) # x1
    sd gp, 8(sp) # x3
    sd tp, 16(sp) # x4
    sd t0, 24(sp) # x5
    sd t1, 32(sp) # x6
    sd t2, 40(sp) # x7
    sd s0, 48(sp) # x8
    sd s1, 56(sp) # x9
    sd a0, 64(sp) # x10
    sd a1, 72(sp) # x11
    sd a2, 80(sp) # x12
    sd a3, 88(sp) # x13
    sd a4, 96(sp) # x14
    sd a5, 104(sp) # x15
    sd a6, 112(sp) # x16
    sd a7, 120(sp) # x17
    sd s2, 128(sp) # x18
    sd s3, 136(sp) # x19
    sd s4, 144(sp) # x20
    sd s5, 152(sp) # x21
    sd s6, 160(sp) # x22
    sd s7, 168(sp) # x23
    sd s8, 176(sp) # x24
    sd s9, 184(sp) # x25
    sd s10, 192(sp) # x26
    sd s11, 200(sp) # x27
    sd t3, 208(sp) # x28
    sd t4, 216(sp) # x29
    sd t5, 224(sp) # x30
    sd t6, 232(sp) # x31
    csrr t0, sepc
    sd t0, 240(sp) # sepc

    # 2. call trap_handler
    csrr a0, scause # arg1: scause
    csrr a1, sepc # arg2: sepc
    call trap_handler

    # 3. restore sepc and 32 registers (x2(sp) should be restore last) from stack
    ld t0, 240(sp) # sepc
    csrw sepc, t0
    ld t6, 232(sp) # x31
    ld t5, 224(sp) # x30
    ld t4, 216(sp) # x29
    ld t3, 208(sp) # x28
    ld s11, 200(sp) # x27
    ld s10, 192(sp) # x26
    ld s9, 184(sp) # x25
    ld s8, 176(sp) # x24
    ld s7, 168(sp) # x23
    ld s6, 160(sp) # x22
    ld s5, 152(sp) # x21
    ld s4, 144(sp) # x20
    ld s3, 136(sp) # x19
    ld s2, 128(sp) # x18
    ld a7, 120(sp) # x17
    ld a6, 112(sp) # x16
    ld a5, 104(sp) # x15
    ld a4, 96(sp) # x14
    ld a3, 88(sp) # x13
    ld a2, 80(sp) # x12
    ld a1, 72(sp) # x11
    ld a0, 64(sp) # x10
    ld s1, 56(sp) # x9
    ld s0, 48(sp) # x8
    ld t2, 40(sp) # x7
    ld t1, 32(sp) # x6
    ld t0, 24(sp) # x5
    ld tp, 16(sp) # x4
    ld gp, 8(sp) # x3
    ld ra, 0(sp) # x1
    addi sp, sp, 31*8

    # 4. return from trap
    sret

    .extern dummy
    .globl __dummy
__dummy:
    # Set sepc to dummy.
    la t0, dummy
    csrw sepc, t0

    # Return from trap.
    sret

    .globl __switch_to
__switch_to:
    # a0: prev, a1: next
    # ra, sp, s0~s11

    # save state to prev process
    sd ra, 32(a0)
    sd sp, 40(a0)
    sd s0, 48(a0)
    sd s1, 56(a0)
    sd s2, 64(a0)
    sd s3, 72(a0)
    sd s4, 80(a0)
    sd s5, 88(a0)
    sd s6, 96(a0)
    sd s7, 104(a0)
    sd s8, 112(a0)
    sd s9, 120(a0)
    sd s10, 128(a0)
    sd s11, 136(a0)

    # restore state from next process
    ld ra, 32(a1)
    ld sp, 40(a1)
    ld s0, 48(a1)
    ld s1, 56(a1)
    ld s2, 64(a1)
    ld s3, 72(a1)
    ld s4, 80(a1)
    ld s5, 88(a1)
    ld s6, 96(a1)
    ld s7, 104(a1)
    ld s8, 112(a1)
    ld s9, 120(a1)
    ld s10, 128(a1)
    ld s11, 136(a1)

    ret