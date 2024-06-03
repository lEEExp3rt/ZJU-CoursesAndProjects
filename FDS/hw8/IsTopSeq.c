bool IsTopSeq( LGraph Graph, Vertex Seq[] )
{
    int N = sizeof(Seq) / sizeof(Seq[0]);
    if (N != Graph->Ne) return false;
    int index = 0; // Index for Seq[].
    for (;index < N;index++) // Traverse Seq[].
    {
        PtrToAdjVNode edge = Graph->G[Seq[index] - 1].FirstEdge;
        while (edge != NULL)
        {
            if (Seq[index] -1 == edge->AdjV) return false;
            edge = edge->Next;
        }
        return true;
    }
}
