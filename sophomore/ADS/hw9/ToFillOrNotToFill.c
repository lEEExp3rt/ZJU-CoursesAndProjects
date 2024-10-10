#include <stdio.h>

int main()
{
    int Cmax, D, Davg, N;
    double cnt = 0;
    scanf("%d %d %d %d", &Cmax, &D, &Davg, &N);

    double price[N];
    int dist[N];

    int index[N], isUsed[N];

    int path[2 * N];
    int pathSize = 0;
    int isSuccess = 0;
    for (int i = 0; i < N; i++) {
        scanf("%lf %d", &price[i], &dist[i]);
        if (!dist[i])
            isSuccess = 1;
        index[i] = -1;
        isUsed[i] = 0;
    }
    if (!isSuccess) {
        printf("The maximum travel distance = 0.00");
        return 0;
    }
    // Sort by price.
    for (int i = 0; i < N; i++) {
        int j = 0;
        for (; isUsed[j]; j++);
        index[i] = j;
        for (; j < N; j++) {
            if (isUsed[j])
                continue;
            if (price[j] < price[index[i]])
                index[i] = j;
        }
        isUsed[index[i]] = 1;
    }
    // Run.
    for (int i = 0; i < N; i++) {
        int lower = dist[index[i]];
        int upper = lower + Cmax * Davg;
        for (int j = 0; j < pathSize; j++) {
            if (lower > path[2 * j] && lower < path[2 * j + 1]) {
                lower = path[2 * j + 1];
            }
            if (upper > path[2 * j] && upper < path[2 * j + 1])
                upper = path[2 * j];
        }
        if (upper > D)
            upper = D;
        int len = (upper > lower ? upper - lower : 0);
        if (len) {
            path[2 * pathSize] = lower;
            path[2 * pathSize + 1] = upper;
            pathSize++;
        }
    }

}
