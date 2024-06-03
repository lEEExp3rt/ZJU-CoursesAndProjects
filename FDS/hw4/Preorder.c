#include <stdio.h>
#include <stdlib.h>

// 定义树的节点
struct TreeNode {
    int val;
    struct TreeNode* left;
    struct TreeNode* right;
};

// 创建树的节点
struct TreeNode* createNode(int val) {
    struct TreeNode* newNode = (struct TreeNode*)malloc(sizeof(struct TreeNode));
    newNode->val = val;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

// 根据后序遍历和中序遍历构建二叉树
struct TreeNode* buildTree(int* inorder, int inorderStart, int inorderEnd, int* postorder, int postorderStart, int postorderEnd) {
    if (inorderStart > inorderEnd) {
        return NULL;
    }
    
    // 后序遍历的最后一个节点为根节点
    int rootVal = postorder[postorderEnd];
    struct TreeNode* root = createNode(rootVal);
    
    // 在中序遍历中找到根节点的位置
    int rootIndex;
    for (int i = inorderStart; i <= inorderEnd; i++) {
        if (inorder[i] == rootVal) {
            rootIndex = i;
            break;
        }
    }
    
    // 根据根节点的位置，划分左子树和右子树的中序遍历和后序遍历序列
    int leftSubtreeSize = rootIndex - inorderStart;
    root->left = buildTree(inorder, inorderStart, rootIndex - 1, postorder, postorderStart, postorderStart + leftSubtreeSize - 1);
    root->right = buildTree(inorder, rootIndex + 1, inorderEnd, postorder, postorderStart + leftSubtreeSize, postorderEnd - 1);
    
    return root;
}

// 前序遍历函数
void preorderTraversal(struct TreeNode* root) {
    if (root == NULL) {
        return;
    }
    
    printf("%d ", root->val);  // 打印节点值
    
    // 递归遍历左子树和右子树
    preorderTraversal(root->left);
    preorderTraversal(root->right);
}

int main() {
    // 给定的后序遍历和中序遍历序列
    int inorder[] = {4, 2, 5, 1, 3, 6};
    int postorder[] = {4, 5, 2, 6, 3, 1};
    
    int inorderSize = sizeof(inorder) / sizeof(inorder[0]);
    int postorderSize = sizeof(postorder) / sizeof(postorder[0]);
    
    // 构建二叉树
    struct TreeNode* root = buildTree(inorder, 0, inorderSize - 1, postorder, 0, postorderSize - 1);
    
    // 前序遍历树
    printf("前序遍历结果: ");
    preorderTraversal(root);
    
    return 0;
}
