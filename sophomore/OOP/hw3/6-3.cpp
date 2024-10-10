#include <iostream>
using namespace std;
class Point {
    public: 
        void setXY(int, int);
        int getX(void);
        int getY(void);
    private:
        int x, y;
};
void Point::setXY(int x, int y)
{
    this->x = x;
    this->y = y;
}
int Point::getX(void)
{
    return x;
}
int Point::getY(void)
{
    return y;
}
int main()
{
    Point p1,p2;
    p1.setXY(1,2);
    p2.setXY(3,4);
    cout<<"x of Point p1："<<p1.getX()<<endl;
    cout<<"y of Point p2："<<p1.getY()<<endl;
    cout<<"Point P2:("<<p2.getX()<<","<<p2.getY()<<")"<<endl;
    return 0;
}
