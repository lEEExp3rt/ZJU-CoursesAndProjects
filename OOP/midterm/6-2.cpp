#include <iostream>
using std::cin;
using std::cout;
using std::endl;
using std::string;

/* Your code will be put here */
class Shape {
public:
    virtual ~Shape();
    virtual double area();
};

class Rect: public Shape {
    double a;
    double b;
public:
    Rect(double aa=0., double bb=0.): a(aa), b(bb) {}
    ~Rect() {}
    double area() {return a * b; }
};

class Disk : public Shape
{
double r;
public : 
    Disk(double r=0.):r(r){}
    ~Disk(){}
public : 
    double area(){ return 3.14159*r*r; }
};
using Shape_ptr = Shape*; // pointer of Shape
int main()
{
    int n;
    string type;
    cin>>n;
    Shape_ptr shapes[n];
    for(int i=0;i<n;++i)
    {
        cin>>type;
        if(type=="disk")
        {
            double r;
            cin>>r;
            shapes[i] = new Disk(r);
        }
        else if(type=="rect")
        {
            double a, b;
            cin>>a>>b;
            shapes[i] = new Rect(a, b);
        }
    }
    for(int i=0;i<n;++i)
    {
        Shape_ptr shape = shapes[i];
        cout<<shape->area()<<" ";
        delete shape;
    }
    cout<<endl;

    return 0;
}
