#include "clock.h"
#include <string>

Clock::Clock(int hour, int minute, int second) : hour(24), minute(60), second(60)
{
    this->hour.setValue(hour);
    this->minute.setValue(minute);
    this->second.setValue(second);
}

std::string Clock::toString(void) const
{
    std::string str = hour.toString() + ":" + minute.toString() + ":" + second.toString();
    return str;
}

void Clock::dida(void)
{
    if (second.dida()) {
        if (minute.dida())
            hour.dida();
    }
}