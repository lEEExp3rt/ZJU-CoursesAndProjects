#include<stdio.h>
void init(int set[],int size)
{
    for (int i = 0; i < size; i++) set[i] = 0; //0 represents inconnected.
    return ;
}
int find(int set[],int obj) // Find the root.
{
    if (!set[obj]) return 0; // The obj is not connected.
    int i = obj,root,trail,lead;
    while (set[i] != i) // The root node points to itself.
    {
        i = set[i];
    }
    root = i;
    for (trail = obj; trail != root; trail = lead)
    {
        lead = set[trail];
        set[trail] = root;
    }
    return root;
}
void connect(int set[],int obj1,int obj2) // Make connection.
{
    if (!(find(set,obj1) || find(set,obj2))) set[obj2] = set[obj1] = obj1; // Make 'obj1' to the root and connect 'obj2' to 'obj1'.
    else if (find(set,obj1) == find(set,obj2)) return ;
    else if (!find(set,obj1)) set[obj1] = obj2; // Connect 'obj1' to 'obj2'.
    else set[obj2] = obj1;
    return ;
}
int attempt(int set[],int obj1,int obj2) // Make attempt to connect.
{
    if ((find(set,obj1) == find(set,obj2)) && find(set,obj1)) return 1;
    else return 0;
}
int main()
{
    int N,tmp1,tmp2,size = 0,cnt = 0;
    char op;
    scanf("%d",&N);
    int ans[N],set[N+1]; //The array 'ans' stores the answer and 'set' is a disjointset.
    init(set,N+1); //Initialize the disjointset.
    scanf("%c",&op);
    while (op != 'S')
    {
        scanf("%d %d",&tmp1,&tmp2);
        if (op == 'I') connect(set,tmp1,tmp2); // Make connection.
        if (op == 'C') ans[size++] = attempt(set,tmp1,tmp2); // Try to connect.
        scanf("%c",&op); // Read the next operander.
    }
    for (int i = 0; i < size; i++)
    {
        if (ans[i]) printf("yes\n");
        else printf("no\n");
    }
    for (int i = 1; i <= N; i++)
    {
        if (find(set,i) == i) cnt++;
        if (!find(set,i)) cnt++;
    }
    if (cnt == 1) printf("The network is connected.");
    else printf("There are %d components.",cnt);
    return 0;
}
