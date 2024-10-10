#include <iostream>
using namespace std;

class Dog {
public:
    void setAge(int a);
    int getAge();
    void setWeight(int w);
    int getWeight();
private:
    int age, weight;
};

int main()
{
    Dog d;
    int a, w;
    cin >> a >> w;
    d.setAge(a);
    d.setWeight(w);
    cout << d.getAge() << endl;
    cout << d.getWeight() << endl;
    return 0;
}

/* 你的代码将被嵌在这里 */
void Dog::setAge(int a)
{
    age = a;
}

int Dog::getAge(void)
{
    return age;
}

void Dog::setWeight(int w)
{
    weight = w;
}

int Dog::getWeight(void)
{
    return weight;
}
