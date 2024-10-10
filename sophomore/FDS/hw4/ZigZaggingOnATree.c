#include<stdio.h>
#include<stdlib.h>
typedef struct {
    int value;
    struct Tree* left;
    struct Tree* right;
}Tree;

Tree* NewTree(int obj)
{
    Tree* ans=(Tree*)malloc(sizeof(Tree));
    ans->left=NULL;
    ans->right=NULL;
    ans->value=obj;
    return ans;
}

int Search(int array[],int left,int right,int obj)
{
    for (int index=left;index<=right;index++)
    {
        if (array[index]==obj) return index;
    }
}

Tree* MakeTree(int postorder[],int inorder[],int pleft,int pright,int ileft,int iright)
{
    Tree* root=NewTree(postorder[pright]);
    if (ileft>iright) return NULL;
    int index=Search(inorder,ileft,iright,postorder[pright]);
    root->left=MakeTree(postorder,inorder,pleft,pleft+index-ileft-1,ileft,index-1);
    root->right=MakeTree(postorder,inorder,pleft+index-ileft,pright-1,index+1,iright);
    return root;
}

void PrintZigZagging(Tree* tree,int size)
{
    if (tree==NULL) return ;
    Tree* data[size];
    int left=0,right=0,flag=1,cnt=1;
    data[right++]=tree;
    while (left!=right)
    {
        for (int i=0;i<right-left;i++) cnt==size?printf("%d ",data[left++]->value):printf("%d",data[left++]->value);
        if (flag>0) 
        {
            if (tree->left!=NULL) data[right++]=tree->left;
            if (tree->right!=NULL) data[right++]=tree->right;
        }
        else
        { 
            if (tree->right!=NULL) data[right++]=tree->right;
            if (tree->left!=NULL) data[right++]=tree->left;
        }
        flag=-flag;
        cnt++;
    }
}

int main()
{
    int N; 
    scanf("%d",&N);
    int post[N],in[N];
    for (int i=0;i<N;i++) scanf("%d",&in[i]);
    for (int i=0;i<N;i++) scanf("%d",&post[i]);
    Tree* data=MakeTree(post,in,0,N-1,0,N-1);
    PrintZigZagging(data,N);
    return 0;
}
