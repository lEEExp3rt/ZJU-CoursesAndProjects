#include<iostream>
using namespace std;
class A{
    int data;
public:
    A(int k=0){
        data=k;
    }
    void show(){
        cout<<"data="<<data<<endl;
    }
};

/* 请在这里填写答案 */
int main()
{
    A a1[3];
    a1[0].show();
    a1[1].show();
    a1[2].show();
    cout << endl;
    A a2[3] = {A(1), A(0), A(0)};
    a2[0].show();
    a2[1].show();
    a2[2].show();
    cout << endl;
    A a3[3] = {A(1), A(2), A(3)};
    a3[0].show();
    a3[1].show();
    a3[2].show();
    return 0;
}
