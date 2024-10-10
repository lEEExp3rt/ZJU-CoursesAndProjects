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

class Cat: private Animal {
private:
    string m_strName;
public:
    Cat(string name);
    inline void set_print_age(void);
    inline void set_print_weight(void);
};

Cat::Cat(string name): m_strName(name) {}

inline void Cat::set_print_age(void)
{
    set_age(5);
    cout << m_strName << ", age = " << m_nAgeBase << endl;
}

inline void Cat::set_print_weight(void)
{
    set_weight(6);
    cout << m_strName << ", weight = " << get_weight() << endl;
}

int main()
{
    Cat cat("Persian");     //定义派生类对象cat
    cat.set_print_age();
    cat.set_print_weight(); //派生类对象调用自己的公有函数
    return 0;
}
