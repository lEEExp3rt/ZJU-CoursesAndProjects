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
void CF(double* p, int n,double* x){
	double z[10001];
	double u[10001]; 
	z[0]=p[0]/2;
	u[0]=0.25;
	double l;
	for(int i=1;i<n-1;i++){
		l=2-0.5*u[i-1];
		u[i]=0.5/l;
		z[i]=(p[i]-0.5*z[i-1])/l;
	}
	l=2-0.5*u[n-2];
	z[n-1]=(p[n-1]-0.5*z[n-2])/l;
	x[n-1]=z[n-1];
	for(int i=n-2;i>=0;i--){
		x[i]=z[i]-u[i]*x[i+1];
	}
}
void Price( int n, double p[] ){
	double p1[10001];
	p1[0]=p1[n-2]=-0.5;
	for(int i=1;i<n-2;i++) p1[i]=0;
	double u[10001],v[10001];
	CF(p1,n-1,u);
	CF(p,n-1,v);
	double x[10001];
	x[n-1]=(p[n-1]-0.5*v[0]-0.5*v[n-2])/(2+0.5*u[0]+0.5*u[n-2]);
	for(int i=0;i<n-1;i++){
		x[i]=u[i]*x[n-1]+v[i];
	}
	for(int i=0;i<n;i++){
		p[i]=x[i];
	}
}
