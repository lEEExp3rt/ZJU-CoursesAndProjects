#include<iostream>
#include<string>
using namespace std;

void sort(string array[], int size)
{
    int i, j, k;
    for (i = 0; i < size; i++) {
        k = i;
        for (j = i + 1; j < size; j++) {
            if (array[j].size() < array[k].size())
                k = j;
        }
        if (k != i) {
            string tmp = array[i];
            array[i] = array[k];
            array[k] = tmp;
        }
    }
    return;
}

int main()
{
    int n, cnt;
    while(cin >> n) {
        cnt = 0;
        cin.ignore();
        string str;
        string *array = new string[n];
        for (int i = 0; i < n; i++)
        {
            getline(cin, str);
            if (str == "stop") break;
            if (str == "") return 0;
            array[cnt++] = str;
        }
        sort(array, cnt);
        for (int i = 0; i < cnt; i++)
            cout << array[i] << endl;
    }
    return 0;
}
