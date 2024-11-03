# 0 "init/main.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/aarch64-linux-gnu/include/stdc-predef.h" 1 3
# 0 "<command-line>" 2
# 1 "init/main.c"
# 1 "include/printk.h" 1



# 1 "include/stddef.h" 1



typedef long int ptrdiff_t;
typedef long unsigned int size_t;
typedef unsigned int wchar_t;




typedef __builtin_va_list va_list;
# 5 "include/printk.h" 2





int printk(const char *, ...);
# 2 "init/main.c" 2

extern void test();

int start_kernel() {
    printk("2024");
    printk(" ZJU Operating System\n");

    test();
    return 0;
}
