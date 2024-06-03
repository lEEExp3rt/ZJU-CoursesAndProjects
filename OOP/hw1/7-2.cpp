#include<iostream>
#include<string>
using namespace std;

int main()
{
    int N;
    string c, s;
    cin >> N >> c;
    cin.ignore();
    getline(cin, s);
    if ((int)s.length() < N) {
        while (N - s.length())
            s = c + s;
    }
    else
        s.erase(0, s.length() - N);
    cout << s << endl;
    return 0;
}
