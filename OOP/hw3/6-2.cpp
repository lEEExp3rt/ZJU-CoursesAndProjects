#include <iostream>
using namespace std;

/* 请在这里填写答案 */
class Car {
    public:
        void disp_welcomemsg(void);
        int get_wheels(void);
        void set_wheels(int);
    private:
        int m_nWheels;
};

void Car::disp_welcomemsg(void)
{
    cout << "Welcome to the car world!" <<endl;
}

int Car::get_wheels(void)
{
    return m_nWheels;
}

void Car::set_wheels(int num)
{
    m_nWheels = num;
}

int main()
{
    int n;
    cin >> n;
    Car myfstcar, myseccar;    //定义类对象
    myfstcar.disp_welcomemsg();//访问成员函数，显示欢迎信息
    myfstcar.set_wheels(n);    //访问成员函数，设置车轮数量
    myseccar.set_wheels(n+4);  //访问成员函数，设置车轮数量
    //访问成员函数，显示车轮数量
    cout << "my first car wheels num = " << myfstcar.get_wheels() << endl;
    cout << "my second car wheels num = " << myseccar.get_wheels() << endl;

    return 0;
}

