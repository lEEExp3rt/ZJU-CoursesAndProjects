#include <iostream>
#include <string>
#include <map>
#include <vector>

using namespace std;

class MyMap {
    map<string, int> mm;
public:
    void Insert(string key, int value);
    int sum(string prefix) const;
};

void MyMap::Insert(string key, int value)
{
    mm[key] = value;
}

int MyMap::sum(string prefix) const
{
    int s = 0;
    for (const auto& pair: mm) {
        if (pair.first.find(prefix) != -1)
            s += pair.second;
    }
    return s;
}

using namespace std;

int main()
{
    int n;
    MyMap mymap;
    cin >> n;
    vector<int> ans;
    for (int i = 0; i < n; i++) {
        string op, tmp;
        cin >> op >> tmp;
        if (op == "insert") {
            int num;
            cin >> num;
            mymap.Insert(tmp, num);
        }
        else
            ans.push_back(mymap.sum(tmp));
    }
    for (const auto& obj: ans)
        cout << obj << endl;
    return 0;
}
