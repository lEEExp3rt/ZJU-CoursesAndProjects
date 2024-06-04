#include <iostream>
using namespace std;

/* 请在这里填写答案 */
double division(int a, int b)
{
    if (b == 0) throw ("Divided by zero!");
    return a / b;
}

int main ()
{
    int x,y;
    double z = 0;

    cin>>x>>y;
    try {
        z = division(x, y);
        cout << z << endl;
    }catch (const char* msg) {
        cout << msg << endl;
    }
    return 0;
}