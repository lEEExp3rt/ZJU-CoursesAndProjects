#include <string>
#include "numberdisplay.h"

NumberDisplay::NumberDisplay(int ll): value(0), limit(ll) {};

void NumberDisplay::setValue(int value)
{
    this->value = value;
    return ;
}

int NumberDisplay::getValue(void) const
{
    return value;
}

std::string NumberDisplay::toString(void) const
{
    std::string str = (value < 10 ? "0" + std::to_string(value) : std::to_string(value));
    return str;
}

bool NumberDisplay::dida(void)
{
    setValue(value == limit - 1 ? 0 : value + 1);
    return getValue() == 0;
}