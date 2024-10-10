#ifndef _CLOCK_H
#define _CLOCK_H

#include <string>
#include "numberdisplay.h"

class Clock {
private:
    NumberDisplay hour, minute, second;
public:
    Clock(int hour, int minute, int second); // create a clock with given time
    std::string toString() const; // get a string description of "hh:mm:ss"
    void dida(); // run a second
};

#endif