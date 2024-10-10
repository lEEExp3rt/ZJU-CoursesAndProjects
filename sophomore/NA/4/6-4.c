#include <stdio.h>
#include <math.h>

#define MAX_SIZE 10
#define bound pow(2, 127)
#define ZERO 1e-9 /* X is considered to be 0 if |X|<ZERO */

enum bool { false = 0, true = 1 };
#define bool enum bool

int Jacobi( int n, double a[][MAX_SIZE], double b[], double x[], double TOL, int MAXN );

int Gauss_Seidel( int n, double a[][MAX_SIZE], double b[], double x[], double TOL, int MAXN );

int main()
{
    int n, MAXN, i, j, k;
    double a[MAX_SIZE][MAX_SIZE], b[MAX_SIZE], x[MAX_SIZE];
    double TOL;

    scanf("%d", &n);
    for (i=0; i<n; i++) {
        for (j=0; j<n; j++)
            scanf("%lf", &a[i][j]);
        scanf("%lf", &b[i]);
    }
    scanf("%lf %d", &TOL, &MAXN);

    printf("Result of Jacobi method:\n");
    for ( i=0; i<n; i++ )
        x[i] = 0.0;
    k = Jacobi( n, a, b, x, TOL, MAXN );
    switch ( k ) {
        case -2:
            printf("No convergence.\n");
            break;
        case -1: 
            printf("Matrix has a zero column.  No unique solution exists.\n");
            break;
        case 0:
            printf("Maximum number of iterations exceeded.\n");
            break;
        default:
            printf("no_iteration = %d\n", k);
            for ( j=0; j<n; j++ )
                printf("%.8f\n", x[j]);
            break;
    }
    printf("Result of Gauss-Seidel method:\n");
    for ( i=0; i<n; i++ )
        x[i] = 0.0;
    k = Gauss_Seidel( n, a, b, x, TOL, MAXN );
    switch ( k ) {
        case -2:
            printf("No convergence.\n");
            break;
        case -1: 
            printf("Matrix has a zero column.  No unique solution exists.\n");
            break;
        case 0:
            printf("Maximum number of iterations exceeded.\n");
            break;
        default:
            printf("no_iteration = %d\n", k);
            for ( j=0; j<n; j++ )
                printf("%.8f\n", x[j]);
            break;
    }

    return 0;
}

/* Your function will be put here */
void swap(double* obj1, double *obj2)
{
    double tmp = *obj1;
    *obj1 = *obj2;
    *obj2 = tmp;
    return;
}

bool maxchange(int n, int index, double a[][MAX_SIZE], double b[])
{
    double max = fabs(a[index][index]);
    int idx = index;
    for (int i = index + 1; i < n; i++)
    {
        if (fabs(a[i][index]) > max)
        {
            idx = i;
            max = fabs(a[i][index]);
        }
    }
    if (!max) // max == 0
    {
        for (int i = 0; i < index; i++)
        {
            if (fabs(a[i][index]) > max)
            {
                idx = i;
                max = fabs(a[i][index]);
            }
        }
        if (!max) return false;
        for (int col = 0; col < n; col++)
            a[index][col] += a[idx][col];
        b[index] += b[idx];
    }
    else
    {
        if (idx == index) return true;
        for (int col = 0; col < n; col++)
            swap(&a[idx][col], &a[index][col]);
        swap(&b[idx], &b[index]);
    }
    return true;
}

int Jacobi( int n, double a[][MAX_SIZE], double b[], double x[], double TOL, int MAXN )
{
    double A[MAX_SIZE][MAX_SIZE];
    double B[MAX_SIZE];
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
            A[i][j] = a[i][j];
        B[i] = b[i];
    }
    // change the element
    for (int row = 0; row < n; row++)
        if (!maxchange(n, row, A, B)) return -1;
    // Jacobi
    int iteration = 1;
    double X[MAX_SIZE];
    while (iteration <= MAXN)
    {
        for (int i = 0; i < n; i++)
        {
            double tmpsum = 0;
            for (int j = 0; j < n; j++)
            {
                if (j == i) continue;
                tmpsum += A[i][j] * x[j];
            }
            X[i] = (B[i] - tmpsum) / A[i][i];
        }
        double error = fabs(X[0] - x[0]);
        for (int k = 0; k < n; k++)
        {
            if (fabs(X[k] - x[k]) > error) error = fabs(X[k] - x[k]);
            if (fabs(x[k] > bound)) return -2;
            x[k] = X[k]; // iteration
        }
        if (error < TOL) return iteration;
        iteration++;
    }
    return 0;
}

int Gauss_Seidel( int n, double a[][MAX_SIZE], double b[], double x[], double TOL, int MAXN )
{
    double A[MAX_SIZE][MAX_SIZE];
    double B[MAX_SIZE];
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
            A[i][j] = a[i][j];
        B[i] = b[i];
    }
    // change the element
    for (int row = 0; row < n; row++)
        if (!maxchange(n, row, A, B)) return -1;
    // Gauss_Seidel
    int iteration = 1;
    double X[MAX_SIZE];
    while (iteration < MAXN)
    {
        for (int i = 0; i < n; i++)
        {
            double tmpsum = 0;
            for (int j = 0; j < i; j++)
                tmpsum += A[i][j] * X[j];
            for (int j = i + 1; j < n; j++)
                tmpsum += A[i][j] * x[j];
            X[i] = (B[i] - tmpsum) / A[i][i];
        }
        double error = fabs(X[0] - x[0]);
        for (int k = 0; k < n; k++)
        {
            if (fabs(X[k] - x[k]) > error) error = fabs(X[k] - x[k]);
            if (fabs(x[k] > bound)) return -2;
            x[k] = X[k]; // iteration
        }
        if (error < TOL) return iteration;
        iteration++;
    }
    return 0;
}
