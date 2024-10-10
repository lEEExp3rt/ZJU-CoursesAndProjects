#include "stack.h"
#include <stdio.h>

// 初始化栈
void initialize(Stack *stack) {
    stack->top = -1;
}

// 检查栈是否为空
int isEmpty(Stack *stack) {
    return stack->top == -1;
}

// 检查栈是否已满
int isFull(Stack *stack) {
    return stack->top == MAX_SIZE - 1;
}

// 入栈操作
void push(Stack *stack, int value) {
    if (isFull(stack)) {
        printf("Error: Stack is full.\n");
        return;
    }
    stack->data[++stack->top] = value;
}

// 出栈操作
int pop(Stack *stack) {
    if (isEmpty(stack)) {
        printf("Error: Stack is empty.\n");
        return -1; // 返回一个特殊值表示错误
    }
    return stack->data[stack->top--];
}
