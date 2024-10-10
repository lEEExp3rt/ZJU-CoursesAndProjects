#include <stdio.h>

void Series_Sum( double sum[] );

int main()
{
    int i;
    double x, sum[3001];
    
    Series_Sum( sum );

    x = 0.0;
    for (i=0; i<3001; i++)
        printf("%6.2f %16.12f\n", x + (double)i * 0.10, sum[i]);

    return 0;
}

/* Your function will be put here */
double f(int x)
{
    double ans = 0.0;
    for (int i = 1; i <= x; i++) ans += 1.0 / i;
    return ans / (double)x;
}

void Series_Sum( double sum[] )
{
    int n = 1000;
    sum[0] = 1.644934066848;
    for (int i = 0; i < 300; i++)
    {
        for (int j = 1; j <= 10; j++)
        {
            int x = 10 * i + j;
            double dx = x * 0.1;
            sum[x] = 0;
            for (int k = 1; k < n; k++)
            {
                sum[x] += 1.0 / ((double)k * ((double)k + dx) * ((double)k + (double)i + 1.0) * ((double)k + (double)i + 2.0) * ((double)k + (double)i + 3.0));
            }
            sum[x] = f(i + 1) + ((double)i + 1.0 - dx) * (((double)i + 2.0 - dx) * (((double)i + 3.0 - dx) * sum[x] + 0.5 * f(i + 1) - f(i + 2) + 0.5 * f(i + 3)) + f(i + 1) - f(i + 2));
        }
    }
}
