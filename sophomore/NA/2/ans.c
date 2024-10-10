double f(int n,double c[],double x){
	double ret=0;
	for(int i=n;i>=0;i--){
		ret=ret*x+c[i];
	}
	return ret;
}
double f1(int n,double c[],double x){
	double ret=0;
	for(int i=n;i>=1;i--){
		ret=ret*x+c[i]*i;
	}
	return ret;
}
double f2(int n,double c[],double x){
	double ret=0;
	for(int i=n;i>=2;i--){
		ret=ret*x+c[i]*i*(i-1);
	}
	return ret;
} 
double Polynomial_Root(int n, double c[], double a, double b, double EPS){
    if(a>b){
		double tem=a;a=b;b=tem;
	}
	for(double  j=0;j<2;j++){
		double x=a+(b-a)*j/2;
		for(int i=1;i<1000;i++){
			double fb=f1(n,c,x)*f1(n,c,x)-f(n,c,x)*f2(n,c,x);
			double xn=x-f(n,c,x)*f1(n,c,x)/fb;
			if(xn>b||xn<a) break;
			if(fabs(x-xn)<EPS){
                return xn;
			}
			x=xn;
		}
	}
}

