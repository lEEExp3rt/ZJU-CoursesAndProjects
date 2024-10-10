# <center> PROJECT2: Is It A Red-Black Tree

# <center>Date: 2023-11-08

# <center>Author:李秋宇 3220103373

<div style="page-break-after: always"></div>

---

## Chapter1: Introduction

### Problem Description

A red-black tree is a type of self-balancing binary search tree. It is named so because each node in the tree is assigned either a red or black color. The red-black tree maintains a set of properties that ensure the tree remains balanced.

A balanced binary search tree is called Red-Black Tree, if it meets the following **criteria**:

1. The root is black
2. Every node in the tree is either black or red
3. Every leaf(NULL) is black
4. If a node is red, its children is black
5. For each node, all simple paths from the node to descendant leaves contain the same number of black nodes

The main advantage of red-black trees is their efficient balancing mechanism, which ensures that the height of the tree remains logarithmic in relation to the number of nodes. This property guarantees fast search, insertion, and deletion operations, making red-black trees suitable for many applications that require efficient dynamic data structures.

Now given some input cases, we are required to tell whether it's a legal Red-Black tree.

Each input case contains a sequence with positive integers representing the black nodes and negative integers representing the red nodes. The total input contains K cases to be verified.

### Background Algorithm

The Red-Black tree algorithm, which will be interpreted later.

---

## Chapter2: Algorithm Specification

The core algorithm is to verify whether each criteria is satisfied.

1. From the beginning, we can go and confirm whether **criteria1** is satisfied, which is the easiest way to check if the root is a red node.

2. Actually the problem already specified that the given input case meets the **criteria2**.

3. As the problem itself illustrates, each leaf is a `NULL` node, so it is black. This means we need not to check whether **criteria3** is satisfied. However, this critera will be combined with **criteria5** later.

4. So the key is to check if **criteria4** and **criteria5** are  satisfied.

### Main Program Sketch

1. Tree definition

2. Data read

3. BST construction

4. Properties verification

5. Output

### Tree Structure

The tree structure is defined as follows:

```c{.line-numbers}
typedef struct {
    int value;
    int color;
    struct TreeNode* left;
    struct TreeNode* right;
}TreeNode;
```

> Note: `color=1` represents black, while `color=0` represents red.

### The BST Construction Algorithm

Each input case is a sequence `array` of preordered traversal, with index from `start` to `end`. Considering the input case is a BST, so we can easily construct the tree. 

First we can get the `root` node from the preordered sequence, which is the first one in the array.

Then we can traverse the array until one element is larger than the root. We mark the point by `endindex`.

Then we can recursively construct the BST with the left subtree from index `start` to `endindex-1`, and the right subtree from index `endindex` to `end`.

```dotnetcli{.line-numbers}
pseudocode: BuildBST(array, start, end):
    if (start > end ) return NULL;
    Node* root = CreateNode(array[start]);
    i = FindIndex(array,start+1,end);
    root.left = BuildBST(array,start+1,i-1);
    root.right = BuildBST(array,i,end);
    return root;
```

### The Red-Black Tree Algorithm

After building the tree, our key goal is to confirm that the BST satisfies all the criterias of the Red-Black Tree.

#### Criteria1

This is simple and easy, just check that the root color is black.

#### Criteria2

All the given input cases already satisfied.

#### Criteria3

All the given input cases already satisfied.

#### Criteria4

By traversing the tree in any order, we need to check each node that if it is red, whether its subnodes are red.

The programmer, I, used preorder traversal to check each node. This process is recursively defined.

```dotnetcli{.line-numbers}
pseudocode: CheckPoint4(root):
    if (root == NULL) return true;
    if (root.color == 'red'):
        if (root.left.color == 'red') return false;
        if (root.right.color == 'red') return false;
    if (CheckPoint4(root.left) == false) return false;
    if (CheckPoint4(root.right) == false) return false;
    return true;
```

So by running this function, we can check whether the BST satisfies the criteria4.

#### Criteria5

To check this criteria, we first traverse the tree from left to right, and add up each subtree's black nodes count. This process is designed recursively. The recursion halts when the node is `NULL`, which means it is a leaf, so it's black nodes count must satisfy the criteria.

After that, we check whether the left subtree's black nodes count is equal to the right subtree's black nodes count. If not, then the whole tree is not a Red-Black Tree.

Pseudocode are shown below:

```dotnetcli{.line-numbers}
pseudocode: CheckPoint5(root, *count):
    if (root == NULL) return true;
    if (root.color == 'red' ) count++;
    int leftcount=0;
    int rightcount=0;
    if (CheckPoint5(root.left,*leftcount) == False) return false;
    if (CheckPoint5(root.right,*rightcount) == False) return false;
    if (leftcount != rightcount) return false;
    count += leftcount;
    return true;
```

After all these criteria check from above, we can confirm whether the tree is a Red-Black Tree.

---

## Chapter3: Testing Results

### Test Case1

From *PTA* we can get 3 test cases:

```dotnetcli{.line-numbers}
3
9
7 -2 1 5 -4 -11 8 14 -15
9
11 -2 1 -7 5 -4 8 14 -15
8
10 -7 5 -6 8 15 -11 17
```

By compiling and running the program we can get the results:

```Bash{.line-numbers}
root@localhost ~> gcc project2.c -w -o exe
root@localhost ~> ./exe
3
9
7 -2 1 5 -4 -11 8 14 -15
9
11 -2 1 -7 5 -4 8 14 -15
8
10 -7 5 -6 8 15 -11 17
Yes
No
No
```

### Test Case 2

Only 1 node case.

```Bash{.line-numbers}
root@localhost ~> gcc project2.c -w -o exe
root@localhost ~> ./exe
1
1
1
Yes
```

