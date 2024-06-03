#include <iostream>
using namespace std;

/* 请在这里填写答案 */

class CComplex {
    double real, imag;

public:
    CComplex(double r=0, double i=0): real(r), imag(i) {}
    CComplex operator+(const CComplex& c) const {
        return CComplex(real+c.real, imag+c.imag);
    }
    CComplex operator-(const CComplex& c) const {
        return CComplex(real-c.real, imag-c.imag);
    }
    friend ostream& operator<<(ostream& os, const CComplex& c) {
        if (c.imag>=0)
            os<<c.real<<"+"<<c.imag<<"i"<<endl;
        else
            os<<c.real<<c.imag<<"i"<<endl;
        return os;
    }
};

int main() {
    double r1,r2,i1,i2;
    cin>>r1>>i1;
    cin>>r2>>i2;
    CComplex c1(r1,i1),c2(r2,i2),c3,c4;
    cout<<c1;
    cout<<c2;
    c3=c1+c2;
    cout<<c3;
    c4=c1-c2;
    cout<<c4;
    return 0;
}