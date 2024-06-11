#ifndef _STRINGREP_H
#define _STRINGREP_H

#include "UCObject.h"
#include <string.h>

class StringRep : public UCObject {
public:
    StringRep(const char *);
    ~StringRep();
    StringRep(const StringRep&);
    int length() const{ return strlen(m_pChars); }
    int equal(const StringRep&) const;
    const char* getRaw() const { return m_pChars; }
private:
    char *m_pChars;
    // reference semantics -- no assignment op!
    void operator=(const StringRep&) { }
};

#endif // _STRINGREP_H