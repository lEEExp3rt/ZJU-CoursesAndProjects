#include <stdio.h>

#define MAX_SIZE 10

int EigenV(int n, double a[][MAX_SIZE], double *lambda, double v[], double TOL, int MAXN);

int main()
{
    int n, MAXN, m, i, j, k;
    double a[MAX_SIZE][MAX_SIZE], v[MAX_SIZE];
    double lambda, TOL;

    scanf("%d", &n);
    for (i=0; i<n; i++) 
        for (j=0; j<n; j++) 
            scanf("%lf", &a[i][j]);
    scanf("%lf %d", &TOL, &MAXN);
    scanf("%d", &m);
    for (i=0; i<m; i++) {
        scanf("%lf", &lambda);
        for (j=0; j<n; j++)
            scanf("%lf", &v[j]);
        switch (EigenV(n, a, &lambda, v, TOL, MAXN)) {
            case -1: 
                printf("%12.8f is an eigenvalue.\n", lambda );
                break;
            case 0:
                printf("Maximum number of iterations exceeded.\n");
                break;
            case 1:
                printf("%12.8f\n", lambda );
                for (k=0; k<n; k++)
                    printf("%12.8f ", v[k]);
                printf("\n");
                break;
        }
    }

    return 0;
}

/* Your function will be put here */
#include<math.h>
#define bound pow(2, 127)
int max_index(double* v, int N)
{
    double max = fabs(v[0]);
    int index = 0;
    for (int i = 1; i < N; i++)
    {
        if (fabs(v[i]) > max)
        {
            max = fabs(v[i]);
            index = i;
        }
    }
    return index;
}

int LU(int n, double a[][MAX_SIZE], double x[], double b[])
{
    double L[MAX_SIZE][MAX_SIZE];
    double U[MAX_SIZE][MAX_SIZE];
    double y[MAX_SIZE] = {0};
    for (int i = 0; i < n; i++)
    {
        L[i][i] = 1;
        for (int j = i; j < n; j++)
        {
            double sum = 0;
            for (int k = 0; k < i; k++)
            {
                sum += L[i][k] * U[k][j];
            }
            U[i][j] = a[i][j] - sum;
        }
        for (int j = i + 1; j < n; j++)
        {
            double sum = 0;
            for (int k = 0; k < i; k++)
            {
                sum += L[j][k] * U[k][i];
            }
            if (!U[i][i]) return -1;
            L[j][i] = (a[j][i] - sum) / U[i][i];
        }
    }
    y[0] = b[0];
    for (int i = 1; i < n; i++)
    {
        double sum = 0;
        for (int j = 0; j < i; j++)
        {
            sum += L[i][j] * y[j];
        }
        y[i] = b[i] - sum;
    }
    for (int i = n - 1; i >= 0; i--)
    {
        if (!U[i][i]) return -1;
        double sum = 0;
        for (int j = i + 1; j < n; j++)
        {
            sum += U[i][j] * x[j];
        }
        x[i] = (y[i] - sum) / U[i][i];
    }
    return 0;
}

int EigenV(int n, double a[][MAX_SIZE], double* lambda, double x0[], double TOL, int MAXN)
{
    double y[MAX_SIZE] = {0};
    double a2[MAX_SIZE][MAX_SIZE] = {0};
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {    
            if (i == j) a2[i][j] = a[i][i] - *lambda;
            else a2[i][j] = a[i][j];
        }
    }
    int iteration = 1;
    int p = max_index(x0, n);
    double max = x0[p];
    for (int i = 0; i < n; i++) x0[i] /= max;
    while (iteration <= MAXN)
    {
        if (LU(n, a2,  y, x0) == -1)
            return -1;
        double u = y[p];
        p = max_index(y, n);
        double error[MAX_SIZE];
        for(int i = 0; i < n; i++)
            error[i] = x0[i] - y[i] / y[p];

        for (int i = 0; i < n; i++) x0[i] = y[i] / y[p];
        if (fabs(error[max_index(error,n)]) < TOL)
        {
            *lambda = 1.0 / u + *lambda;
            return 1;
        }
        iteration++;
    }
    return 0;
}
