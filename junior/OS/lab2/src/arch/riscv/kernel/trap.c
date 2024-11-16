#include "../../../include/stdint.h"
#include "printk.h"
#include "defs.h"
#include "proc.h" // Added.

#define SUPERVISOR_TIMER_INTERRUPT_TYPE UINT64_C(1UL << 63 | 5)

void trap_handler(uint64_t scause, uint64_t sepc) {
    // 通过 `scause` 判断 trap 类型
    // 如果是 interrupt 判断是否是 timer interrupt
    // 如果是 timer interrupt 则打印输出相关信息，并通过 `clock_set_next_event()` 设置下一次时钟中断
    // `clock_set_next_event()` 见 4.3.4 节
    // 其他 interrupt / exception 可以直接忽略，推荐打印出来供以后调试

    if (scause >> 63) {
        uint64_t interruptType = scause & UINT64_MAX;
        switch (interruptType) {
            case SUPERVISOR_TIMER_INTERRUPT_TYPE:
                // printk("[S] Supervisor mode timer interrupt!\n");
                clock_set_next_event();
                do_timer(); // Added.
                break;
            default:
                printk("Unknown interrupt code: %lu\n", interruptType);
        }
    } else {
        printk("Unknown exception code: %lu\n", scause);
    }

    return ;
}