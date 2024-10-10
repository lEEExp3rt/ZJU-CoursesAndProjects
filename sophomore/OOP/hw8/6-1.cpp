#include <iostream>
#include <string>
using namespace std;

/* 请在这里填写答案 */
class Animal {
private:
    int m_nWeightBase;
protected:
    int m_nAgeBase;
public:
    inline void set_weight(int weight);
    inline void set_age(int age);
    inline int get_weight(void) const;
};

inline void Animal::set_weight(int weight)
{
    m_nWeightBase = weight;
}

inline void Animal::set_age(int age)
{
    m_nAgeBase = age;
}

inline int Animal::get_weight(void) const
{
    return m_nWeightBase;
}

class Cat: public Animal {
private:
    string m_strName;
public:
    Cat(string name);
    inline void print_age(void) const;
};

Cat::Cat(string name): m_strName(name) {};

inline void Cat::print_age(void) const
{
    cout << m_strName << ", age = " << m_nAgeBase << endl;
}

int main()
{
    Cat cat("Persian");   //定义派生类对象cat
    cat.set_age(5);       //派生类对象调用从基类继承的公有成员函数
    cat.set_weight(6);    //派生类对象调用从基类继承的公有成员函数
    cat.print_age();      //派生类对象调用自己的公有函数
    cout << "cat weight = " << cat.get_weight() << endl;
    return 0;
}
