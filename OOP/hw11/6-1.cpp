#include <iostream>
using namespace std;
class ArrayIndexOutOfBoundsException{  // 异常类
public:
    int index;
    ArrayIndexOutOfBoundsException(int k){
        index = k;
    }
};
class Array{
private:
    int *data;
    int size;
    static const int dSize = 10;   // 数组默认大小
public:
    Array( ){  // 无参构造
        size = dSize;
        data = new int[size]( );
    }
        
/** 你提交的代码将被嵌在这里（替换本行内容） **/        
    Array(int n){
        size = n;
        data = new int[size]();
    }

    Array(const Array& a){  // 拷贝构造
        size = a.size;
        data = new int[size]();
        for(int i=0; i<size; i++) data[i] = a.data[i];
    }

    Array& operator = (const Array& a) {
        if (!(this == &a)) {
            this->size = a.size;
            delete[] this->data;
            this->data = new int[this->size]();
            for (int i = 0; i < this->size; i++)
                this->data[i] = a.data[i];
        }
        return *this;
    }

    bool operator == (const Array& a) const{  // 运算符 == 重载，以方便数组的比较
        if (this->size != a.size) return false;
        for(int i = 0; i < this->size; i++)
            if (this->data[i] != a.data[i])
                return false;
        return true;
    }
        
    int& operator [] (int k){     // 运算符 [ ] 重载，以方便数组的使用
        if(k<0 || k>=size) throw ArrayIndexOutOfBoundsException(k);
        return data[k];
    }
    friend ostream& operator << (ostream& o, const Array& a);   // 运算符 << 重载，以方便输出
};
ostream& operator << (ostream& o, const Array& a){
    o << '[' ;
    for(int i=0; i<a.size-1; i++)
        o << a.data[i] << ',' ;
    o << a.data[a.size-1] << ']';
    return o;
}
// 注意：实际测试程序中，在此处之前的代码与样例中相同
// 注意：实际测试程序中，在此处之后的代码（即main函数）可能与样例中不同
int main(){
    int n, k;
    cin >> n >> k;
    Array a(n);  // 构造数组，大小为 n
    for(int i=0; i<n; i++) a[i] = i;
    Array b = a;  // 拷贝构造数组
    b[n/2] = k;
    cout << a << endl;
    cout << b << endl;
    Array c;  // 构造数组，默认大小
    c = a; // 拷贝数组
    c[n/2] = k;
    cout << a << endl;
    cout << c << endl;
    a = a;
    a[n/2] = 2223;
    cout << a << endl;
    return 0;
}