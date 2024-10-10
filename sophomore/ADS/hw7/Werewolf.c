#include <stdio.h>
#include <stdlib.h>

/**
 * Check if l_num == l
 */
int validate(const int statValue[], const int statWolf[], const int isWolf[], const int n, const int m, const int l)
{
    int l_num = 0;
    int wolf = 0; // At least 1 wolf lied.
    for (int i = 0; i < n && l_num <= l; i++) {
        if (isWolf[statValue[i]] != statWolf[i]) {
            l_num++;
            if (isWolf[i])
                wolf++;
        }
    }
    return (l_num == l && wolf > 0 && wolf < m);
}

int judge(const int statValue[], const int statWolf[], const int n, const int m, const int l, int index, int isWolf[], int this, int m_num)
{
    isWolf[index] = this;
    m_num += this;
    // Cut path.
    if (index + 1 + m_num < m)
        return 0;
    // Halt.
    if (!index) {
        if (m_num != m) 
            return 0;
        if (!validate(statValue, statWolf, isWolf, n, m, l))
            return 0;
        return 1;
    }
    // Player[index - 1] is a Wolf.
    if (judge(statValue, statWolf, n, m, l, index - 1, isWolf, 1, m_num))
        return 1;
    // Player[index - 1] is not a Wolf.
    if (judge(statValue, statWolf, n, m, l, index - 1, isWolf, 0, m_num))
        return 1;
    return 0;
}

// Print out wolves.
void Print(const int isWolf[], const int n, const int m)
{
    int mm = 0;
    for (int i = n - 1; i >= 0; i--)
        if (isWolf[i])
            printf((++mm != m ? "%d " : "%d\n"), i + 1);
    return ;
}

int main()
{
    int N, M, L;
    scanf("%d %d %d", &N, &M, &L);
    int statValue[N];
    int statWolf[N]; // 1 for wolf and 0 for human
    int isWolf[N];
    for (int index = 0; index < N; index++) {
        int tmp;
        scanf("%d", &tmp);
        statValue[index] = abs(tmp) - 1;
        statWolf[index] = (tmp < 0 ? 1 : 0);
    }
    if (judge(statValue, statWolf, N, M, L, N - 1, isWolf, 1, 0))
        Print(isWolf, N, M);
    else if (judge(statValue, statWolf, N, M, L, N - 1, isWolf, 0, 0))
        Print(isWolf, N, M);
    else
        printf("No Solution\n");
    return 0;
}
