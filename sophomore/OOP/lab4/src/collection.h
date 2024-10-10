#ifndef _COLLECTION_H
#define _COLLECTION_H

#include <string>

class Collection {
protected:
    std::string name;
    int time;
    bool gotIt;
    std::string comment;
public:
    Collection();
    Collection(std::string name, int time, bool gotIt, std::string comment);
    void parse(std::string name, int time, bool gotIt, std::string comment);
    virtual void print(void) const;
};

#endif
