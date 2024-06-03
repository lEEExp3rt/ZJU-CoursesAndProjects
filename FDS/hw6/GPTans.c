#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* left;
    struct Node* right;
};

struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

struct Node* buildCBT(int arr[], int left, int right) {
    if (left > right)
        return NULL;

    int mid = (left + right + 1) / 2;
    struct Node* root = createNode(arr[mid]);
    root->left = buildCBT(arr, left, mid - 1);
    root->right = buildCBT(arr, mid + 1, right);
    return root;
}

void levelOrder(struct Node* root) {
    if (root == NULL)
        return;

    struct Node** queue = (struct Node**)malloc(sizeof(struct Node*) * 1000);
    int front = 0, rear = 0;
    queue[rear++] = root;

    while (front < rear) {
        struct Node* current = queue[front++];
        printf("%d", current->data);
        if (front != rear)
            printf(" ");
        if (current->left != NULL)
            queue[rear++] = current->left;
        if (current->right != NULL)
            queue[rear++] = current->right;
    }
    free(queue);
}

int main() {
    int N;
    scanf("%d", &N);

    int arr[1000];
    for (int i = 0; i < N; i++) {
        scanf("%d", &arr[i]);
    }

    struct Node* root = buildCBT(arr, 0, N - 1);

    levelOrder(root);

    return 0;
}
