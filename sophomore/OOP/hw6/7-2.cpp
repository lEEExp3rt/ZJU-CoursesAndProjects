#include <iostream>
#include <string>
#include <map>
using namespace std;
int main()
{
    map<int, int>cnt;
    int tmp;
    while (cin >> tmp) {
        cnt[tmp]++;
        if (cin.get() == '\n')
            break;
    }
    int maxnum;
    int max = 0;
    for (const auto& account: cnt) {
        if (account.second > max || account.second == max && account.first < maxnum) {
            maxnum = account.first;
            max = account.second;
        }
    }
    cout << maxnum << endl;
    return 0;
}
