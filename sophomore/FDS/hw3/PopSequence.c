#include<stdio.h>
void read(int array[],int n)
{
    for (int i=0;i<n;i++)
    {
        scanf("%d",&array[i]);
    }
    return ;
}
int check(int array[],int m,int n)
{
    int top=-1,min=1;
    int s[m];
    for (int i=0;i<n;i++)
    {
        if ((top==-1)||(array[i]>s[top])) {
            while(min<=array[i])
            {
                if (top>=m-1) return 0;
                s[++top]=min++;
            }
        }
        if(array[i]==s[top]) top--;
        else return 0; 
    }
    if (top==-1) return 1;
    else return 0;
}
int main()
{
    int M,N,K;
    scanf("%d %d %d",&M,&N,&K);
    int ans[K],data[N];
    for (int i=0;i<K;i++) 
    {
        read(data,N);
        ans[i]=check(data,M,N);
    }
    for (int i=0;i<K-1;i++) ans[i]?printf("YES\n"):printf("NO\n");
    ans[K-1]?printf("YES"):printf("NO");
    return 0;
}
