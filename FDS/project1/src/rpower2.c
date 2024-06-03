double rpower2(double x,int N)
{
    if (N==0) return 1; //N=0的情况
    if (N==1) return x; //N=1的情况
    else //其他情况
    {
        double tmp=rpower2(x,N/2); //定义临时变量存储递归过程的函数值
        return N%2?tmp*tmp*x:tmp*tmp; //N奇偶的情况对应不同的计算
    }
}
