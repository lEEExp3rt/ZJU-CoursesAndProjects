#include <iostream>
#include <iomanip>
using namespace std;

/* 你提交的代码将被嵌在这里 */
class TIME {
    private:
        int hour, minute, second;
    public:
        TIME(): hour(0), minute(0), second(0) {};
        TIME(int h, int m, int s): hour(h), minute(m), second(s) {};
        void Input(void);
        void Output(void) const;
        TIME Next(void); 
};

void TIME::Input(void)
{
    char op;
    cin >> hour >> op >> minute >> op >> second;
}

void TIME::Output(void) const
{
    cout << hour << ":" << minute << ":" << second;
}

TIME TIME::Next(void)
{
    this->second = (second == 59 ? 0 : second + 1);
    this->minute = (!second && minute == 59 ? 0 : minute + 1);
    if (!minute && !second)
        this->hour++;
    TIME next(this->hour, this->minute, this->second);
    return next;
}

int main()
{
    TIME a, b;
    a.Input();
    b = a.Next();
    a.Output();
    cout << ' ';
    b.Output();
    cout << endl;
    return 0;
}
