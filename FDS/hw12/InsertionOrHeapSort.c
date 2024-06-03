#include<stdio.h>

void Print(int array[], int size) // Print out the array in the expected form.
{
    printf("%d",array[0]);
    for (int i = 1; i < size; i++)
    {
        printf(" %d",array[i]);
    }
    return ;
}

void InsertionSortCheck(int InitSeq[], int SortSeq[], int size) // Check if insertion sort is adopted.
{
    int array[size];
    int flag = 0;
    for (int i = 0; i < size; i++) array[i] = InitSeq[i]; // Record the array so the InitSeq will not be changed.
    for (int i = 1; i < size; i++)
    {
        int j = i, tmp = array[i];
        for (; j > 0 && array[j - 1] > tmp; j--)
        {
            array[j] = array[j - 1];
        }
        array[j] = tmp;
        if (flag)
        {
            Print(array, size);
            return ;
        }
        if (SeqCmp(array, SortSeq, size)) // Find out.
        {
            printf("Insertion Sort\n");
            flag = 1;
        }
    }
}

void Swap(int* obj1, int* obj2) // Swap two objects.
{
    int tmp = *obj1;
    *obj1 = *obj2;
    *obj2 = tmp;
    return ;
}

void Heapify(int array[], int size, int index) // Construct a max heap.
{
    int parent = index;
    int left = 2 * index + 1;
    int right = 2 * index + 2;
    if (left < size && array[left] > array[parent]) parent = left; // Left child is larger.
    if (right < size && array[right] > array[parent]) parent = right; // Right child is larger.
    if (parent != index) // Swap the parents and the larger child.
    {
        Swap(&array[index], &array[parent]); // Swap.
        Heapify(array, size, parent); // Recursively change the subtrees.
    }
}

void HeapSortCheck(int InitSeq[], int SortSeq[], int size) // Check if heap sort is adopted.
{
    int array[size];
    int flag = 0;
    for (int i = 0; i < size; i++) array[i] = InitSeq[i]; // Record the array so the InitSeq will not be changed.
    // Heapify the array.
    for (int j = size / 2 - 1; j >= 0; j--)
    {
        Heapify(array, size, j);
    }
    // Delete max.
    for (int k = size - 1; k > 0; k--)
    {
        Swap(&array[0], &array[k]);
        Heapify(array, k, 0);
        if (flag) // Find out.
        {
            Print(array, size);
            return ;
        }
        if (SeqCmp(array, SortSeq, size))
        {
            printf("Heap Sort\n");
            flag = 1;
        }
    }
}

int SeqCmp(int Seq1[], int Seq2[], int size) // Compare whether two sequence are the same.
{
    for (int i = 0; i < size; i++)
    {
        if (Seq1[i] != Seq2[i]) return 0;
    }
    return 1;
}

int main()
{
    int N;
    scanf("%d", &N);
    int InitSeq[N], SortSeq[N];
    for (int i = 0; i < N; i++) scanf("%d", &InitSeq[i]);
    for (int i = 0; i < N; i++) scanf("%d", &SortSeq[i]);
    InsertionSortCheck(InitSeq, SortSeq, N);
    HeapSortCheck(InitSeq, SortSeq, N);
    return 0;
}
