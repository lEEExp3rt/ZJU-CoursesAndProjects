#include "printk.h"
#include "proc.h"

extern void test();
extern void schedule();

extern char _stext[];
extern char _srodata[];

int start_kernel() {
    printk("2024");
    printk(" ZJU Operating System\n");
    schedule();
    test();
    return 0;
}
