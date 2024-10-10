#ifndef _NUMBERDISPLAY_H
#define _NUMBERDISPLAY_H

#include <string>

class NumberDisplay {
private:
    const int limit;
    int value;
public:
    NumberDisplay(int ll); // create a number display with a given up-limit
    void setValue(int value); // set the value
    int getValue() const; // get the value
    std::string toString() const; // get a string description of the value, with leading 0 for value less than 10
    bool dida(); // increase the value by one, turn over to zero if the value reaches the limit, returns true if the value turned to zero
};
#endif