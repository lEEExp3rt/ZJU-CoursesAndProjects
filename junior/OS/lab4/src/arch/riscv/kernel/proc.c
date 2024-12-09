#include "mm.h"
#include "defs.h"
#include "proc.h"
#include "stdlib.h"
#include "printk.h"
#include "string.h"
#include "elf.h"

extern void __dummy();
extern uint64_t swapper_pg_dir[];

extern char _sramdisk[];
extern char _eramdisk[];

extern void create_mapping(uint64_t *pgtbl, uint64_t va, uint64_t pa, uint64_t sz, uint64_t perm);

struct task_struct *idle;           // idle process
struct task_struct *current;        // 指向当前运行线程的 task_struct
struct task_struct *task[NR_TASKS]; // 线程数组，所有的线程都保存在此

void load_program_bin(struct task_struct *task) {
    uint64_t size = (uint64_t)_eramdisk - (uint64_t)_sramdisk;
    uint64_t nPages = PGROUNDUP(size) / PGSIZE;
    uint64_t *page = (uint64_t *)alloc_pages(nPages); // Allocate memory for program.
    memset(page, 0x0, nPages * PGSIZE);
    memcpy((void *)page, (void *)_sramdisk, size); // Copy program to memory.
    create_mapping(task->pgd, USER_START, VA2PA((uint64_t)page), size, 0b11111);
}

void load_program_elf(struct task_struct *task) {
    Elf64_Ehdr *ehdr = (Elf64_Ehdr *)_sramdisk; // Start of ELF header.
    Elf64_Phdr *phdrs = (Elf64_Phdr *)(_sramdisk + ehdr->e_phoff); // Start of program segments.
    for (int i = 0; i < ehdr->e_phnum; ++i) {
        Elf64_Phdr *phdr = phdrs + i; // Check every segment.
        if (phdr->p_type == PT_LOAD) {
            // Allocate space.
            uint64_t size = PGROUNDUP(phdr->p_memsz + phdr->p_offset); // Total size of segment after rounding up and alignment.
            uint64_t *page = (uint64_t *)alloc_pages(size / PGSIZE); // Allocate memory for program.
            memset((void *)page, 0x0, phdr->p_offset); // Clear memory.
            // Copy segment content to memory.
            memcpy((void *)((uint64_t)page + phdr->p_offset), (void *)((uint64_t)_sramdisk + phdr->p_offset), phdr->p_memsz); // Copy segment content to memory.
            memset((void *)((uint64_t)page + phdr->p_offset + phdr->p_filesz), 0x0, phdr->p_memsz - phdr->p_filesz); // Clear the rest of the segment.
            // Do mapping.
            create_mapping(task->pgd, PGROUNDDOWN(phdr->p_vaddr), VA2PA((uint64_t)page), size, 0b11111); // U | X | W | R | V
        }
    }
    task->thread.sepc = ehdr->e_entry;
}

void task_init() {
    srand(2024);

    // 1. 调用 kalloc() 为 idle 分配一个物理页
    idle = (struct task_struct *)kalloc();
    if (!idle) printk("Failed to allocate idle task!\n");

    // 2. 设置 state 为 TASK_RUNNING;
    // 3. 由于 idle 不参与调度，可以将其 counter / priority 设置为 0
    // 4. 设置 idle 的 pid 为 0
    idle->state = TASK_RUNNING;
    idle->counter = 0;
    idle->priority = 0;
    idle->pid = 0;

    // 5. 将 current 和 task[0] 指向 idle
    current = idle;
    task[0] = idle;

    // 1. 参考 idle 的设置，为 task[1] ~ task[NR_TASKS - 1] 进行初始化
    // 2. 其中每个线程的 state 为 TASK_RUNNING, 此外，counter 和 priority 进行如下赋值：
    //     - counter  = 0;
    //     - priority = rand() 产生的随机数（控制范围在 [PRIORITY_MIN, PRIORITY_MAX] 之间）
    // 3. 为 task[1] ~ task[NR_TASKS - 1] 设置 thread_struct 中的 ra 和 sp
    //     - ra 设置为 __dummy（见 4.2.2）的地址
    //     - sp 设置为该线程申请的物理页的高地址
    for (int i = 1; i < NR_TASKS; i++) {
        task[i] = (struct task_struct *)kalloc();
        task[i]->state = TASK_RUNNING;
        task[i]->counter = 0;
        task[i]->priority = rand() % (PRIORITY_MAX - PRIORITY_MIN + 1) + PRIORITY_MIN;
        task[i]->pid = i;
        task[i]->thread.ra = (uint64_t)__dummy;
        //task[i]->thread.sp = (uint64_t)PGROUNDUP((uint64_t)task[i]);
        task[i]->thread.sp = (uint64_t)kalloc() + PGSIZE;
        task[i]->thread.sepc = USER_START;
        uint64_t sstatus = csr_read(sstatus);
        sstatus |= (1 << 18 | 1 << 5);
        sstatus &= ~(1 << 8 | 1 << 9);
        task[i]->thread.sstatus = sstatus;
        task[i]->thread.sscratch = USER_END;

        // Create page table for user process.
        task[i]->pgd = (uint64_t *)alloc_page();
        memset((void *)task[i]->pgd, 0x0, PGSIZE);
        memcpy((void *)task[i]->pgd, (void *)swapper_pg_dir, PGSIZE);

        // Copy user app.
#if ELF
        printk("Loading ELF program...\n");
        load_program_elf(task[i]);
#else
        printk("Loading binary program...\n");
        load_program_bin(task[i]);
#endif

        // Create stack for user process.
        uint64_t *stack = (uint64_t *)alloc_page();
        memset((void *)stack, 0x0, PGSIZE);
        create_mapping(task[i]->pgd, USER_END - PGSIZE, VA2PA((uint64_t)stack), PGSIZE, 0b10111); // U | | W | R | V
    }

    printk("...task_init done!\n");
}

