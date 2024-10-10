void DFS(Graph G, int vertex, int stack[], int instack[], int state[], int* top, int dfn[], int low[], void (*visit)(Vertex V)) // DFS the graph and push the vertices into the stack.
{
    static int index = 0;
    PtrToVNode head = G->Array[vertex];
    while (head != NULL)
    {
        if (!state[head->Vert])
        {
            DFS(G, head->Vert, stack, instack, state, top, dfn, low, visit);
        }
        else if (state[head->Vert] && instack[head->Vert])
        {
            while(stack[*top] != head->Vert)
            {
                low[stack[*top]] = low[head->Vert];
                instack[stack[*top]] = 0;
                visit(stack[*top]); // Print.
                (*top)--; // Pop.
            }
            visit(head->Vert);
            instack[head->Vert] = 0;
            (*top)--;
            return ;
        }
        head = head->Next;
    }
    state[vertex] = 1;
    stack[++(*top)] = vertex;
    instack[vertex] = 1;
    dfn[vertex] = index;
    low[vertex] = index;
    index++;
    return ;
}

void StronglyConnectedComponents( Graph G, void (*visit)(Vertex V) )
{
    int dfn[G->NumOfVertices];
    int low[G->NumOfVertices];
    int instack[G->NumOfVertices]; // If a vertex is in stack.
    int stack[G->NumOfVertices]; // A stack for DFS.
    int state[G->NumOfVertices]; // Whether checked or not.
    int top = -1; // Stack top position.
    for (int i = 0; i < G->NumOfVertices; i++)
    {
        instack[i] = 0;
        state[i] = 0;
    }
    DFS(G, 0, stack, instack, state, &top, dfn, low, visit);
}
