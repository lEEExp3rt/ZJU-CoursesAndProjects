#include<stdio.h>
#include<stdlib.h>

typedef struct {
    int value;
    int color;
    struct TreeNode* left;
    struct TreeNode* right;
}TreeNode;

int abs(int obj) // The absolute value of 'obj'.
{
    return obj > 0 ? obj : -obj;
}

TreeNode* NewNode(int obj) //Create a new node with the given argument 'obj'.
{
    TreeNode* new = (TreeNode*)malloc(sizeof(TreeNode));
    if (new == NULL) return NULL;
    new->value = abs(obj); //Get the absolute value of 'obj'.
    new->color = obj > 0; //Set the color of the node, 1 for black and 0 for red.
    new->left = NULL; //Create the left node.
    new->right = NULL; //Create the right node.
    return new;
}

TreeNode* BuildBST(int array[], int start, int end) //Build the BST with the given preordered sequence.
{
    if (start > end) return NULL; //Break out of the loop.
    TreeNode* root = NewNode(array[start]); //Create the root node.
    int endindex = start + 1; //End index of the objects which is less than the root.
    while (endindex <= end)
    {
        if (abs(array[endindex]) > root->value) break;
        endindex++;
    }
    root->left = BuildBST(array, start + 1, endindex - 1);
    root->right = BuildBST(array, endindex, end);
    return root;
}

int CheckPoint4(TreeNode* root) //Check the criteria4 by preorder traversal.
{
    if (root == NULL) return 1; //Leaf node.
    if (!root->color) //The node is red.
    {
        TreeNode* left = root->left;
        TreeNode* right = root->right;
        if (left != NULL && !left->color) return 0;
        if (right != NULL && !right->color) return 0; //If one subnode is red, then the tree does not satisfy criteria4.
    }
    if (!CheckPoint4(root->left)) return 0;
    if (!CheckPoint4(root->right)) return 0;
    return 1;
}

int CheckPoint5(TreeNode* root, int *cnt) //Check the criteria5.
{
    if (root == NULL) return 1; //Leaf node.
    int leftcnt = 0; //Left subtree black node count.
    int rightcnt = 0; //Right subtree black node count.
    (*cnt) += root->color; //If color is black, then add 1.
    if (!CheckPoint5(root->left,&leftcnt)) return 0; //Case: left subtree does not satisfy criteria the criteria5.
    if (!CheckPoint5(root->right,&rightcnt)) return 0; //Case: right subtree does not satisfy criteria the criteria5.
    if (leftcnt != rightcnt) return 0; //Case: left subtree black node count is not equal to right subtree black node count.
    (*cnt) += leftcnt; //Add up the count.
    return 1; //Satisfied.
}

int CheckBST(TreeNode* root) //Check whether the BST satisfies the criterias. 
{
    if (root == NULL) return 1; // Root is NULL.
    if (!root->color) return 0; // Check criteria1.
    if (!CheckPoint4(root)) return 0; //Check criteria4.
    int cnt=0;
    if (!CheckPoint5(root,&cnt)) return 0; // Check criteria5.
    return 1; //Satisfied.
}

int main()
{
    int K,N;
    scanf("%d", &K);
    int ans[K];
    for (int i = 0; i < K; i++) // K input cases.
    {
        scanf("%d", &N); // Array size of N.
        int data[N];
        for (int j = 0; j < N; j++) scanf("%d", &data[j]); //Read the data.
        TreeNode* root = BuildBST(data,0,N-1);
        ans[i] = CheckBST(root);
    }
    for (int i = 0; i < K; i++)
    {
        if (ans[i]) printf("Yes\n");
        else printf("No\n");
    }
    return 0;
}