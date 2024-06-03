/* 请在这里填写答案 */
#include <iostream>

using namespace std;

class Point {
    int x;
    int y;
public:
    Point(int a, int b):x(a),y(b) {}
    Point(const Point& p):x(p.x),y(p.y) {}
    Point operator+(Point& p)
    {
        Point ans(*this);
        ans.x += p.x;
        ans.y += p.y;
        return ans;
    }
    Point operator-(Point& p)
    {
        Point ans(*this);
        ans.x -= p.x;
        ans.y -= p.y;
        return ans;
    }
    Point& operator+=(Point& p)
    {
        x += p.x;
        y += p.y;
        return *this;
    }
    bool operator==(Point& p)
    {
        return x == p.x && y == p.y;
    }
    friend ostream& operator<<(ostream& os, Point& p)
    {
        os<<p.x<<","<<p.y;
        return os;
    }
};

int main(int argc, char const *argv[])
{
    Point p1(2,3);
    cout<<p1<<endl;
    Point p2(4,5);
    cout<<p2<<endl;
    Point p3 = p1+p2;    
    cout<<p3<<endl;
    p3 = p2-p1;
    cout<<p3<<endl;
    p1 += p2;
    cout<<p1<<endl;
    cout<<(p1==p2)<<endl;
    return 0;
}

