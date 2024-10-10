#include <iostream>
#include <random>
#include "SkipList.h"
using namespace std;

int main()
{
    /* Test0: Initialization */
    cout << "----------Test0: Initialization----------" << endl;
    // Initialize an empty SkipList.
    SkipList sl;

    // Check if the list is empty.
    sl.print();

    /* Test1: Insertion */
    cout << "----------Test1: Insertion----------" << endl;
    // Insert 10000 random integers into the list.
    int n = 100;
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<int> dis(1, n);
    int isInserted = 0;
    for (int i = 0; i < n; i++) {
        int num = dis(gen);
        if (sl.insert(num)) isInserted++;
    }
    cout << "Number of elements inserted: " << isInserted << endl; // Get the number of elements inserted.
    cout << "Size of the list: " << sl.getSize() << endl; // Get the size of the list.
    sl.print(); // Check the list.

    /* Test2: Finding */
    cout << "----------Test2: Finding----------" << endl;
    int FindNum = 20;
    for (int i = 0; i < FindNum; i++) {
        int num = dis(gen);
        if (sl.find(num)) {
            cout << num << " is found in the list." << endl;
        } else {
            cout << num << " is not found in the list." << endl;
        }
    }

    /* Test3: Deletion */
    cout << "----------Test3: Deletion----------" << endl;
    int DeleteNum = 10;
    for (int i = 0; i < DeleteNum; i++) {
        int num = dis(gen);
        if (sl.remove(num)) {
            cout << num << " is deleted from the list." << endl;
        } else {
            cout << num << " is not found in the list." << endl;
        }
    }

    /* Test4: Clearing */
    cout << "----------Test4: Clearing----------" << endl;
    sl.clear();
    cout << "Size of the list after clearing: " << sl.getSize() << endl; // Get the size of the list.
    sl.print(); // Check the list.

    return 0;
}