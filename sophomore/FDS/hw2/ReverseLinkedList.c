List Reverse( List L )
{
    Position prev=NULL,now=L->Next,next;
    while(now!=NULL)
    {
        next=now->Next;
        now->Next=prev;
        prev=now;
        now=next;
    }
    L->Next=prev;
    return L;
}
