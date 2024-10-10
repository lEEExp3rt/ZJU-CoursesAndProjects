#include<stdio.h>
#include<stdlib.h>
#define MaxN 100

typedef struct{
    int row;
    int col;
    struct Node* Next;
}Node; // Store the path and loop in linked list.

int n,end_row,end_col;
int cnt = 0; // Count the number of loops.
int maze[MaxN][MaxN];
int state[MaxN][MaxN]; // 0 for not visited, 1 for now visiting, 2 for visited.
Node* path = NULL;

void AddNode(int row,int col) // Add node into the path.
{
    Node* newnode = (Node*)malloc(sizeof(Node));
    newnode->row = row;
    newnode->col = col;
    newnode->Next = path;
    path = newnode;
    return ;    
}

int check(int row, int col) // Check.
{
    if (row == end_row && col == end_col) 
    {
        AddNode(row,col);
        return 1;
    }
    state[row][col] = 1;
    int mov_row[4] = {0,1,0,-1};
    int mov_col[4] = {1,0,-1,0};
    for (int k = 0; k < 4; k++)
    {
        int new_row = row + mov_row[k];
        int new_col = col + mov_col[k]; // New coordinate to 4 directions.
        if (!maze[new_row][new_col] && new_row >= 0 && new_row < n && new_col >= 0 && new_col < n)
        {
            if (state[new_row][new_col] == 0) // Unvisited.
            {
                if (check(new_row,new_col))
                {
                    AddNode(row,col);
                    return 1;
                }
            }
            else if (state[new_row][new_col] == 1) // Now visiting.
            {
                cnt++;
            }
        }
    }
    state[row][col] = 2;
    return 0;
}

void Print(Node* head)
{
    Node* tmp = head;
    while(tmp != NULL)
    {
        printf("(%d,%d)",tmp->row,tmp->col);
        tmp = tmp->Next;
    }
    printf("\n");
}

int main()
{
    scanf("%d",&n);
    for (int row = 0 ;row < n; row++)
    {
        for (int col = 0; col < n; col++)
        {
            scanf("%d",&maze[row][col]); // Read the maze.
            state[row][col] = 0; // Clear all the state.
        }
    }
    int start_row,start_col;
    scanf("%d %d",&start_row,&start_col); // Read the entry.
    scanf("%d %d",&end_row,&end_col); // Read the extry.
    // Check
    if (check(start_row,start_col))
    {
        printf("yes\n");
        Print(path);
    }
    else printf("no\n");
    // Check loop.
    if (cnt == 0) printf("no loops!");
    else 
    {
        printf("%d loops:\n",cnt);        
    }
    return 0;
}
