#include <stdio.h>

#define MAXN 10
#define MAXS 1000

int need_time(const int time[], const int score[], int happy_score, int n);

int main()
{
    int n, i, happy_score;
    int time[MAXN], score[MAXN];
    scanf("%d %d", &n, &happy_score);
    for (i = 0; i < n; ++i)
        scanf("%d", &time[i]);
    for (i = 0; i < n; ++i)
        scanf("%d", &score[i]);
    printf("%d\n", need_time(time, score, happy_score, n));
    return 0;
}

/* Your function will be put here */
int MinTime(const int time[], const int score[], int happy_score, int n, int index, int current_time, int current_score, int minTime)
{
    // Halt condition.
    if (current_score >= happy_score && current_time < minTime) {
        minTime = current_time;
        return current_time;
    } else if (index == n)
        return -1;
    // Keep recursion.
    int timer1 = MinTime(time, score, happy_score, n, index + 1, current_time, current_score, minTime); 
    int timer2 = MinTime(time, score, happy_score, n, index + 1, current_time + time[index], current_score + score[index], minTime); 
    if (timer1 == -1)
        return timer2;
    if (timer2 == -1)
        return timer1;
    return timer1 < timer2 ? timer1 : timer2;
}

int need_time(const int time[], const int score[], int happy_score, int n)
{
    int minTime = 1;
    for (int i = 0; i < n; i++)
        minTime += time[i];
    int timer1 = MinTime(time, score, happy_score, n, 0, 0, 0, minTime);
    int timer2 = MinTime(time, score, happy_score, n, 0, time[0], score[0], minTime);
    if (timer1 == -1)
        return timer2;
    if (timer2 == -1)
        return timer1;
    return timer1 < timer2 ? timer1 : timer2;
}
