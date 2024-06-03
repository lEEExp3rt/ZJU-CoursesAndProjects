/*
 * File: timetest.c
 */

#include<stdio.h>
#include<time.h>
#include"power.h" //将实验用到的三个幂运算函数写入库

/*全局变量定义*/
clock_t start,stop; //设置时间点用于计时
double duration; //时间间隔
int tick; //ticks记录

/*函数声明*/
double timer(clock_t,clock_t); //用于计算时间间隔
int ticks(clock_t,clock_t); //用于计算ticks

/*主程序入口*/
int main()
{
    double x=1.0001; //定义x
    int N[8]={1000,5000,10000,20000,40000,60000,80000,100000}; //幂指数N
    int K; //迭代次数K
    double tmp; //用于幂运算结果的赋值
    /*Functions time test here*/
    /*Function1: power1*/
    printf("-----Algorithm1-----\n");
    K=50000; //预实验结果
    for (int i=0;i<8;i++) //对每个N都进行测试
    {
        K=5000000000/N[i]; //迭代次数选择
        start=clock(); //计时开始
        for (int j=0;j<K;j++)
        {
            tmp=power1(x,N[i]); //迭代K次运算
        }
        stop=clock();
        tick=ticks(start,stop);
        duration=timer(start,stop);
        printf("-*-*-*-*-*-\nN=%d\nK=%d\nTicks=%d\nTotal time=%.9lf\nDuration=%.9lf\n",N[i],K,tick,duration,duration/K); //输出结果
    }
    /*Function2: rpower2*/
    printf("-----Recursive Algorithm2-----\n");
    K=200000000; //预实验结果
    for (int i=0;i<8;i++) //对每个N都进行测试
    {
        start=clock(); //计时开始
        for (int j=0;j<K;j++)
        {
            tmp=rpower2(x,N[i]); //迭代K次运算
        }
        stop=clock();
        tick=ticks(start,stop);
        duration=timer(start,stop);
        printf("-*-*-*-*-*-\nN=%d\nK=%d\nTicks=%d\nTotal time=%.9lf\nDuration=%.9lf\n",N[i],K,tick,duration,duration/K);
    }
    /*Function3: ipower2*/ 
    printf("-----Iterative Algorithm2-----\n");
    K=500000000; //预实验结果
    for (int i=0;i<8;i++) //对每个N都进行测试
    {
        start=clock(); //计时开始
        for (int j=0;j<K;j++)
        {
            tmp=ipower2(x,N[i]); //迭代K次运算
        }
        stop=clock();
        tick=ticks(start,stop);
        duration=timer(start,stop);
        printf("-*-*-*-*-*-\nN=%d\nK=%d\nTicks=%d\nTotal time=%.11lf\nDuration=%.11lf\n",N[i],K,tick,duration,duration/K);
    }
    return 0;
}

/*函数定义*/
/*
 * 函数：timer
 * 本函数用于计算算法用时，返回单位为秒
 */
double timer(clock_t begin,clock_t end)
{
    return ((double)(end-begin))/CLOCKS_PER_SEC;
}

/*
 * 函数：ticks
 * 本函数用于计算ticks
 */
int ticks(clock_t begin,clock_t end)
{
    return (int)(end-begin);
}
