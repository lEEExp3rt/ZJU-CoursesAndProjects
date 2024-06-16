#include <iostream>
#include <cmath>
#define MAX_N 501           // the max number of nodes
#define MAX_HEIGHT 16       // the max height of red black tree
#define MOD 1000000007      // find the remainder of the result
using namespace std;
/*
    RedBlackTree -> RBT[n][h]: n - node number                      1 ~ MAX_N
                               h - black height                     1 ~ MAX_HEIGHT
    RedRootTree  -> RRT[n][h]: n - node number                      1 ~ MAX_N
                               h - black height                     1 ~ MAX_HEIGHT
                               (Assume that the red node is black)                   

    base case: n = 1
        RBT[1][1] = 1
        RRT[1][1] = 1
    
    base case: n = 2
        RBT[2][1] = 2

    iterative: for n=3, 4, ..., N
        RBT[n][h] = RBT[k][h-1] * RBT[n-k-1][h-1]   for k=1, 2, ..., n-2
                  + RBT[k][h-1] * RRT[n-k-1][h]     for k=1, 2, ..., n-2
                  + RRT[k][h] * RBT[n-k-1][h-1]     for k=1, 2, ..., n-2
                  + RRT[k][h] * RRT[n-k-1][h]       for k=1, 2, ..., n-2
        RRT[n][h] = RBT[k][h-1] * RBT[n-k-1][h-1]   for k=1, 2, ..., n-2
*/
long long RBT[MAX_N][MAX_HEIGHT];       // red black tree
long long RRT[MAX_N][MAX_HEIGHT];       // red root tree
int main()
{
    // define some variables
    int i, j, k, N;
    int min_bh, max_bh;
    long long res = 0;
    // input the number of nodes (a positive integer N < 500)
    cin >> N;
    // initialize base case
    RBT[1][1] = 1;
    RBT[2][1] = 2;
    RRT[1][1] = 1;
    // dynamic progamming loops
    // start with 3 nodes ensure each subtree to have a node
    for(i=3; i<=N; i++){
        // compute black height range
        min_bh = log2(i + 1) / 2;
        max_bh = log2(i + 1);
        // for fixed number of nodes, loop over height
        for(j=min_bh; j<=max_bh; j++){
            // for fixed height, loop over the number of nodes in the subtree
            for(k=1; k<i-1; k++){
                // the roots of the subtrees are all black
                RBT[i][j] += RBT[k][j-1] * RBT[i-k-1][j-1];
                RBT[i][j] %= MOD;
                // the root of the left subtree is black, and the root of the right subtree is red
                RBT[i][j] += RBT[k][j-1] * RRT[i-k-1][j];
                RBT[i][j] %= MOD;
                // the root of the left subtree is red, and the root of the right subtree is black
                RBT[i][j] += RRT[k][j] * RBT[i-k-1][j-1];
                RBT[i][j] %= MOD;
                // the roots of the subtrees are all black
                RBT[i][j] += RRT[k][j] * RRT[i-k-1][j];
                RBT[i][j] %= MOD;

                // the roots of the red root tree are all black
                RRT[i][j] += RBT[k][j-1] * RBT[i-k-1][j-1] % MOD;
                RRT[i][j] %= MOD;
            }
        }
    }
    // for N nodes, add up the number of trees of different heights
    for(i=0; i<=max_bh; i++){
        res += RBT[N][i]; 
        res %= MOD;
    }
    // ouput the result
    cout << res << endl;
    return 0;
}
