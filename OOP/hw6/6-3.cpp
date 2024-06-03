#include <iostream>
using namespace std;

/* 请在这里填写答案 */
inline int add(int a, int b = 20, int c = 30)
{
    return a + b + c;
}

int main()
{
    int a, b, c;

    cin >> a >> b >> c;

    cout << add(a) << endl;
    cout << add(a, b) << endl;
    cout << add(a, b, c) << endl;

    return 0;
}
