#include<stdio.h>
#include<stdlib.h>
#define MaxKey 3

typedef struct Bplus{
    int isLeaf;
    int numKeys;
    int keys[MaxKey];
    struct Bplus* parent;
    struct Bplus* children[MaxKey];
}Bplus;

Bplus* Initialize(int state)
{
    Bplus* new = (Bplus*)malloc(sizeof(Bplus));
    new->isLeaf = state; // state: isLeaf
    new->numKeys = 0;
    new->parent = NULL;
    for (int index = 0; index < MaxKey; index++)
        new->children[index] = NULL;
    return new;
}

Bplus* Search(Bplus* root, int obj, int *isDuplicated)
{
    Bplus* node = root;
    int index;
    // search in non-leaf nodes
    while (!node->isLeaf) {
        // Search every index in the non-leaf nodes.
        for (index = 0; index < node->numKeys; index++) {
            // Search in its children.
            if (obj < node->keys[index]) {
                node = node->children[index];
                break;
            }
        }
        // obj > node's all indices.
        if (index == node->numKeys)
            node = node->children[index];
    }
    // Search in leaf node.
    for (index = 0; index < node->numKeys; index++) {
        // Duplicated.
        if (obj == node->keys[index]) {
            (*isDuplicated) = 1;
            break;
    }
    return node;
}

/* Some assistant functions for Insertion */

int isFull(Bplus* node)
{
    return node->isLeaf ? (node->numKeys == MaxKey ? 1 : 0) : (node->numKeys == MaxKey - 1 ? 1 : 0);
}

int position(int obj, int array[], int size)
{
    int index = 0;
    for (; obj > array[index] && index < size; index++);
    return index;
}

void Insert(Bplus* node, int obj)
{
    if (!node) {
        node = Initialize(0);
        node->keys[node->numKeys++] = obj;
        return ;
    }
    // Not full, insert directly.
    int index = position(obj, node->keys, node->numKeys);
    int jndex;
    if (!isFull(node)) {
        node->numKeys++;
        for (jndex = numKeys; jndex > index; jndex++)
            node->keys[jndex] = node->keys[jndex - 1];
        node->keys[index] = obj;
        return ;
    }
    // Full, splitting upwards.
    else {
        int tmparray[node->numKeys + 1];
        for (jndex = 0; jndex < index; jndex++)
            tmparray[jndex] = node->keys[jndex];
        tmparray[index] = obj;
        for (jndex = index + 1; jndex < numKeys + 1; jndex++)
            tmparray[jndex] = node->keys[jndex + 1];

    }

}

void Print(Bplus* queue[], int front, int rear)
{
    while (front != rear) {
        Bplus* node = queue[front];
        // Print out current node's keys.
        printf("[");
        for (int i = 0; i < node->numKeys - 1; i++)
            printf("%d,", node->keys[i]);
        printf("%d]", node->keys[numKeys - 1]);
        // Judge if the node is a leaf node.
        if (!node->isLeaf)
            for (int j = 0; j <= node->numKeys; j++)
                queue[++rear] = node->children[j];
        front++;
    }
    return ;
}

int main()
{
    int N;
    scanf("%d", &N); // Read N.
    int data[N];
    for (int i = 0; i < N; i++) // Read in the data.
        scanf("%d", &data[i]);
    // Insert.
    Bplus* root = NULL;
    for (int i = 0; i < N; i++) {
        // Search for position.
        int isDuplicated = 0;
        Bplus* node = Search(root, obj, &isDuplicated);
        // Find duplicated element, insertion aborted.
        if (isDuplicated) {
            printf("Key %d is duplicated\n");
            continue;
        }
        root = Insert(root, data[i]);
    }
    // Print.
    Bplus* print_queue[N];
    print_queue[0] = root;
    Print(print_queue, 0, 1);
    return 0;
}
