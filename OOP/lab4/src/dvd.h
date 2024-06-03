#ifndef _DVD_H
#define _DVD_H

#include <string>
#include "collection.h"

class DVD: public Collection {
    std::string title;
public:
    DVD();
    DVD(std::string director, std::string dvdTitle, int time, bool got, std::string comment);
    void parse(std::string input);
    void print(void) const;
};

#endif