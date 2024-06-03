#include<stdio.h>
#include<stdlib.h>

#define MAXN 1000

typedef struct 
{
    int data[MAXN];
    int top;
}Stack;

Stack* Initialize(void) // Initialize the stack.
{
    Stack* s = (Stack*)malloc(sizeof(Stack));
    s->top = -1;
    return s;
}

int IsEmpty(Stack* s) // Check if the stack is empty.
{
    return s->top == -1; // 1 for empty and 0 for not empty.
}

void Push(Stack* s, int obj) // Push the obj into the stack.
{
    s->data[++s->top] = obj;
    return ;
}

int Pop(Stack* s) // Pop the top element from the stack.
{
    if (IsEmpty(s)) return 0; // Return 0 when the stack is empty to pop.
    return s->data[s->top--]; // Return the top value. 
}

void Enqueue(Stack* s1, int obj) // Enqueue the obj.
{
    Push(s1, obj);
    return ;
}

int Dequeue(Stack* s1, Stack* s2, int time[], int index) // Dequeue.
{
    if (IsEmpty(s2)) // S2 is empty.
    {
        time[index] = (s1->top + 1) * 2 + 1;
        while (!IsEmpty(s1))
        {
            Push(s2, Pop(s1)); // Transfer everything in s1 into s2 in order.
        } 
    }
    else
    {
        time[index] = 1;
    }
    return Pop(s2);
}

int main()
{
    Stack* s1 = Initialize();
    Stack* s2 = Initialize();
    int N, index = 0;
    scanf("%d", &N);
    int ans[N], time[N];
    for (int i = 0; i < N; i++) // Read the data from input.
    {
        char Operation = getchar();
        scanf("%c", &Operation); // Read the operand.
        switch (Operation)
        {
            case 'I': // Enqueue case.
                int Element;
                scanf("%d", &Element); // Read the element.
                Enqueue(s1, Element);
                break;
            case 'O': // Dequeue case.
                ans[index] = Dequeue(s1, s2, time, index);
                index++;
                break;
        }
    }
    for (int i = 0; i < index; i++) // Output the answer.
    {
        ans[i] ? printf("%d %d\n", ans[i], time[i]) : printf("ERROR\n");
    }
    return 0;
}
