#include "StringRep.h"

StringRep::StringRep(const char *s)
{
    if (s) {
        m_pChars = new char[strlen(s) + 1];
        strcpy(m_pChars, s);
    } else {
        m_pChars = new char[1];
        *m_pChars = '\0';
    }
}

StringRep::~StringRep()
{
    delete [] m_pChars;
}

StringRep::StringRep(const StringRep &other)
{
    m_pChars = new char[other.length() + 1];
    strcpy(m_pChars, other.m_pChars);
}

int StringRep::equal(const StringRep &other) const
{
    return strcmp(m_pChars, other.m_pChars) == 0;
}