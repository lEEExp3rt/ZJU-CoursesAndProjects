#ifndef _UCPOINTER_H
#define _UCPOINTER_H

template <class T>
class UCPointer {
private:
    T* m_pObj;
    void increment() { if (m_pObj) m_pObj->incr(); }
    void decrement() { if (m_pObj) m_pObj->decr(); }
public:
    UCPointer(T* r = 0): m_pObj(r) { increment();}
    ~UCPointer() { decrement(); };
    UCPointer(const UCPointer<T> & p);
    UCPointer& operator=(const UCPointer<T> &);
    T* operator->() const;
    T& operator*() const { return *m_pObj; };
};

template <class T>
UCPointer<T>::UCPointer(const UCPointer<T>& other): m_pObj(other.m_pObj)
{
    increment();
}

template <class T>
UCPointer<T>& UCPointer<T>::operator=(const UCPointer<T>& p)
{
    if (m_pObj != p.m_pObj) {
        decrement();
        m_pObj = p.m_pObj;
        increment();
    }
    return *this;
}

template <class T>
T* UCPointer<T>::operator->() const
{
    return m_pObj;
}

#endif