#include<stdio.h>
int main()
{
    int N, size = 0; // The input sequence size.
    scanf("%d", &N);
    int data[N]; // Record input data array.
    for (int i = 0; i < N; i++) // Read in the sequence.
    {
        scanf("%d", &data[i]);
        if (data[i] >= 0) size++;
    }

    int degree[N];
    int adjacent[N][N];
    for (int i = 0; i < N; i++) // Initialize.
    {
        degree[i] = 0;
        for (int j = 0; j < N; j++) adjacent[i][j] = 0;
    }

    for (int index = 0; index < N; index++)
    {
        if (data[index] < 0) continue; // Omit the empty case.
        int r = data[index] % N;
        if (r == index) degree[index] = 0; // No collision happens.
        else  // Collision happens.
        {
            // Compute degree.
            degree[index] = index < r ? index : index - r;
            // Add edge.
            int source = r;
            while (source != index)
            {
                adjacent[source][index] = 1;
                if (source == N - 1) source = 0;
                else source++;
            }
        }
    } 

    int state[N];
    int ans[size]; // The output answer is stored in this array.
    for (int i = 0; i < N; i++) state[i] = 0; // Initialze.
    for (int cnt = 0; cnt < size; cnt++)
    {
        int minIndex = 0;
        while (state[minIndex]) minIndex++; // Use the first unused element as the first minimum element.
        int index = minIndex;
        while (index < N)
        {
            if (!state[index] && !degree[index] && data[index] >= 0  && data[index] < data[minIndex]) // Find the minimum element
            {
                minIndex = index;
            }
            index++;
        }
        ans[cnt] = data[minIndex];
        state[minIndex] = 1;
        for (int i = 0; i < N; i++)
        {
            if (adjacent[minIndex][i]) degree[i]--;
        }
    }

    printf("%d", ans[0]);
    for (int cnt = 1; cnt < size; cnt++) printf(" %d", ans[cnt]);
    return 0;
}
