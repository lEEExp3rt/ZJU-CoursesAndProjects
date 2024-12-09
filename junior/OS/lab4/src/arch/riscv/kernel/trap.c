#include "stdint.h"
#include "printk.h"
#include "defs.h"
#include "proc.h"
#include "syscall.h"

#define SUPERVISOR_TIMER_INTERRUPT_TYPE 0x8000000000000005 // 1 << 63 | 5
#define ENVIRONMRNT_CALL_FROM_U_MODE_TYPE 0x8

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
        // default.
        default:
        //    printk("Unknown trap code: %x\n", scause);
    }
}