#include <stdio.h>
#include <math.h>

#define MAX_m 200
#define MAX_n 5

double f1(double x)
{
    return sin(x);
}

double f2(double x)
{
    return exp(x);
}

int OPA( double (*f)(double t), int m, double x[], double w[], double c[], double *eps );

void print_results( int n, double c[], double eps)
{    
    int i;

    printf("%d\n", n);
    for (i=0; i<=n; i++)
        printf("%12.4e ", c[i]);
    printf("\n");
    printf("error = %9.2e\n", eps);
    printf("\n");
}

int main()
{
    int m, i, n;
    double x[MAX_m], w[MAX_m], c[MAX_n+1], eps;

    m = 90;
    for (i=0; i<m; i++) {
        x[i] = 3.1415926535897932 * (double)(i+1) / 180.0;
        w[i] = 1.0;
    }
    eps = 0.001;
    n = OPA(f1, m, x, w,c, &eps);
    print_results(n, c, eps);

    m = 200;
    for (i=0; i<m; i++) {
        x[i] = 0.01*(double)i;
        w[i] = 1.0;
    }
    eps = 0.001;
    n = OPA(f2, m, x, w,c, &eps);
    print_results(n, c, eps);

    return 0;
}

/* Your function will be put here */
double sum(int m, double x[], double fx[], double w[], double* f,int flagf, double* g,int flagg)
{
    double ret = 0;
    for (int i = 0; i < m; i++)
    {
        double sumf = 0;
        double sumg = 0;
        for (int j = 0; j <= MAX_n; j++)
        {
            sumf +=  f[j] * pow(x[i], j);
            sumg +=  g[j] * pow(x[i], j);
        }
        sumf = (flagf == 0) ? sumf : fx[i];
        sumg = (flagg == 0) ? sumg : fx[i];
        ret += w[i] * sumg * sumf;
    }
    return ret;
}

int OPA(double (*f)(double t), int m, double x[], double w[], double c[], double* eps)
{
    double fx[m];
    for (int i = 0; i < m; i++)
    {
        fx[i] = f(x[i]);
    }

    double phi0[MAX_n+1] = { 0 };
    double phi1[MAX_n+1] = { 0 };
    double phi2[MAX_n+1] = { 0 };
    phi0[0] = 1;

    double y[MAX_n+1] = {0};
    y[1] = 1;

    double a0=sum(m, x, fx, w, phi0, 0,y,1) / sum(m, x, fx, w, phi0,0, phi0, 0);

    for (int i = 0; i <= MAX_n; i++)
    {
        c[i] = phi0[i] * a0;
    }

    double error = sum(m, x, fx, w, y,1, y, 1) - a0 * sum(m, x, fx, w, phi0,0, y,1 );

    double xphi0[MAX_n+1] = {0};
    for (int i = 0; i < MAX_n; i++)
        xphi0[i+1] = phi0[i];

    double B1 = sum(m, x, fx, w, xphi0,0, phi0, 0) / sum(m, x, fx, w, phi0,0, phi0, 0);

    phi1[0] = -B1;
    phi1[1] = 1;

    a0 = sum(m, x, fx, w, phi1, 0, y, 1) / sum(m, x, fx, w, phi1,0, phi1, 0);
    for (int i = 0; i <= MAX_n; i++)
    {
        c[i] += a0 * phi1[i];
    }

    error -= a0 * sum(m, x, fx, w, phi1,0, y, 1);
    int iteration = 1;

    while (iteration < MAX_n && fabs(error) >= *eps)
    {
        iteration++;
        xphi0[0] = 0;
        for (int i = 0; i < MAX_n; i++)
            xphi0[i+1] = phi1[i];

        B1 = sum(m, x, fx, w, xphi0,0, phi1,0) / sum(m, x, fx, w, phi1,0, phi1, 0);

        double C1 = sum(m, x, fx, w, xphi0,0, phi0, 0) / sum(m, x, fx, w, phi0,0, phi0, 0);

        phi2[0] = 0;
        if (phi1[MAX_n] != 0) {
            *eps = error;
            return iteration;
        }
        for (int i = 0; i < MAX_n; i++)
            phi2[i + 1] = phi1[i];

        for (int i = 0; i <= MAX_n; i++)
            phi2[i] = phi2[i] - B1 * phi1[i] - C1 * phi0[i];

        double t1 = sum(m, x, fx, w, phi2, 0, y, 1);
        double t2 = sum(m, x, fx, w, phi2, 0, phi2, 0);
        a0 =  t1/t2 ;

        for (int i = 0; i <= MAX_n; i++)
            c[i] += a0 * phi2[i];

        error -= a0 * sum(m, x, fx, w, phi2,0, y, 1);
        for (int i = 0; i <= MAX_n; i++)
        {
            phi0[i] = phi1[i];
            phi1[i] = phi2[i];
        }
    }
    *eps = error;
    return iteration;
}
