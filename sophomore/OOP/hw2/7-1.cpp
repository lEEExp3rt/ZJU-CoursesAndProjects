#include <iostream>
#include <string>
#include <map>
using namespace std;

int main()
{
    map<int, int>dict;
    int input;
    while (cin >> input) {
        dict[input]++;
        if (cin.get() == '\n')
            break;
    }
    int max = 0, maxobj;
    for (auto& item : dict) {
        if (item.second > max || item.second == max && item.first < maxobj) {
            max = item.second;
            maxobj = item.first;
        }
    }
    cout << maxobj << endl;
    return 0;
}
