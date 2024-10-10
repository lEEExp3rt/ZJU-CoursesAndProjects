#include <iostream>
#include <string>
#include <numeric>
#include <vector>

using namespace std;

int lcm(int a, int b)
{
    return a * b / gcd(a, b);
}

class FS {
    int fz, fm;
public:
    FS(int z, int m) {
        if (z == 0) {
            fz = 0;
            fm = 1;
        }
        if (m < 0) {
            fz = -z;
            fm = -m;
        } else {
            fz = z;
            fm = m;
        }
        int g = gcd(fz, fm);
        if (g > 1) {
            fz /= g;
            fm /= g;
        }
    }
    FS operator+(const FS& other) const {
        int l = lcm(fm, other.fm);
        return FS(fz * l / fm + other.fz * l / other.fm, l);
    }
    friend ostream& operator<<(ostream& os, const FS& f) {
        os << f.fz << "z" << f.fm << "m";
        return os;
    }
};

int main()
{
    int n;
    cin >> n;
    cin.get();
    vector<FS> ans;
    for (int i = 0; i < n; i++) {
        string fs1, fs2;
        getline(cin, fs1);
        getline(cin, fs2);
        int fz1, fm1, fz2, fm2;
        fz1 = stoi(fs1.substr(0, fs1.find('z')));
        fm1 = stoi(fs1.substr(fs1.find('z') + 1, fs1.find('m')));
        fz2 = stoi(fs2.substr(0, fs2.find('z')));
        fm2 = stoi(fs2.substr(fs2.find('z') + 1, fs2.find('m')));
        FS f1(fz1, fm1), f2(fz2, fm2);
        ans.push_back(f1 + f2);
    }
    for (const FS& f : ans)
        cout << f << endl;
    return 0;
}