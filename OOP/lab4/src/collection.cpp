#include <string>
#include "collection.h"
using namespace std;

Collection::Collection(): name(""), time(0), gotIt(false), comment("") {}

Collection::Collection(string name, int time, bool gotIt, string comment)
{
    this->name = name;
    this->time = time;
    this->gotIt = gotIt;
    this->comment = comment;
}

void Collection::parse(string name, int time, bool gotIt, string comment)
{
    this -> name = name;
    this -> time = time;
    this -> gotIt = gotIt;
    this -> comment = comment;
    return ;
}

void Collection::print(void) const
{
    return ;
}
