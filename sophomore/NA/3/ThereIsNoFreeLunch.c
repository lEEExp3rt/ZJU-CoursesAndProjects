#include <stdio.h>

#define Max_size 10000 /* max number of dishes */

void Price( int n, double p[] );

int main()
{
    int n, i;
    double p[Max_size];

    scanf("%d", &n);
    for (i=0; i<n; i++) 
        scanf("%lf", &p[i]);
    Price(n, p);
    for (i=0; i<n; i++)
        printf("%.2f ", p[i]);
    printf("\n");

    return 0;
}

/* Your function will be put here */
void matrix_solution(int n, double* p, double* x)
{
    // v
    double v[Max_size + 1];
    double u[Max_size + 1];
    double l = 2;
    u[0] = 0.5 / l;
    v[0] = p[0] / l;
    for (int i = 1; i < n - 1; i++)
    {
        l = 2 - 0.5 * u[i - 1];
        u[i] = 0.5 / l;
        v[i] = (p[i] - 0.5 * v[i - 1]) / l;
    }
    l = 2 - 0.5 * u[n - 2];
    v[n - 1] = (p[n - 1] - 0.5 * v[n - 2]) / l;
    // u
    x[n - 1] = v[n - 1];
    for (int i = n - 2; i >= 0; i--)
    {
        x[i] = v[i] - u[i] * x[i + 1];
    }
    return;
}
void Price( int n, double p[] )
{
    double x[Max_size + 1];
    double p1[Max_size + 1] = {0};
    p1[0] = p1[n - 2] = -0.5;
    double u[Max_size + 1], v[Max_size + 1];
    matrix_solution(n - 1, p1, u); // u
    matrix_solution(n - 1, p ,v); // v
    x[n - 1] = (p[n - 1] - 0.5 * (v[0] + v[n - 2])) / (2 + 0.5 * (u[0] + u[n - 2]));
    for (int i = n - 2; i >= 0; i--)
    {
        x[i] = u[i] * x[n - 1] + v[i];
    }
    for (int i = 0; i < n; i++) p[i] = x[i];
    return;
}
