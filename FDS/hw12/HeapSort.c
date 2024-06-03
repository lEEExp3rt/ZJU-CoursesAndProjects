#include <stdio.h>

// 交换数组中两个元素的值
void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

// 调整堆，使其满足最大堆性质
void maxHeapify(int arr[], int n, int i) {
    int largest = i; // 初始化根节点为最大值
    int left = 2 * i + 1; // 左子节点
    int right = 2 * i + 2; // 右子节点

    // 如果左子节点大于根节点
    if (left < n && arr[left] > arr[largest])
        largest = left;

    // 如果右子节点大于根节点
    if (right < n && arr[right] > arr[largest])
        largest = right;

    // 如果最大值不是根节点，则交换根节点和最大值，并递归调整子树
    if (largest != i) {
        swap(&arr[i], &arr[largest]);
        maxHeapify(arr, n, largest);
    }
}

// 构建最大堆
void buildMaxHeap(int arr[], int n) {
    // 从最后一个非叶子节点开始向前遍历，依次调整堆
    for (int i = n / 2 - 1; i >= 0; i--)
        maxHeapify(arr, n, i);
}

// 堆排序
void heapSort(int arr[], int n) {
    // 构建最大堆
    buildMaxHeap(arr, n);

    // 从最后一个元素开始，依次将最大值移动到数组末尾，然后调整堆
    for (int i = n - 1; i > 0; i--) {
        swap(&arr[0], &arr[i]); // 将最大值移动到数组末尾
        maxHeapify(arr, i, 0);  // 调整堆
        printArray(arr, n);
    }
}

// 打印数组
void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

// 主函数
int main() {
    int n;
    scanf("%d", &n);
    int arr[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &arr[i]);
    }

    printf("原始数组: \n");
    printArray(arr, n);

    // 调用堆排序算法
    heapSort(arr, n);

    printf("排序后的数组: \n");
    printArray(arr, n);

    return 0;
}
