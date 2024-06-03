#include<stdio.h>
#include<stdlib.h>

#define INFTY 100
#define MaxV 1000

typedef struct {
    int Vertex;
    int Weight;
    struct Vnode* Next; 
}Vnode; // Use adjacent list to implement the graph structure.

typedef struct {
    int length; // Number
    int vertex[MaxV];
}ShortestPath; // Record the shortest path.

void AddEdge(Vnode* V[], int v1, int v2, int weight) // Add edges between V1 and V2.
{
    Vnode* tmp1 = (Vnode*)malloc(sizeof(Vnode));
    tmp1->Vertex = v2;
    tmp1->Weight = weight;
    tmp1->Next = V[v1 - 1];
    V[v1 - 1] = tmp1;
    Vnode* tmp2 = (Vnode*)malloc(sizeof(Vnode));
    tmp2->Vertex = v1;
    tmp2->Weight = weight;
    tmp2->Next = V[v2 - 1];
    V[v2 - 1] = tmp2;
    return ;
}

void distance(Vnode* V[], int d[], int Source, int size) // returns the distance between the source and every other vertices.
{
    int queue[size], checked1[size],checked2[size];
    int front = 0, rear = -1;
    for (int i = 0; i < size; i++) // Initialize the distance.
    {
        d[i] = INFTY;
        checked1[i] = checked2[i] = 0;
    }
    d[Source - 1] = 0;
    queue[++rear] = Source; // Enqueue the first.
    checked1[Source - 1] = checked2[Source - 1] = 1; 
    while (front != size) // BFS the graph.
    {
        Vnode* tmp = V[queue[front] - 1];
        while (tmp != NULL)
        {
            if (!checked1[tmp->Vertex - 1]) // Omit the checked vertices.
            {
                if (!checked2[tmp->Vertex - 1]) // If the vertex is in the queue, not enqueue again.
                {
                    queue[++rear] = tmp->Vertex;
                    checked2[tmp->Vertex - 1] = 1; // In the queue.
                }
                if (d[queue[front] - 1] + tmp->Weight < d[tmp->Vertex - 1]) // Update the minimum distance by Dijkstra algorithm.
                {
                    d[tmp->Vertex - 1] = d[queue[front] - 1] + tmp->Weight;
                }
            }
            tmp = tmp->Next; // Next adjacent vertex.
        }
        checked1[queue[front] - 1] = 1; // Checked.
        front++; // Dequeue.
    }
    return ;
}

int IsDijkstraSequence(Vnode *V[], int distance[], int Sequence[], int size) // Check if the vertex is within the closest distance.
{
    int checked[size]; // Record if the ith vertex with index i-1 is checked.
    for (int i = 0; i < size;i++) checked[i] = 0; // Initialize.
    for (int Sequenceindex = 1; Sequenceindex < size; Sequenceindex++) // Scan the sequence.
    {
        ShortestPath* minvertex = (ShortestPath*)malloc(sizeof(ShortestPath)); // A set of not included vertices with closest distance.
        minvertex->length = 0; // Initialize.
        int mindistance = INFTY;
        /* First find out the closeset ones. */
        for (int vertex = 1; vertex <= size; vertex++) // Check all the vertex's distance and find out the closest ones.
        {
            if (vertex == Sequence[0]) continue; // Omit the source vertex.
            if (!checked[vertex - 1] && distance[vertex - 1] < mindistance) // Find a closer vertex.
            {
                mindistance = distance[vertex - 1]; // Update the distance.
                minvertex->length = 1; // Clear the set.
                minvertex->vertex[0] = vertex; 
            }
            else if (!checked[vertex - 1] && distance[vertex - 1] == mindistance) // Add one.
            {
                minvertex->vertex[minvertex->length++] = vertex;
            }
            // Omit the already checked ones.
        }
        /* Second check if the vertex is among the closest ones. */
        int flag = 0;
        for (int i = 0; i < minvertex->length; i++)
        {
                if (Sequence[Sequenceindex] == minvertex->vertex[i])
            {
                flag = 1;
                checked[Sequence[Sequenceindex] - 1] = 1; // Satisfied.
                break;
            }
        }
        if (!flag) return 0;
    }
    return 1;
}

int main()
{
    int v,e;
    scanf("%d %d",&v,&e);
    Vnode* vertex[v];
    for (int i = 0; i < v; i++) vertex[i] = NULL; // Initialize the graph.
    for (int i = 0; i < e; i++)
    {
        int v1,v2,weight;
        scanf("%d %d %d",&v1,&v2,&weight); // Read the edge data.
        AddEdge(vertex,v1,v2,weight); // Add the edge into the graph.
    }
    int K;
    scanf("%d",&K);
    int ans[K]; // Store the answer for each test case, 1 representing true while 0 representing false.
    for (int i = 0; i < K; i++) // K test cases.
    {
        int sequence[v];
        for (int j = 0; j < v; j++) // Read the sequence data.
        {
            scanf("%d",&sequence[j]);
        }
        int d[v];
        distance(vertex, d, sequence[0], v);
        ans[i] = IsDijkstraSequence(vertex, d, sequence, v);
    }
    for (int i = 0; i < K; i++) // Print out the answer.
    {
        ans[i]? printf("Yes\n"): printf("No\n");
    }
    return 0;
}