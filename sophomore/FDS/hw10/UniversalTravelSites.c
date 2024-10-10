#include<stdio.h>
#include<stdlib.h>
#include<string.h>
typedef struct {
    int destination;
    int capacity;
    struct* Graph Next;
}Graph;

int Index(char* array[], char* obj, int size) // Return the index of string type 'obj' in the array 'array[]'.
{
    int index;
    if (!size) return 0;
    for (index = 0; index < size; index++)
    {
        if (!strcmp(array[index], obj)) return index; // Find the string in the array.
    }
    if (index == size) return size; // Not found, return a new one.
}

void AddEdge(Graph G[], int SourceIndex, int DestinationIndex, int Weight)
{
    Graph* tmp = (Graph*)malloc(sizeof(Graph));
    tmp->destination = DestinationIndex;
    tmp->capacity = Weight;
    tmp->Next = Graph[SourceIndex];
    Graph[SourceIndex] = tmp;
    return ;
}

int MaxFlow(Graph G[], int Num, int SourceIndex, int DestinationIndex)
{
    Graph* tmp = G[SourceIndex];
    while (tmp != NULL)
    {

    }
}

int main()
{
    int N, VertexNum = 0;
    char* start, end;
    scanf("%s %s %d",&N, &start, &end);
    char* vertex[2 * N]; // Store the data of the vertices.
    Graph G[2 * N];
    for (int i = 0; i < 2 * N; i++) G[i] = NULL; // Initialize.
    for (int i = 0; i < N; i++)
    {
        char* tmp_source, tmp_destination;
        int tmp_weight, source_index, destination_index;
        scanf("%s %s %d", &tmp_source, &tmp_destination, &tmp_weight);
        source_index = Index(vertex, tmp_source, VertexNum);
        destination_index = Index(vertex, tmp_destination, VertexNum);
        if (source_index == VertexNum) strcpy(vertex[VertexNum++], tmp_source);
        if (destination_index == VertexNum) strcpy(vertex[VertexNum++], tmp_destination);
        AddEdge(G, source_index, destination_index, tmp_weight);
    }
}
