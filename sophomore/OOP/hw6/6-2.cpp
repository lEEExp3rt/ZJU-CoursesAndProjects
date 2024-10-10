#include <iostream>
#include <string>
#include <iomanip>
using namespace std;

/* 请在这里填写答案 */
inline int add(int a, int b)
{
    return a + b;
}

inline double add(double a, double b)
{
    return a + b;
}

inline string add(string a, string b)
{
    return a + b;
}

int main()
{
    int a, b;
    double c, d;
    string s1, s2;

    cin >> a >> b;
    cin >> c >> d;
    cin >> s1 >> s2;

    cout << add(a, b) << endl;
    cout << fixed << setprecision(2) << add(c, d) << endl;
    cout << add(s1, s2) << endl;

    return 0;
}
