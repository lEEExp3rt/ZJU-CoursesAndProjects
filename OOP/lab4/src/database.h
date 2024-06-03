#ifndef _DATABASE_H
#define _DATABASE_H

#include <iostream>
#include <vector>
#include <string>
#include "collection.h"

class Database {
    std::vector<Collection*> data;
public:
    Database();
    void add(Collection* c);
    void list(void) const;
};

#endif