#include <iostream>
#include <string>
#include <vector>
using namespace std;

int main()
{
    string str;
    vector<string> characters = {"0 ", "1,.?!", "2ABC", "3DEF", "4GHI", "5JKL", "6MNO", "7PQRS", "8TUV", "9WXYZ"};
    while (cin >> str)
    {
        cout << characters[str[0] - '0'][(str.length() - 1) % characters[str[0] - '0'].length()];
    }
    cout << endl;
    return 0;
}
