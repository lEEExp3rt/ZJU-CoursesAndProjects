/*
 * File: power.c
 */

#include<stdio.h>
#include"power.h"

double power1(double x,int N)
{
    double ans=1;
    for (int i=0;i<N;i++){
        ans*=x; //连续乘N次
    }
    return ans;
}

double rpower2(double x,int N)
{
    if (N==0) return 1; //递归终止
    double tmp=rpower2(x,N/2); //定义临时变量存储递归过程的函数值
    return N%2?tmp*tmp*x:tmp*tmp; //N奇偶的情况对应不同的计算
}

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
