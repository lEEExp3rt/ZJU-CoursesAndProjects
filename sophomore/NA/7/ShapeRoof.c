#include <stdio.h>
#include <math.h>

double f0( double x, double l, double t )
{
    return sqrt(1.0+l*l*t*t*cos(t*x)*cos(t*x));
}

double Integral(double a, double b, double (*f)(double x, double y, double z), 
double eps, double l, double t);

int main()
{
    double a=0.0, b, eps=0.005, l, t;

    scanf("%lf %lf %lf", &l, &b, &t);
    printf("%.2f\n", Integral(a, b, f0, eps, l, t));

    return 0;
}

/* Your function will be put here */
#define pi 3.141592689793
double Integral(double a, double b, double (*f)(double x, double y, double z), double eps, double l, double t)
{
    
    double T = pi / t;
    int n = (b - a) / T;
    double R1[3][1000];
    double R2[3][1000];
    double h1 = T;
    double h2 = b - a - n * T;
    R1[1][1] = h1 / 2 * (f0(0, l, t) + f0(T, l, t));
    R2[1][1] = h2 / 2 * (f0(a + n * T, l, t) + f0(b, l, t));
    for (int i = 2; ; i++)
    {
        double sum1 = 0;
        double sum2 = 0;
        for (int k = 1; k <= pow(2, i - 2); k++)
        {
            sum1 += f(0 + (k - 0.5) * h1, l, t);
            sum2 += f(a + n * T + (k - 0.5) * h2, l, t);
        }
        R1[2][1] = 1.0 / 2 * (R1[1][1] + h1 * sum1);
        R2[2][1] = 1.0 / 2 * (R2[1][1] + h2 * sum2);
        for (int j = 2; j <= i; j++)
        {
            R1[2][j] = R1[2][j - 1] + (R1[2][j - 1] - R1[1][j - 1]) / (pow(4, j - 1) - 1);
            R2[2][j] = R2[2][j - 1] + (R2[2][j - 1] - R2[1][j - 1]) / (pow(4, j - 1) - 1);
        }
        if (fabs(R1[1][i - 1] * n + R2[1][i - 1] - R1[2][i] * n - R2[2][i]) < eps)
            return (R1[2][i] * n + R2[2][i]) / 100;
        h1 = h1 / 2;
        h2 = h2 / 2;
        for (int j = 1; j <= i; j++)
        {
            R1[1][j] = R1[2][j];
            R2[1][j] = R2[2][j];
        }
    }
}
