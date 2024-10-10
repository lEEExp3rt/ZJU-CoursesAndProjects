#ifndef _String_H
#define _String_H

#include "UCPointer.h"
#include "StringRep.h"

class String {
public:
    String(const char *);
    ~String();
    String(const String &);
    String &operator=(const String &);
    int operator==(const String &) const;
    String operator+(const String &) const;
    int length() const;
    const char *getRaw() const;
    int refCount() const;
private:
    //  define your own private members
    UCPointer<StringRep> m_rep;
};

#endif