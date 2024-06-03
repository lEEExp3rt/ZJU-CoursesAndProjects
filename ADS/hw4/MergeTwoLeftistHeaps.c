PriorityQueue Merge( PriorityQueue H1, PriorityQueue H2 )
{ 
    if (H1==NULL) return H2;
    if (H2==NULL) return H1;
    if (H1->val > H2->val) /* 1 */
        swap(H1, H2);  //swap H1 and H2
    if ( H1->Left == NULL )
        swap(H1->Left, H1->Right); /* 2 */
    else {
        H1->Right = Merge( H1->Right, H2 );
        if ( H1->Left->Npl < H1->Right->Npl )
            SwapChildren( H1 );  //swap the left child and right child of H1 
        H1->dist = H1->Right->dist + 1; /* 3 */
    }
    return H1;
}
