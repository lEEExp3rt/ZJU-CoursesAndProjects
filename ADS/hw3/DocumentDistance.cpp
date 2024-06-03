#include <iostream>
#include <iomanip>
#include <numeric>
#include <string>
#include <map>
#include <vector>
#include <cmath>
using namespace std;

vector<int> frequence_vector(map<string, map<string, int>> wordlist, string fname)
{
    vector<int> ans;
    for (const auto& book : wordlist) {
        map<string, int> tmp = book.second;
        ans.push_back(tmp[fname]);
    }
    return ans;
}

int main()
{
    int N, M;
    cin >> N;
    map<string, map<string, int>> F;
    vector<string> files;
    // Read file information.
    for (int i = 0; i < N; i++) {
        string filename;
        string word;
        cin >> filename;
        files.push_back(filename);
        cin >> word;
        while (word != "#") {
            F[word][filename]++;
            cin >> word;
        }
    }
    // Update.
    for (const auto& words : F) {
        map<string, int> tmp = words.second;
        for (string ff : files)
            if (!tmp.count(ff))
                F[words.first][ff] = 0;
    }
    cin >> M;
    vector<double> ans;
    // Calculate.
    for (int i = 0; i < M; i++) {
        string fname1, fname2;
        cin >> fname1 >> fname2; 
        vector<int> f1 = frequence_vector(F, fname1);
        vector<int> f2 = frequence_vector(F, fname2);
        int f1f2 = inner_product(f1.begin(), f1.end(), f2.begin(), 0);
        int f1f1 = inner_product(f1.begin(), f1.end(), f1.begin(), 0);
        int f2f2 = inner_product(f2.begin(), f2.end(), f2.begin(), 0);
        ans.push_back(acos(1.0 * f1f2 / (sqrt(f1f1) * sqrt(f2f2))));
    }
    // Output.
    int cnt = 0;
    for (double answer : ans) 
        cout << fixed << setprecision(3) << "Case " << ++cnt << ": " << answer << endl;
    return 0;
}
