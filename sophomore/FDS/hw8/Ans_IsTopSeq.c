bool IsTopSeq(LGraph Graph, Vertex Seq[])
{
	int i, j, N = Graph->Nv;
	PtrToAdjVNode p;
	bool* Outputted = (bool*)malloc(N * sizeof(bool));
	for (i = 0; i <= N - 1; i++) 
		Outputted[i] = false;
		
	//Seq[i] ~ [1, N]
	//j ~ [0, N-1], also the index of "Outputted"
	for (i = 0; i <= N - 1; i++) { //traverse the sequence
		for (j = 0; j <= N - 1; j++) { //traverse the graph, judge Seq[i]
			if (Outputted[j] || j == Seq[i] - 1)continue;

			p = Graph->G[j].FirstEdge;
			while (p != NULL) {
				if (p->AdjV + 1 == Seq[i])return false;
				p = p->Next;
			}
		}
		Outputted[Seq[i] - 1] = true;
	}

	return true;
}
