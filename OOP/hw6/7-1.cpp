#include <iostream>
#include <string>
#include <map>

using namespace std;

void account(void)
{
    int n;
    cin >> n;
    map<string, int> db;
    for (int i = 0; i < n; i++) {
        string tmp;
        cin >> tmp;
        db[tmp]++;
    }
    for (const auto& output: db)
        cout << output.first << " " << output.second << endl;
    return ;
}

int main()
{
    int T;
    cin >> T;
    for (int i = 0; i < T; i++)
        account();
    return 0;
}
