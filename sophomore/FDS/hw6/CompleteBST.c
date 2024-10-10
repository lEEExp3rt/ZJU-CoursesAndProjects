#include<stdio.h>
#include<stdlib.h>
int index=0;
void sort(int array[],int size) //Selection sort the array
{
    int k,tmp,i,j;
    for (i=0;i<size-1;i++)
    {
        k=i;
        for (j=i+1;j<size;j++)
        {
            if (array[j]<array[k]) k=j;
        }
        if (k!=i)
        {
            tmp=array[i];
            array[i]=array[k];
            array[k]=tmp;
        }
    }
}
void traverse(int data[],int ans[],int position,int size) 
{
    if (position>size) return;
    traverse(data,ans,2*position,size);
    ans[position]=data[index++];
    traverse(data,ans,2*position+1,size);
    return;
}
int main()
{
    int N;
    scanf("%d",&N);
    int data[N],ans[N+1];
    for (int i=0;i<N;i++) scanf("%d",&data[i]);
    sort(data,N);
    traverse(data,ans,1,N+1);
    printf("%d",ans[1]);
    for (int i=2;i<=N+1;i++) printf(" %d",ans[i]);
    return 0;
}
