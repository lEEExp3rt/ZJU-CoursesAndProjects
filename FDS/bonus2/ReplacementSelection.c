#include<stdio.h>
#include<stdlib.h>
#define MAXN 100000

typedef struct
{
    int data[MAXN];
    int size;
    struct Run* Next;
}Run;

Run* Initialize(void) // Initialize each run.
{
    Run* newone = (Run*)malloc(sizeof(Run));
    newone->size = 0;
    newone->Next = NULL;
    return newone;
}

void Swap(int* obj1, int* obj2) // Swap two elements.
{
    int tmp = *obj1;
    *obj1 = *obj2;
    *obj2 = tmp;
    return ;
}

void Heapify(int array[], int size, int index) // Heapify the array to a min-heap.
{
    int parent = index; // The largest element.
    int left = 2 * index + 1; // Left child.
    int right = 2 * index + 2; // Right child.
    if (left < size && array[left] < array[parent]) parent = left;
    if (right < size && array[right] < array[parent]) parent = right;
    if (parent != index) // Swap case.
	{
        Swap(&array[index], &array[parent]);
        Heapify(array, size, parent);
    }
    return ;
}

void BuildMinHeap(int array[], int size) // Build a min heap.
{
    for (int index = size / 2 - 1; index >= 0; index--) // Heapify from the last non-leaf node.
    {
        Heapify(array, size, index);
    }
    return ;
}

void ReplacementSelection(int array[], int datasize,  int memorysize, Run* runs)
{
    int memory[memorysize]; // Memory definition.
    for (int i = 0; i < memorysize; i++) // Read the first data into the memory.
    {
        memory[i] = array[i];
    }
    BuildMinHeap(memory, memorysize); // Build min-heap.
    int min = memory[0]; // Minimum element from the heap.
    int tmpsize = memorysize; // The memory's current size.
    runs->data[runs->size++] = memory[0];
    for (int index = memorysize; index < datasize; index++) // Scan the data array one by one.
    {
        memory[0] = array[index]; // Read in the next element. 
        if (array[index] < min) // Next run.
        {
            Swap(&memory[0], &memory[--tmpsize]); // Swap the next element with the last one.
            if (!tmpsize) // Build the next run.
            {
                tmpsize = memorysize;
                Run* next = Initialize();
                runs->Next = next;
                runs = runs->Next;
            }
        }
        Heapify(memory, tmpsize, 0); // Re-heapify.
        runs->data[runs->size++] = memory[0]; // Pop in the run.
        min = memory[0]; // Record the minimum.
    }
    int size = memorysize - 1;
    if (tmpsize == memorysize) tmpsize = size;
    while (size) // Process the remaining elements.
    {
        memory[0] = memory[size--];
        if (memory[0] < min)
        {
            Swap(&memory[0], &memory[--tmpsize]);
            if (!tmpsize)
            {
                tmpsize = size;
                Run* next = Initialize();
                runs->Next = next;
                runs = runs->Next;
            }
        }
        Heapify(memory, tmpsize, 0);
        runs->data[runs->size++] = memory[0];
        min = memory[0];
    }
}

void Print(Run* runs)
{
    while (runs != NULL)
    {
        printf("%d", runs->data[0]);
        for (int index = 1; index < runs->size; index++)
        {
            printf(" %d", runs->data[index]);
        }
        printf("\n");
        runs = runs->Next;
    }
}

int main()
{
    int M, N;
    scanf("%d %d", &N, &M);
    int data[N + 2];
    for (int i = 0; i < N; i++) // Read the array data.
    {
        scanf("%d", &data[i]);
    }
    Run* Headruns = Initialize(); // Construct a run.
    Run* runs = Headruns; // Record the head pointer.
    ReplacementSelection(data, N, M, runs);
    Print(Headruns);
    return 0;
}
