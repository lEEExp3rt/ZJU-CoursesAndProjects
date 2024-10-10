#include <stdio.h>
#include <stdlib.h>

#define MAX_VERTICES 100

typedef struct Node {
    int vertex;
    int weight;
    struct Node* next;
} Node;

Node* graph[MAX_VERTICES];

// 初始化图
void initGraph(int vertices) {
    for (int i = 0; i < vertices; ++i) {
        graph[i] = NULL;
    }
}

// 添加边
void addEdge(int start, int end, int weight) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->vertex = end;
    newNode->weight = weight;
    newNode->next = graph[start];
    graph[start] = newNode;

    // 如果是无向图，还需添加类似的代码
    /*
    newNode = (Node*)malloc(sizeof(Node));
    newNode->vertex = start;
    newNode->weight = weight;
    newNode->next = graph[end];
    graph[end] = newNode;
    */
}

int main() {
    int vertices = 5;
    initGraph(vertices);

    addEdge(0, 1, 2);
    addEdge(1, 2, 3);
    addEdge(2, 0, 1);

    // 其他操作...

    return 0;
}

