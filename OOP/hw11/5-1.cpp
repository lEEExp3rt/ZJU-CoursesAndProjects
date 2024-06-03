#include <iostream>
using namespace std;

class Point
{
private:
//访问权限设置，私有权限
    int x;//横坐标
    int y;//纵坐标
//访问权限设置，公有权限
public:
    //以下为构造函数，用参数a,b分别为横纵坐标进行初始化
    Point(int a,int b)
    {
        x = a;
        y = b;
    }
    
    //以下为拷贝构造函数，借用对象a_point完成初始化
    Point(const Point& a_point)
    {
        x=a_point.x;
        y=a_point.y;
    }
    
    //以下为析构函数
    ~Point()
    {
        cout<<"Deconstructed Point";
        print();
    }
    
    //以下为输出点的信息的函数，要求在一行中输出点的坐标信息，形如：(横坐标,纵坐标)
    void print()
    {
        cout<< "(" << x << ", " << y << ")" <<endl;
    }
};


int main()
{
    Point b_point(0,0);
    b_point.print();
    int a,b;
    //从标准输入流中提取数值给a,b
    cin >> a >> b;
    Point c_point(a,b);
    c_point.print();
  //主函数的返回语句
    return 0;
}
/*设输入为10 10，则本程序的运行结果为：
(0, 0)
(10, 10)
Deconstructed Point(10, 10)
Deconstructed Point(0, 0)
*/