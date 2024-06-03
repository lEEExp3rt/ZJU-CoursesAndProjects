#ifndef _CD_H
#define _CD_H

#include <string>
#include "collection.h"

class CD: public Collection {
    int tracks;
public:
    CD();
    CD(std::string artist, int tracks, int time, bool got, std::string comment);
    void parse(std::string input);
    void print(void) const;
};

#endif