#include <iostream>
using namespace std;

/* 请在这里填写答案 */
template <class T>
class MyArray {
    T *data;
    size_t size;
public:
    MyArray(size_t sz = 0);
    ~MyArray();
    bool check();
    void sort();
    void display();
};

template<class T>
MyArray<T>::MyArray(size_t sz): size(sz)
{
    data = new T[size];
    for (size_t i = 0; i < size; i++) {
        cin >> data[i];
    }
}

template<class T>
void MyArray<T>::sort()
{
    for (size_t i = 0; i < size - 1; i++) {
        size_t min_idx = i;
        for (size_t j = i + 1; j < size; j++) {
            if (data[j] < data[min_idx]) {
                min_idx = j;
            }
        }
        if (min_idx != i) {
            swap(data[i], data[min_idx]);
        }
    }
}

template<class T>
void MyArray<T>::display()
{
    for (size_t i = 0; i < size - 1; i++) {
        cout << data[i] << " ";
    }
    cout << data[size - 1] << endl;
}

/*-----------*/

template<class T>
MyArray<T>::~MyArray(){ delete[] data;}

template<class T>
bool MyArray<T>::check(){
    int i;
    for(i=0;i<size-1;i++)
        if(data[i]>data[i+1]) { cout<<"ERROR!"<<endl;return false;}
    return true;
}
int main( )
{
    MyArray<int> *pI;
    MyArray<float> *pF;
    MyArray<char> *pC;
    int ty, size;
    cin>>ty;
    while(ty>0){
        cin>>size;
        switch(ty){
            case 1: pI = new MyArray<int>(size);   pI->sort(); pI->check(); pI->display(); delete pI; break;
            case 2: pF = new MyArray<float>(size); pF->sort(); pF->check(); pF->display(); delete pF; break;
            case 3: pC = new MyArray<char>(size);  pC->sort(); pC->check(); pC->display(); delete pC; break;
        }
        cin>>ty;
    }
    return 0;
}