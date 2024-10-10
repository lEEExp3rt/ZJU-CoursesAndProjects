#include <iostream>
using namespace std;

void Time(int a,int b,int c);

int main( )
{
    double a,b,c;
    cin>>a>>b>>c;
    
    try
    {
        Time(a,b,c);
    }

    catch(char * arg)
    {
        cout<<arg<<endl;
    }    

    catch(...)                       
    
    {
        cout<<"I have catched an exception!"<<endl;
    }

    return 0;
}

/* 请在这里填写答案 */
void Time(int a,int b,int c)
{
    if (a > 23 || b > 59 || c > 59) {
        cout << "The time is wrong!" << endl;
        return ;
    }
    if (a < 0 || b < 0 || c < 0) throw exception();
    cout << "The current time is: " << a << ":" << b << ":" << c << endl;
}