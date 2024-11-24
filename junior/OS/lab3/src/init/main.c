#include "printk.h"

extern void test();

extern char _stext[];
extern char _srodata[];

int start_kernel() {
    printk("2024");
    printk(" ZJU Operating System\n");

    test();
    return 0;
}
