#include <iostream>
#include <string>
#include <vector>
#include "database.h"
#include "collection.h"

using namespace std;

Database::Database()
{
    data.clear();
}

void Database::add(Collection* c)
{
    data.push_back(c);
}

void Database::list(void) const
{
    for (Collection* c : data)
        c->print();
    return ;
}