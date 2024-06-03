#include <stdio.h>
#include <math.h>

#define ZERO 1e-13 /* X is considered to be 0 if |X|<ZERO */
#define MAXN 11    /* Max Polynomial Degree + 1 */

double Polynomial_Root(int n, double c[], double a, double b, double EPS);

int main()
{
    int n;
    double c[MAXN], a, b;
    double EPS = 0.00005;
    int i;

    scanf("%d", &n);
    for (i=n; i>=0; i--)
        scanf("%lf", &c[i]);
    scanf("%lf %lf", &a, &b);
    printf("%.4f\n", Polynomial_Root(n, c, a, b, EPS));

    return 0;
}

/* Your function will be put here */
double f(int n, double c[], double x)
{
    double ans = 0, tmp = 1;
    for (int i = 0; i <= n; i++)
    {
        ans += tmp * c[i];
        tmp *= x;
    }
    return ans;
}
double df(int n, double c[], double x) // f'(x)
{
    double ans = 0, tmp = 1;
    for (int i = 1; i <= n; i++)
    {
        ans += tmp * c[i] * i;
        tmp *= x;
    }
    return ans;
}
double ddf(int n, double c[], double x) // f''(x)
{
    double ans = 0, tmp = 1;
    for (int i = 2; i <= n; i++)
    {
        ans += tmp * c[i] * i * (i - 1);
        tmp *= x;
    }
    return ans;
}
double g(int n, double c[], double x) // g(x) = f(x) / f'(x)
{
    return f(n, c, x) / df(n, c, x);
}
double Polynomial_Root(int n, double c[], double a, double b, double EPS)
{
    if (a > b)
    {
        a = a + b;
        b = a - b;
        a = a - b;
    }
    double mid = (a + b) / 2;
    for (int cnt = 1; cnt < 1000; cnt++)
    {
        double x = mid - f(n, c, mid) * df(n, c, mid) / (df(n, c, mid) * df(n, c, mid) - f(n, c, mid) * ddf(n, c, mid));
        if (x < a || x > b) break;
        if (fabs(x - mid) < EPS) return x;
        mid = x;
    }
}
