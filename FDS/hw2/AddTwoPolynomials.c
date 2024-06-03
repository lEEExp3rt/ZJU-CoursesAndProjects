typedef struct Node *PtrToNode;
struct Node {
    int Coefficient;
    int Exponent;
    PtrToNode Next;
};
typedef PtrToNode Polynomial;

Polynomial Add(Polynomial a, Polynomial b) {
    Polynomial p = a->Next;
    Polynomial q = b->Next;
    Polynomial res = (Polynomial)malloc(sizeof(struct Node));
    Polynomial head = res;
    while (p && q) {
        Polynomial tmp = (Polynomial)malloc(sizeof(struct Node));
        if (p->Exponent == q->Exponent) {
            tmp->Exponent = p->Exponent;
            tmp->Coefficient = p->Coefficient + q->Coefficient;
            p = p->Next;
            q = q->Next;
            if (tmp->Coefficient != 0) {
                res->Next = tmp;
                res = tmp;
            }
        } else if (p->Exponent < q->Exponent) {
            tmp->Exponent = q->Exponent;
            tmp->Coefficient = q->Coefficient;
            q = q->Next;
            res->Next = tmp;
            res = tmp;
        } else {
            tmp->Exponent = p->Exponent;
            tmp->Coefficient = p->Coefficient;
            p = p->Next;
            res->Next = tmp;
            res = tmp;
        }
    }
    if (p) res->Next = p;
    if (q) res->Next = q;
    return head;
}

