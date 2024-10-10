#include <complex>
#include <cstdlib>
#include <iostream>

using namespace std;

/* 请在这里填写答案 */

class CComplex {
private:
    double real;
    double image;
public:
    CComplex(): real(0), image(0) {};
    CComplex(double r, double i): real(r), image(i) {};
    void display(void);
    friend CComplex add(CComplex c1, CComplex c2);
    friend CComplex sub(CComplex c1, CComplex c2);
};

void CComplex::display(void)
{
    if (image < 0)
        cout << real << "-" << -image << "i" << endl;
    else
        cout << real << "+" << image << "i" << endl;
    return ;
}

CComplex add(CComplex c1, CComplex c2)
{
    CComplex ans(c1.real + c2.real, c1.image + c2.image);
    return ans;
}

CComplex sub(CComplex c1, CComplex c2)
{
    CComplex ans(c1.real - c2.real, c1.image - c2.image);
    return ans;
}

int main()
{
  double r1,r2,i1,i2;
    cin>>r1>>i1;
    cin>>r2>>i2;
    CComplex c1(r1,i1),c2(r2,i2),c3,c4;
    c1.display();
    c2.display();
    c3=add(c1,c2);
    c3.display();
    c4=sub(c1,c2);
    c4.display();
}
