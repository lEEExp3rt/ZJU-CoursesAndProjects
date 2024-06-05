#include <iostream>
using namespace std;

/* 请在这里填写答案 */
template <class T>
class Vector {
    T* data;
    int size;
public:
    Vector();
    ~Vector();
    int add(T value);
    int get_size();
    T& operator[](int index);
    void remove(int index);
    Vector(const Vector<T>& other);
};

template <class T>
Vector<T>::Vector()
{
    data = nullptr;
    size = 0;
}

template <class T>
Vector<T>::~Vector()
{
    delete[] data;
}

template <class T>
int Vector<T>::add(T value)
{
    T* new_data = new T[size+1];
    for (int i = 0; i < size; i++) {
        new_data[i] = data[i];
    }
    new_data[size] = value;
    delete[] data;
    data = new_data;
    return size++;
}

template <class T>
int Vector<T>::get_size()
{
    return size;
}

template <class T>
T& Vector<T>::operator[](int index)
{
    return (0 <= index && index < size) ? data[index] : *(new T);
}

template <class T>
void Vector<T>::remove(int index)
{
    if (index < 0 || index >= size)
        return ;

    T* new_data = new T[size-1];
    for (int i = 0; i < index; i++) {
        new_data[i] = data[i];
    }
    for (int i = index+1; i < size; i++) {
        new_data[i-1] = data[i];
    }
    delete[] data;
    data = new_data;
    size--;
    return ;
}

template <class T>
Vector<T>::Vector(const Vector<T>& other)
{
    if (this != &other) {
        size = other.size;
        data = new T[size];
        for (int i = 0; i < size; i++) {
            data[i] = other.data[i];
        }
    }
}

int main()
{
    Vector<int> vint;
    int n,m;
    cin >> n >> m; /* n = 100, m = 50 */
    for ( int i=0; i<n; i++ ) {
        //    add() can inflate the vector automatically
        vint.add(i);    
    }
    //    get_size() returns the number of elements stored in the vector
    cout << vint.get_size() << endl; /* 100 */
    cout << vint[m] << endl; /* 50 */
    //    remove() removes the element at the index which begins from zero
    vint.remove(m);
    cout << vint.add(-1) << endl; /* 99 */
    cout << vint[m] << endl; /* 51 */
    Vector<int> vv = vint;
    cout << vv[vv.get_size()-1] << endl; /* -1 */
    vv.add(m);
    cout << vint.get_size() << endl; /* 100 */
}