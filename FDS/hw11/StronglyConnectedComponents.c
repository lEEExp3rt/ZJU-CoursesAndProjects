void DFS( Graph G, int state[], int stack[], int* top, int vertex)
{
    static int index = 0;
    PtrToVNode head = G->Array[vertex];
    state[vertex] = 1;
    while (head != NULL)
    {
        if (!state[head->Vert]) 
        {
            DFS(G, state, stack, top, head->Vert);
        }
        head = head->Next;
    }
    stack[++(*top)] = vertex;
}

void StronglyConnectedComponents( Graph G, void (*visit)(Vertex V) )
{
    int state[G->NumOfVertices] = {0};
    int stack[G->NumOfVertices];
    int top = -1;
    for (int i = 0; i < G->NumOfVertices; i++)
    {
        if (!state[i]) DFS(G, state, stack, &top, i);
    }

}
