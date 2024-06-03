#include <stdio.h>

#define MAX_N 10

void Cubic_Spline(int n, double x[], double f[], int Type, double s0, double sn, double a[], double b[], double c[], double d[]);

double S(double t, double Fmax, int n, double x[], double a[], double b[], double c[], double d[]);

int main()
{
    int n, Type, m, i;
    double x[MAX_N], f[MAX_N], a[MAX_N], b[MAX_N], c[MAX_N], d[MAX_N];
    double s0, sn, Fmax, t0, tm, h, t;

    scanf("%d", &n);
    for (i = 0; i <= n; i++)
        scanf("%lf", &x[i]);
    for (i = 0; i <= n; i++)
        scanf("%lf", &f[i]);
    scanf("%d %lf %lf %lf", &Type, &s0, &sn, &Fmax);

    Cubic_Spline(n, x, f, Type, s0, sn, a, b, c, d);
    for (i = 1; i <= n; i++)
        printf("%12.8e %12.8e %12.8e %12.8e \n", a[i], b[i], c[i], d[i]);

    scanf("%lf %lf %d", &t0, &tm, &m);
    h = (tm - t0) / (double)m;
    for (i = 0; i <= m; i++)
    {
        t = t0 + h * (double)i;
        printf("f(%12.8e) = %12.8e\n", t, S(t, Fmax, n, x, a, b, c, d));
    }

    return 0;
}

/* Your functions will be put here */
void Cubic_Spline(int n, double x[], double f[], int Type, double s0, double sn, double a[], double b[], double c[], double d[])
{
    double h[MAX_N];
    double alpha[MAX_N];
    double l[MAX_N];
    double z[MAX_N];
    double u[MAX_N];
    for (int i = 0; i < n; i++)
        h[i] = x[i + 1] - x[i];
    for (int i = 0; i <= n; i++)
        a[i + 1] = f[i];
    alpha[0] = 3 * (f[1] - f[0]) / h[0] - 3 * s0;
    alpha[n] = 3 * (sn - (f[n] - f[n - 1]) / h[n - 1]);
    for (int i = 1; i < n; i++)
        alpha[i] = 3 * ((f[i + 1] - f[i]) / h[i] - (f[i] - f[i - 1]) / h[i - 1]);
    switch (Type)
    {
        case(1):
            l[0] = 2 * h[0];
            u[0] = 0.5;
            z[0] = alpha[0] / l[0];
            for (int i = 1; i < n; i++)
            {
                l[i] = 2 * (x[i + 1] - x[i - 1]) - h[i - 1] * u[i - 1];
                u[i] = h[i] / l[i];
                z[i] = (alpha[i] - h[i - 1] * z[i - 1]) / l[i];
            }
            l[n] = h[n - 1] * (2 - u[n - 1]);
            z[n] = (alpha[n] - h[n - 1] * z[n - 1]) / l[n];
            c[n + 1] = z[n];
            for (int i = n - 1; i >= 0; i--)
            {
                c[i + 1] = z[i] - u[i] * c[i + 2];
                b[i + 1] = (a[i + 2] - a[i + 1]) / h[i] - h[i] * (c[i + 2] + 2 * c[i + 1]) / 3;
                d[i + 1] = (c[i + 2] - c[i + 1]) / (3 * h[i]);
            }
            break;
        case(2):
            l[0] = 1;
            u[0] = 0;
            z[0] = 0;
            for (int i = 1; i < n; i++)
            {
                l[i] = 2 * (x[i + 1] - x[i - 1]) - h[i - 1] * u[i - 1];
                u[i] = h[i] / l[i];
                z[i] = (alpha[i] - h[i - 1] * z[i - 1]) / l[i];
            }
            l[n] = 1;
            z[n] = sn / 2;
            c[n + 1] = sn / 2;
            for (int i = n - 1; i >= 0; i--)
            {
                c[i + 1] = z[i] - u[i] * c[i + 2];
                b[i + 1] = (a[i + 2] - a[i + 1]) / h[i] - h[i] * (c[i + 2] - 2 * c[i + 1]) / 3;
                d[i + 1] = (c[i + 2] - c[i + 1]) / (3 * h[i]);
            }
            break;
    } 
}

double power(double x, int n)
{
    double ans = 1;
    for (int i = 1; i <= n; i++)
        ans *= x;
    return ans;
}

double S(double t, double Fmax, int n, double x[], double a[], double b[], double c[], double d[])
{
    int index = 0;
    if (x[0] > t || x[n] < t) return Fmax;
    for (; x[index] < t; index++);
    if (t == x[0]) index++;
    double tmp = t - x[index - 1];
    return a[index] + b[index] * tmp + c[index] * power(tmp, 2) + d[index] * power(tmp, 3);
}
