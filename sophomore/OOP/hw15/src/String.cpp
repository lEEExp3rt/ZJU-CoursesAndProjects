#include <string>
#include "String.h"
#include "StringRep.h"

String::String(const char* str): m_rep(0)
{
    m_rep = new StringRep(str);
}

String::~String() {}

String::String(const String& other): m_rep(other.m_rep) {}

String& String::operator=(const String& other)
{
    m_rep = other.m_rep;
    return *this;
}

int String::operator==(const String& other) const
{
    return m_rep->equal(*other.m_rep);
}

String String::operator+(const String& other) const
{
    std::string s1 = m_rep->getRaw();
    std::string s2 = other.getRaw();
    std::string s3 = s1 + s2;
    return String(s3.c_str());
}

int String::length() const
{
    return m_rep->length();
}

const char* String::getRaw() const
{
    return m_rep->getRaw();
}

int String::refCount() const
{
    return m_rep->references();
}