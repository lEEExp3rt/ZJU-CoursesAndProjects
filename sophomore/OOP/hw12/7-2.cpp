#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

class Complex {
    double real, imag;
public:
    Complex(double r = 0, double i = 0) : real(r), imag(i) {}
    double getModulus() const {
        return sqrt(real*real + imag*imag);
    }
    bool operator>(const Complex& c) const {
        return getModulus() > c.getModulus();
    }
};

int main()
{
    vector<bool> ans;
    while (true) {
        double r1, i1, r2, i2;
        cin >> r1 >> i1 >> r2 >> i2;
        if (!(r1 || i1 || r2 || i2))  break;
        ans.push_back(Complex(r1, i1) > Complex(r2, i2));
    }
    for (const bool& c : ans) {
        cout << (c ? "true" : "false") << endl;
    }
    return 0;
}