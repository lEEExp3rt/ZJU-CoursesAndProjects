double ipower2(double x,int N)
{
    double ans=1;
    while (N>0) //迭代过程结束条件：N=0
    {
        if (N%2) ans*=x;
        x*=x; //幂运算升级
        N/=2; //迭代升级
     }
    return ans;
}