#if TEST_SCHED
#define MAX_OUTPUT ((NR_TASKS - 1) * 10)
char tasks_output[MAX_OUTPUT];
int tasks_output_index = 0;
char expected_output[] = "2222222222111111133334222222222211111113";
#include "sbi.h"
#endif

void dummy() {
    uint64_t MOD = 1000000007;
    uint64_t auto_inc_local_var = 0;
    int last_counter = -1;
    while (1) {
        if ((last_counter == -1 || current->counter != last_counter) && current->counter > 0) {
            if (current->counter == 1) {
                --(current->counter);   // forced the counter to be zero if this thread is going to be scheduled
            }                           // in case that the new counter is also 1, leading the information not printed.
            last_counter = current->counter;
            auto_inc_local_var = (auto_inc_local_var + 1) % MOD;
            printk("[PID = %d] is running. auto_inc_local_var = %d\n", current->pid, auto_inc_local_var);
            #if TEST_SCHED
            tasks_output[tasks_output_index++] = current->pid + '0';
            if (tasks_output_index == MAX_OUTPUT) {
                for (int i = 0; i < MAX_OUTPUT; ++i) {
                    if (tasks_output[i] != expected_output[i]) {
                        printk("\033[31mTest failed!\033[0m\n");
                        printk("\033[31m    Expected: %s\033[0m\n", expected_output);
                        printk("\033[31m    Got:      %s\033[0m\n", tasks_output);
                        sbi_system_reset(SBI_SRST_RESET_TYPE_SHUTDOWN, SBI_SRST_RESET_REASON_NONE);
                    }
                }
                printk("\033[32mTest passed!\033[0m\n");
                printk("\033[32m    Output: %s\033[0m\n", expected_output);
                sbi_system_reset(SBI_SRST_RESET_TYPE_SHUTDOWN, SBI_SRST_RESET_REASON_NONE);
            }
            #endif
        }
    }
}

/* 判断下一个执行的线程`next`与当前的线程`current`是否为同一个线程，如果是同一个线程，则无需做任何处理，否则调用`__switch_to`进行线程切换 */
extern void __switch_to(struct task_struct *prev, struct task_struct *next);

void switch_to(struct task_struct *next) {
    if (current != next) {
        struct task_struct *prev = current;
        current = next;
        printk("\033[32m[PID = %d PRIORITY = %d COUNTER = %d] --> [PID = %d PRIORITY = %d COUNTER = %d]\033[0m\n", prev->pid, prev->priority, prev->counter, next->pid, next->priority, next->counter);
        __switch_to(prev, next);
    }
}

void do_timer() {
    // 1. 如果当前线程是 idle 线程或当前线程时间片耗尽则直接进行调度
    // 2. 否则对当前线程的运行剩余时间减 1，若剩余时间仍然大于 0 则直接返回，否则进行调度
    if (current == idle || current->counter == 0) schedule();
    else if ((--current->counter) == 0) schedule();
    return ;
}

void schedule() {
    int maxCount = 0;
    int nextPid = 0;
    for (int i = 1; i < NR_TASKS; i++) {
        if (task[i]->counter > maxCount) {
            maxCount = task[i]->counter;
            nextPid = i;
        }
    }

    if (!maxCount) {
        for (int i = 1; i < NR_TASKS; i++) {
            task[i]->counter = task[i]->priority;
            printk("\033[34mSET [PID = %d PRIORITY = %d COUNTER = %d]\033[0m\n", task[i]->pid, task[i]->priority, task[i]->counter);
            if (task[i]->counter > maxCount) {
                maxCount = task[i]->counter;
                nextPid = i;
            }
        }
    }

    struct task_struct *next = task[nextPid];
    switch_to(next);
}