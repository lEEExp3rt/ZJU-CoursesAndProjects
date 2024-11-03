    .extern trap_handler
    .section .text.entry
    .align 2
    .globl _traps 
_traps:
    # 1. save 32 registers and sepc to stack
    addi sp, sp, -32*8
    sd ra, 0(sp) # x1
    sd sp, 8(sp) # x2
    sd gp, 16(sp) # x3
    sd tp, 24(sp) # x4
    sd t0, 32(sp) # x5
    sd t1, 40(sp) # x6
    sd t2, 48(sp) # x7
    sd s0, 56(sp) # x8
    sd s1, 64(sp) # x9
    sd a0, 72(sp) # x10
    sd a1, 80(sp) # x11
    sd a2, 88(sp) # x12
    sd a3, 96(sp) # x13
    sd a4, 104(sp) # x14
    sd a5, 112(sp) # x15
    sd a6, 120(sp) # x16
    sd a7, 128(sp) # x17
    sd s2, 136(sp) # x18
    sd s3, 144(sp) # x19
    sd s4, 152(sp) # x20
    sd s5, 160(sp) # x21
    sd s6, 168(sp) # x22
    sd s7, 176(sp) # x23
    sd s8, 184(sp) # x24
    sd s9, 192(sp) # x25
    sd s10, 200(sp) # x26
    sd s11, 208(sp) # x27
    sd t3, 216(sp) # x28
    sd t4, 224(sp) # x29
    sd t5, 232(sp) # x30
    sd t6, 240(sp) # x31
    csrr t0, sepc
    sd t0, 248(sp) # sepc

    # 2. call trap_handler
    csrr a0, scause # arg1: scause
    csrr a1, sepc # arg2: sepc
    call trap_handler

    # 3. restore sepc and 32 registers (x2(sp) should be restore last) from stack
    ld t0, 248(sp) # sepc
    csrw sepc, t0
    ld t6, 240(sp) # x31
    ld t5, 232(sp) # x30
    ld t4, 224(sp) # x29
    ld t3, 216(sp) # x28
    ld s11, 208(sp) # x27
    ld s10, 200(sp) # x26
    ld s9, 192(sp) # x25
    ld s8, 184(sp) # x24
    ld s7, 176(sp) # x23
    ld s6, 168(sp) # x22
    ld s5, 160(sp) # x21
    ld s4, 152(sp) # x20
    ld s3, 144(sp) # x19
    ld s2, 136(sp) # x18
    ld a7, 128(sp) # x17
    ld a6, 120(sp) # x16
    ld a5, 112(sp) # x15
    ld a4, 104(sp) # x14
    ld a3, 96(sp) # x13
    ld a2, 88(sp) # x12
    ld a1, 80(sp) # x11
    ld a0, 72(sp) # x10
    ld s1, 64(sp) # x9
    ld s0, 56(sp) # x8
    ld t2, 48(sp) # x7
    ld t1, 40(sp) # x6
    ld t0, 32(sp) # x5
    ld tp, 24(sp) # x4
    ld gp, 16(sp) # x3
    ld ra, 0(sp) # x1
    ld sp, 8(sp) # x2
    addi sp, sp, 32*8

    # 4. return from trap
    sret