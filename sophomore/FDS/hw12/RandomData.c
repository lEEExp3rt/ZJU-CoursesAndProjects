#include<stdio.h>
#include<stdlib.h>
#define N 110

int main()
{
    int num = rand() % N;
    int state[N] = {0};
    printf("%d\n", N);
    for (int i = 0; i < N; i++)
    {
        while (state[num])
        {
            num = rand() % N;
        }
        state[num] = 1;
        printf("%d ", num);
    }
    return 0;
}
