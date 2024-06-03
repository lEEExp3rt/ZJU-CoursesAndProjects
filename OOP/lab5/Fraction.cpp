#include <iostream>
using namespace std;

/* 请在这里填写答案 */
#include <string>
#include <numeric>
#include <cmath>

inline long long lcm(long long a, long long b)
{
    return a * b / gcd(a, b);
}

class Fraction {
    long long fz, fm;
public:
    Fraction(long long z = 1, long long m = 0);
    Fraction(long long z, double m = 1);
    Fraction(double d);
    friend istream& operator>>(istream& is, Fraction& f);
    friend ostream& operator<<(ostream& os, const Fraction& f);
    Fraction operator+(const Fraction& f) const;
    Fraction operator-(const Fraction& f) const;
    Fraction operator*(const Fraction& f) const;
    Fraction operator/(const Fraction& f) const;
    Fraction& operator=(const Fraction& f);
    operator double();
};

Fraction::Fraction(long long z, long long m)
{
    long long g = gcd(z, m);
    fz = g > 1? z / g : z;
    fm = g > 1? m / g : m;
}

Fraction::Fraction(long long z, double m)
{
    double zz = z / m;
    long long mm = 1;
    while (zz != floor(zz)) {
        zz *= 10;
        mm *= 10;
    }
    long long zz_int = static_cast<long long>(zz);
    long long g = gcd(zz_int, mm);
    fz = zz_int / g;
    fm = mm / g;
}

Fraction::Fraction(double d)
{
    long long mm = 1;
    while (d != floor(d)) {
        d *= 10;
        mm *= 10;
    }
    long long gg = static_cast<long long>(d);
    long long g = gcd(gg, mm);
    fz = gg / g;
    fm = mm / g;
}

istream& operator>>(istream& is, Fraction& f)
{
    string s;
    is >> s;
    int pos = s.find('/');
    f.fz = stoi(s.substr(0, pos));
    f.fm = stoi(s.substr(pos+1));
    return is;
}

ostream& operator<<(ostream& os, const Fraction& f)
{
    os << f.fz << "/" << f.fm;
    return os;
}

Fraction Fraction::operator+(const Fraction& f) const
{
    long long l = lcm(fm, f.fm);
    return Fraction(fz * l / fm + f.fz * l / f.fm, l);
}

Fraction Fraction::operator-(const Fraction& f) const
{
    long long l = lcm(fm, f.fm);
    return Fraction(fz * l / fm - f.fz * l / f.fm, l);
}

Fraction Fraction::operator*(const Fraction& f) const
{
    return Fraction(fz * f.fz, fm * f.fm);
}

Fraction Fraction::operator/(const Fraction& f) const
{
    return Fraction(fz * f.fm, fm * f.fz);
}

Fraction& Fraction::operator=(const Fraction& f)
{
    if (this == &f) return *this;
    fz = f.fz;
    fm = f.fm;
    return *this;
}

Fraction::operator double()
{
    return static_cast<double>(fz) / fm;
}

/* ---------- Test ---------- */

int main(void)
{
    Fraction f1;
    Fraction f2;
    cin >> f1 >> f2; // Input: 1/2 1/3
    cout << f1+f2 << endl; // Output: 5/6
    cout << (double)(f1+f2) << endl; // Output: 0.833333
    cout << f1-f2 << endl; // Output: 1/6
    cout << f1*f2 << endl; // Output: 1/6
    cout << f2/f1 << endl; // Output: 2/3
    double d;
    cin >> d; // Input: 0.5
    Fraction f((long long)(d*1e16), 1e16);
    cout << f << endl; // Output: 1/2
    f=0.5;
    cout << f << endl; // Output: 1/2
    Fraction*p = &f1;
    f1=*p;
    cout << f1 << endl; // Output: 1/2
    cin >> f1; // Input: 1/4
    f1 = f1*Fraction(2.0);
    cout << f1 << endl; // Output: 1/2
}