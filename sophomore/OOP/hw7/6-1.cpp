#include <iostream>
#include <string>
using namespace std;

inline string myMax(int obj1, int obj2)
{
    return to_string(obj1 > obj2 ? obj1 : obj2);
}

inline string myMax(int obj1, int obj2, int obj3)
{
    return myMax(stoi(myMax(obj1, obj2)), obj3);
}

inline string myMax(double obj1, double obj2)
{
    return to_string(obj1 > obj2 ? obj1 : obj2).substr(0, 3);
}

/* 请在这里填写答案 */

int main(){
    cout << myMax(3, 4) <<endl;
    cout << myMax(3, 4, 5) <<endl;
    cout << myMax(4.3, 3.4) << endl;
    return 0;
}
