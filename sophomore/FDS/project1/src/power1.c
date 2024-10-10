double power1(double x,int N)
{
    double ans=1;
    for (int i=0;i<N;i++){
        ans*=x; //连续乘N次
    }
    return ans;
}
