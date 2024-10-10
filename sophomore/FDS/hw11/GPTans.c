#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Structure to represent a node in the adjacency list
typedef struct Node {
    int data;
    struct Node* next;
} Node;

// Structure to represent the directed graph
typedef struct Graph {
    int numVertices;
    Node** adjLists;
} Graph;

// Utility function to create a new node
Node* createNode(int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// Utility function to create a graph
Graph* createGraph(int numVertices) {
    Graph* graph = (Graph*)malloc(sizeof(Graph));
    graph->numVertices = numVertices;
    graph->adjLists = (Node**)malloc(numVertices * sizeof(Node*));

    for (int i = 0; i < numVertices; ++i) {
        graph->adjLists[i] = NULL;
    }

    return graph;
}

// Utility function to add an edge to the graph
void addEdge(Graph* graph, int src, int dest) {
    Node* newNode = createNode(dest);
    newNode->next = graph->adjLists[src];
    graph->adjLists[src] = newNode;
}

// Utility function to perform DFS
void DFS(Graph* graph, int vertex, bool* visited, int* stack, int* stackTop) {
    visited[vertex] = true;

    Node* temp = graph->adjLists[vertex];
    while (temp != NULL) {
        int neighbor = temp->data;
        if (!visited[neighbor]) {
            DFS(graph, neighbor, visited, stack, stackTop);
        }
        temp = temp->next;
    }

    // Push the current vertex onto the stack
    stack[++(*stackTop)] = vertex;
}

// Utility function to perform DFS on the transpose graph
void DFS_Transpose(Graph* graph, int vertex, bool* visited, int componentID) {
    visited[vertex] = true;
    printf("%d ", vertex);

    Node* temp = graph->adjLists[vertex];
    while (temp != NULL) {
        int neighbor = temp->data;
        if (!visited[neighbor]) {
            DFS_Transpose(graph, neighbor, visited, componentID);
        }
        temp = temp->next;
    }
}

// Function to find strongly connected components
void stronglyConnectedComponents(Graph* graph) {
    int numVertices = graph->numVertices;

    // Step 1: Perform DFS and fill the stack
    bool* visited = (bool*)malloc(numVertices * sizeof(bool));
    for (int i = 0; i < numVertices; ++i) {
        visited[i] = false;
    }

    int stack[numVertices];
    int stackTop = -1;

    for (int i = 0; i < numVertices; ++i) {
        if (!visited[i]) {
            DFS(graph, i, visited, stack, &stackTop);
        }
    }

    // Step 2: Create the transpose (reverse) graph
    Graph* transposeGraph = createGraph(numVertices);

    for (int i = 0; i < numVertices; ++i) {
        Node* temp = graph->adjLists[i];
        while (temp != NULL) {
            addEdge(transposeGraph, temp->data, i);
            temp = temp->next;
        }
    }

    // Step 3: Reset visited array for the second DFS
    for (int i = 0; i < numVertices; ++i) {
        visited[i] = false;
    }

    // Step 4: Perform DFS on the transpose graph using the stack
    int componentID = 1;
    while (stackTop != -1) {
        int vertex = stack[stackTop--];
        if (!visited[vertex]) {
            printf("Strongly Connected Component %d: ", componentID++);
            DFS_Transpose(transposeGraph, vertex, visited, componentID);
            printf("\n");
        }
    }

    // Free memory
    free(visited);
    freeGraph(transposeGraph);
}

// Utility function to free the memory allocated for the graph
void freeGraph(Graph* graph) {
    for (int i = 0; i < graph->numVertices; ++i) {
        Node* temp = graph->adjLists[i];
        while (temp != NULL) {
            Node* next = temp->next;
            free(temp);
            temp = next;
        }
    }

    free(graph->adjLists);
    free(graph);
}

int main() {
    // Create a directed graph
    Graph* graph = createGraph(4);
    addEdge(graph, 0, 1);
    addEdge(graph, 1, 2);
    addEdge(graph, 2, 0);
    addEdge(graph, 3, 1);
    addEdge(graph, 3, 2);

    // Find strongly connected components
    printf("Strongly Connected Components:\n");
    stronglyConnectedComponents(graph);

    // Free memory
    freeGraph(graph);

    return 0;
}
