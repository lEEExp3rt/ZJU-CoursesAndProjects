#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

//你的代码将被嵌在这里
class Point {
public:
    double x;
    double y;
    void setX(double);
    void setY(double);
    double getX(void);
    double getY(void);
};

void Point::setX(double X)
{
    x = X;
}

void Point::setY(double Y)
{
    y = Y;
}

double Point::getX(void)
{
    return this->x;
}

double Point::getY(void)
{
    return this->y;
}

int main()
{
    Point p1, p2;
    double x1, y1, x2, y2;
    cin >> x1 >> y1 >> x2 >> y2;
    p1.setX(x1);
    p1.setY(y1);
    p2.setX(x2);
    p2.setY(y2);
    double x = p1.getX() - p2.getX();
    double y = p1.getY() - p2.getY();
    double len = sqrt(x * x + y * y);
    cout << fixed << setprecision(2) << len << endl;
    return 0;
}
