#include<cstdio>
#include<queue>
#include<algorithm>
using namespace std;
 
const int maxn = 100000;
int item[maxn];
int coupon[maxn];
//Sorting function, arranged in descending order
bool cmp(int a, int b)
{
    return a>b;
}
struct node{
    int i,j;
    friend bool operator < (node a, node b){
        return item[a.i]-coupon[a.j]>item[b.i]-coupon[b.j];
    }//overloading the less-than operator
};
int main()
{
    int N,D;
    //input
    scanf("%d%d",&N,&D);
    for(int i=0; i<N; i++){
        scanf("%d",&item[i]);
    }   
    for(int i=0; i<N; i++){
        scanf("%d",&coupon[i]);
    }
    //Sort the product prices in ascending order.
    sort(item,item+N);
    //Sort the coupons in descending order.
    sort(coupon,coupon+N,cmp);
    priority_queue<node> q;
    node tmp;
    //Initialize the priority queue
    for(int i=0; i<N; i++){
        tmp.i= i;
        tmp.j = 0;
        q.push(tmp);
    }
    int cost,cnt;
    cnt = 0;
    //Purchasing process
    do{
        tmp = q.top();//take out the next least costly item
        q.pop();
        cost = item[tmp.i]-coupon[tmp.j];
        if(D>=cost){//If the remaining money is more than the expense, then make the purchase.
            D-=cost;
            cnt++;
            if(tmp.j!=N-1){//If it is not the last coupon,
                tmp.j++;//Each coupon can only be used once for each type of product.
                q.push(tmp);
            } 
        }
        else break;//Exit when our money is not enough to pay for the minimum amount.
    }while(!q.empty()&&D>0);
    printf("%d %d\n",cnt,D);
    return 0;
} 