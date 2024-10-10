#include<stdio.h>
#include<stdlib.h>
#define max(a, b) (a > b) ? a : b

typedef struct Tree {
    struct Tree* left;
    struct Tree* right;
    int value;
    int height;
}Tree;

Tree* NewNode(int data) // Make new tree node.
{
    Tree* node = (Tree*)malloc(sizeof(Tree));
    node->value = data;
    node->height = 1;
    node->left = NULL;
    node->right = NULL;
    return node;
}

int Height(Tree* node)
{
    return (node == NULL) ? 0 : node->height;
}

void UpdateHeight(Tree* node)
{
    node->height = (max(Height(node->left), Height(node->right))) + 1;
    return ;
}

int BF(Tree* node) // Get the BalanceFactor.
{
    return (node == NULL) ? 0 : Height(node->left) - Height(node->right);
}

Tree* LeftRotation(Tree* node)
{
    Tree* mid = node->right;
    node->right = mid->left;
    mid->left = node;
    // Update height.
    UpdateHeight(node);
    UpdateHeight(mid);
    return mid;
}

Tree* RightRotation(Tree* node)
{
    Tree* mid = node->left;
    node->left = mid->right;
    mid->right = node;
    // Update height.
    UpdateHeight(node);
    UpdateHeight(mid);
    return mid;
}

Tree* Insert(int data, Tree* root) // Insert a new node in BST.
{
    if (root == NULL)
        return NewNode(data);
    if (data < root->value)
        root->left = Insert(data, root->left);
    else
        root->right = Insert(data, root->right);
    // Check along the path whether the tree is balanced or not.
    UpdateHeight(root);
    if (BF(root) > 1) {
        if (data > root->left->value) // LR
            root->left = LeftRotation(root->left);
        return RightRotation(root);
    }
    else if (BF(root) < -1) {
        if (data < root->right->value) // RL
            root->right = RightRotation(root->right);
        return LeftRotation(root);
    } 
    return root;
}

int main()
{
    int N;
    scanf("%d", &N);
    int data[N];
    for (int i = 0; i < N; i++)
        scanf("%d", &data[i]);
    Tree* root = NewNode(data[0]);
    for (int i = 1; i < N; i++)
        root = Insert(data[i], root); 
    printf("%d", root->value);
    return 0;
}
