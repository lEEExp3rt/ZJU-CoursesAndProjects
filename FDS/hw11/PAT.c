#define min(a,b) (((a) < (b)) ? (a) : (b))
int num[20] = {0}, low[20] = {0};
int cnt = 0;
int inStack[21];// 栈从1开始
int top = 0;

void DFS(Graph G, int v, int state[], int stack[], int* top, void (*visit)(Vertex V));
void StronglyConnectedComponents( Graph G, void (*visit)(Vertex V) )
{
    int state[G->NumOfVertices] = {0};
    int stack[G->NumOfVertices];
    int top = -1;
    for (int i = 0; i < G->NumOfVertices; i++)
    {
        if (visited[i] == 0) DFS(G, i, state, stack, &top, visit);
    }
    return ;
}

void DFS(Graph G, int v, int state[], int stack[], int* top, void (*visit)(Vertex V))
{

    visited[v] = 1;
    num[v] = low[v] = cnt++;// 从0开始
    stack[++top] = v;
    inStack[v] = 1;
    PtrToVNode w;
    for (w = G->Array[v]; w != NULL; w = w->Next)
    {
        if (visited[w->Vert] == 0)
        {
            Dfs(G, w->Vert, visit);
            low[v] = min(low[v], low[w->Vert]);
        }
        else if (inStack[w->Vert])
        {
            low[v] = min(low[v], num[w->Vert]);
        }
    }
    if (num[v] == low[v]) {
        while (stack[top] != v) {
            visit(stack[top]);
            inStack[stack[top]] = 0;
            top--;
        }
        visit(v);
        inStack[v] = 0;
        top--;
        printf("\n");
    }
}