### Test Case 3

The root node dosen't satisfy **criteria1**

```Bash{.line-numbers}
root@localhost ~> gcc project2.c -w -o exe
root@localhost ~> ./exe
1
9
-7 -2 1 5 -4 -11 8 14 -15
No
```

### Test Case 4

Random sequence does not satisfy **criteria5**.

```Bash{.line-numbers}
root@localhost ~> gcc project2.c -w -o exe
root@localhost ~> ./exe
1
7
1 2 3 4 5 6 7
No
```

### Test Case 5

**Criteria4** is not satisfied.

```Bash{.line-numbers}
root@localhost ~> gcc project2.c -w -o exe
root@localhost ~> ./exe
1
9
7 -2 -1 5 -4 -11 8 14 -15
No
```

So it is correct.

---

## Chapter4: Analysis and Comments

### Analysis

#### Time Complexity

If each time we input only 1 case with data size $N$, then we first read the data into the array using $O(N)$ time.

Then we build the BST using $O(NlogN)$ time.

After building the BST, we go and confirm whether it satisfies **criteria1** using $O(1)$ time. And confirm **criteria4** using $O(N)$ time. And finally confirm **criteria5** using $O(N)$ time.

So for each test case, the time complexity is $O(NlogN)$. 

#### Space Complexity

For each test case, we first read the data with size $N$ into the array using $O(N)$ space. Then we build the BST using $O(N)$ space. Then we confirm each criteria using total space: $O(N)$.

So for each test case, the space complexity is $O(N)$.

### Comments

Here are some possible improvements.

The key is to check **criteria4** and **criteria5**. 

For each criteria, the process is to traverse the whole tree using recursive functions and then check their properties. However, I divided them into different parts. So maybe the two steps can be combined together so that only 1 traversal is needed, which will reduce the time complexity.

But due to the project deadline, the author can't make it happen on time. That's why this point is only *possible improvements*. 😢

---

## Appendix: Source Code

### project2.c

```c{.line-numbers}
#include<stdio.h>
#include<stdlib.h>

typedef struct {
    int value;
    int color;
    struct TreeNode* left;
    struct TreeNode* right;
}TreeNode;

int abs(int obj) // The absolute value of 'obj'.
{
    return obj > 0 ? obj : -obj;
}

TreeNode* NewNode(int obj) //Create a new node with the given argument 'obj'.
{
    TreeNode* new = (TreeNode*)malloc(sizeof(TreeNode));
    if (new == NULL) return NULL;
    new->value = abs(obj); //Get the absolute value of 'obj'.
    new->color = obj > 0; //Set the color of the node, 1 for black and 0 for red.
    new->left = NULL; //Create the left node.
    new->right = NULL; //Create the right node.
    return new;
}

TreeNode* BuildBST(int array[], int start, int end) //Build the BST with the given preordered sequence.
{
    if (start > end) return NULL; //Break out of the loop.
    TreeNode* root = NewNode(array[start]); //Create the root node.
    int endindex = start + 1; //End index of the objects which is less than the root.
    while (endindex <= end)
    {
        if (abs(array[endindex]) > root->value) break;
        endindex++;
    }
    root->left = BuildBST(array, start + 1, endindex - 1);
    root->right = BuildBST(array, endindex, end);
    return root;
}

int CheckPoint4(TreeNode* root) //Check the criteria4 by preorder traversal.
{
    if (root == NULL) return 1; //Leaf node.
    if (!root->color) //The node is red.
    {
        TreeNode* left = root->left;
        TreeNode* right = root->right;
        if (left != NULL && !left->color) return 0;
        if (right != NULL && !right->color) return 0; //If one subnode is red, then the tree does not satisfy criteria4.
    }
    if (!CheckPoint4(root->left)) return 0;
    if (!CheckPoint4(root->right)) return 0;
    return 1;
}

int CheckPoint5(TreeNode* root, int *cnt) //Check the criteria5.
{
    if (root == NULL) return 1; //Leaf node.
    int leftcnt = 0; //Left subtree black node count.
    int rightcnt = 0; //Right subtree black node count.
    (*cnt) += root->color; //If color is black, then add 1.
    if (!CheckPoint5(root->left,&leftcnt)) return 0; //Case: left subtree does not satisfy criteria the criteria5.
    if (!CheckPoint5(root->right,&rightcnt)) return 0; //Case: right subtree does not satisfy criteria the criteria5.
    if (leftcnt != rightcnt) return 0; //Case: left subtree black node count is not equal to right subtree black node count.
    (*cnt) += leftcnt; //Add up the count.
    return 1; //Satisfied.
}

int CheckBST(TreeNode* root) //Check whether the BST satisfies the criterias. 
{
    if (root == NULL) return 1; // Root is NULL.
    if (!root->color) return 0; // Check criteria1.
    if (!CheckPoint4(root)) return 0; //Check criteria4.
    int cnt=0;
    if (!CheckPoint5(root,&cnt)) return 0; // Check criteria5.
    return 1; //Satisfied.
}

int main()
{
    int K,N;
    scanf("%d", &K);
    int ans[K];
    for (int i = 0; i < K; i++) // K input cases.
    {
        scanf("%d", &N); // Array size of N.
        int data[N];
        for (int j = 0; j < N; j++) scanf("%d", &data[j]); //Read the data.
        TreeNode* root = BuildBST(data,0,N-1);
        ans[i] = CheckBST(root);
    }
    for (int i = 0; i < K; i++)
    {
        if (ans[i]) printf("Yes\n");
        else printf("No\n");
    }
    return 0;
}
```

## Declaration
*I hereby declare that all the work done in this project titled "project2" is of my independent effort.*