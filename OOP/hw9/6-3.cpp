#include <iostream>
#include <cmath> 
using namespace std;

class shape {// 形状类
public:
 double getArea()  // 求面积
 {return -1;}
 double getPerimeter() // 求周长
 {return -1;}
};
/* 请在这里填写答案 */
//Your code will be embed-ed here.
#define pi 3.1415926
class RegularPolygon: public shape {
    int n;
    double s;
public:
    RegularPolygon(int nn, double ss): n(nn), s(ss) {}
    double getArea()
    {
        return n * s * s / (tan(pi / n) * 4); 
    }
    double getPerimeter()
    {
        return n * s;
    }
};

int main()
{
    int n; 
    double s;
    
    cin>>n>>s;
    RegularPolygon p(n,s);
    cout<<p.getArea()<<endl;

    cout<<p.getPerimeter()<<endl;

    return 0;
}
