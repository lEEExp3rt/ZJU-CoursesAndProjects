#include<stdio.h>
int mid(int array[],int size,int obj)
{
    int i=0,j=size-1,midd;
    while(i<=j){
        midd=(i+j)/2;
        if(obj<array[midd]) j=midd-1;
        else i=midd+1;
    }
    /*while(obj<array[j]){
        j--;
    }*/
    return j;
}
int count(int array[],int size,int index,int len)
{
    int sum=0;
    for(int i=mid(array,size,index);array[i]<=index+len;i++){
        if(array[i]>=index) sum++;
    }
    return sum;
}
int judge(int array[],int size,int index,int len)
{
    int tempt=mid(array,size,index);
    if ((index-array[tempt]>array[tempt+1]-index-len)&&(array[tempt+1]-index-len>0)) return 1;
    else return 0;
}
int main()
{
    int n,h,tmp,max=0,min;
    scanf("%d %d",&n,&h);
    int coordinate[n];
    for (int i=0;i<n;i++){
        scanf("%d",&coordinate[i]);
    }
    int left=coordinate[n-1]-h;
    while(left>=coordinate[0]){
        tmp=count(coordinate,n,left,h);
        if(tmp>=max){
            max=tmp;
            min=left;
        }
        /*if(judge(coordinate,n,left,h)) left=coordinate[mid(coordinate,n,left)+1]-h;
        else left=coordinate[mid(coordinate,n,left)];*/
        left--;
    }
    printf("%d %d",min,max);
    return 0;
}
