#include<iostream>
#include<string>
using namespace std;

int main()
{
    string s1, s2;
    getline(cin, s1);
    getline(cin, s2);
    int pos = 0;
    while ((pos = s1.find(s2, 0)) != -1)
        s1.erase(pos, s2.length());
    cout << s1 << endl;
    return 0;
}
