#include<stdio.h>
#include<stdlib.h>

typedef struct {
    int Vertex;
    struct Vnode* Next;
}Vnode;

void Initialize(Vnode* graph[], int size) // Initialize the graph.
{
    for (int i = 0; i < size; i++)
    {
        graph[i] = NULL;
    }
    return ;
}

void AddEdge(Vnode* graph[], int v1, int v2) // Add edges into the graph.
{
    Vnode* new1 = (Vnode*)malloc(sizeof(Vnode));
    new1->Vertex = v2;
    new1->Next = graph[v1 - 1];
    graph[v1 - 1] = new1;
    Vnode* new2 = (Vnode*)malloc(sizeof(Vnode));
    new2->Vertex = v1;
    new2->Next = graph[v2 - 1];
    graph[v2 - 1] = new2;
}

int Check(Vnode* graph[],int sequence[],int n,int size) // Check if the sequence satisfies the HamiltonianCycle.
{
    int state[size]; // Mark the node's check state, 0 means not checked while 1 means checked.
    if (n != size + 1) return 0;
    for (int i = 0; i < size; i++) state[i] = 0; // Initialize.
    for (int i = 0; i < n - 1; i++) // Traverse the sequence.
    {
        Vnode* tmp = graph[sequence[i] - 1];
        while (tmp != NULL) // Traverse the whole adjcent node list.
        {
            if (tmp->Vertex == sequence[i + 1] && !state[sequence[i + 1] - 1]) // Find edge between the two adjcent non-checked vertices.
            {
                state[sequence[i + 1] - 1] = 1;
                break;
            }
            else if (state[sequence[i + 1] - 1]) return 0; // Small cycle is found.
            tmp = tmp->Next;
        }
        if (tmp == NULL) return 0; // No edge is found between the two adjcent vertices.
    }
    // Check the head and tail.
    if (sequence[n - 1] != sequence[0])return 0;
    return 1;
}

int main()
{
    int N,M,K;
    scanf("%d %d",&N,&M);
    Vnode* graph[N];
    Initialize(graph,N);
    for (int i = 0; i < M; i++)
    {
        int v1,v2;
        scanf("%d %d",&v1,&v2);
        // Read the edges.
        AddEdge(graph,v1,v2); 
    }
    scanf("%d",&K);
    int ans[K]; // Store the answer for each sequence,0 means NO while 1 means YES.
    for (int j = 0; j < K; j++)
    {
        int n;
        scanf("%d",&n);
        int sequence[n];
        // Read the sequences.
        for (int k = 0; k < n; k++) scanf("%d",&sequence[k]);
        // Check.
        ans[j] = Check(graph,sequence,n,N);
    }
    for (int k = 0; k < K; k++)
    {
        ans[k]?printf("YES\n"):printf("NO\n");
    }
    return 0;
}
