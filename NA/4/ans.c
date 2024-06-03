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
int _n;
double _a[MAX_SIZE][MAX_SIZE];
double _b[MAX_SIZE];

int changeline(){
	for (int i = 0; i < _n; i++){
        double max = fabs(_a[i][i]);
        int index = i;
        for (int j = i; j < _n; j++){
            if (fabs(_a[j][i]) > max){
                max = fabs(_a[j][i]);
                index = j;
            }
        }
        if(max == 0){
            for (int j = 0; j < i; j++){
                if (fabs(_a[j][i]) > max){
                    max = fabs(_a[j][i]);
                    index = j;
                }
            }
            if(max==0) return -1;//可能是这里
            for(int j = 0;j < _n; j++) 
                _a[i][j]+=-_a[index][j];
            _b[i] += _b[index];
        }else{
            if(index == i) continue;//如果aii已经是i列最大元素，继续 
		    for (int k = 0; k < _n; k++){
        	    double temp = _a[i][k]; _a[i][k] = _a[index][k]; _a[index][k] = temp;
    	    }
    	    double temp = _b[i] ;_b[i] = _b[index]; _b[index] = temp;
	       }
        }
}

int Jacobi(int n, double a[][MAX_SIZE], double b[], double x[], double TOL, int MAXN){
	_n = n;
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++)
			_a[i][j] = a[i][j];
		_b[i] = b[i];
	}
	if(changeline()==-1) return -1;
    int k = 1;
    double x2[MAX_SIZE];
    while (k <= MAXN){//迭代 
        for (int i = 0; i < n; i++){//行 
            double sum = 0;
            for(int j = 0; j < n; j++){//每行的所有元素 
                if (j == i) continue;
                sum += x[j] * _a[i][j];
            }
            x2[i] = (_b[i] - sum) / _a[i][i];
		}
		double maxerror = fabs(x2[0] - x[0]);
        for (int j = 0; j < n; j++){
            if (fabs(x2[j] - x[j]) > maxerror) 
				maxerror = fabs(x2[j]-x[j]);
			if (fabs(x[j]) > bound)  return -2;
			x[j] = x2[j];  				
        }
        if(maxerror < TOL) return k; 
        k++;
    }
	return 0;
}

int Gauss_Seidel(int n, double a[][MAX_SIZE], double b[], double x[], double TOL, int MAXN){
	_n = n;
	for(int i=0;i<n;i++){
		for(int j=0;j<n;j++)
			_a[i][j] = a[i][j];
		_b[i] = b[i];
	}
    
	if(changeline()==-1) return -1;//这里出去。
    int k = 1;
    double x2[MAX_SIZE];
    while ( k <= MAXN ){//迭代 
        for (int i = 0; i < _n; i++){//行 
            double sum = 0;
            for(int j = 0; j < i; j++)//每行的所有元素 
                sum += x2[j] * _a[i][j];
            for(int j=i+1;j<n;j++)
            	sum += x[j] * _a[i][j];
            x2[i] = (_b[i] - sum) / _a[i][i];
		}
		double maxerror = fabs(x2[0] - x[0]);
        for (int j = 0; j < _n; j++){
            if (fabs(x2[j] - x[j]) > maxerror) 
				maxerror = fabs(x2[j] - x[j]);
			if (fabs(x2[j] > bound)) return -2;
			x[j] = x2[j];
        }
        if(maxerror < TOL) return k;
        k++;
    }
    return 0;
}
