#include <iostream>
#include <vector>

using namespace std;

vector<int> sieve(int n); //函数声明,求n以内的质数

int main(int argc, char const *argv[])
{
    int n;
    cin >> n;

    vector<int> ans = sieve(n);

    cout << ans.size() << endl;
    for (int i = 0; i < ans.size(); i++) {
        cout << ans[i];
        if (i < ans.size() - 1)cout << " ";
    }
    cout << endl;

    return 0;
}

/* 请在这里填写答案 */
vector<int> sieve(int n) //函数声明, 求n以内的质数
{
    vector<int> ans;
    vector<bool> isPrime(n + 1, true);
    for (int i = 2; i * i < n; i++) {
        if (isPrime[i]) {
            for (int j = i * i; j < n; j += i)
                isPrime[j] = false;
        }
    }
    for (int i = 2; i < n; i++)
        if (isPrime[i])
            ans.push_back(i);
    return ans;
}
