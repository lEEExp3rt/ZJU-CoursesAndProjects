#include <iostream>
#include <string>
#include <vector>
#include <map>
#include "Record.h"

Record::Record(std::string input)
{
    fields = std::map<std::string, std::string>();
    fieldSize = 0;
    int pos;
    while (1) {
        // Find field.
        pos = input.find(":");
        if (pos == std::string::npos)
            break;
        std::string field = input.substr(0, pos);
        input = input.substr(pos + 1);
        // Find value.
        pos = input.find('\n');
        std::string value = input.substr(0, pos);
        input = input.substr(pos + 1);
        setField(field, value);
    }
    // No primary key.
    if (!(fields.count("QSO_DATE") && fields.count("TIME_ON"))) {
        throw std::runtime_error("Invalid record: no primary key.");
    }
}

void Record::setField(std::string field, std::string value)
{
    if (!fields.count(field)) // New field.
        fieldSize++;
    fields[field] = value;
}

std::string Record::getValue(std::string field) const
{
    if (fields.count(field))
        return fields.at(field);
    else
        return "";
}

std::vector<std::string> Record::getFields(void) const
{
    std::vector<std::string> result;
    for (const auto& field: fields)
        result.push_back(field.first);
    return result;
}

std::string Record::getPrimaryKey(void) const
{
    return fields.at("QSO_DATE") + fields.at("TIME_ON");
}

void Record::print(void) const
{
    std::cout << "---------- Record Info ----------" << std::endl;
    std::cout << "(0) ID: " << getPrimaryKey() << std::endl;
    int index = 1;
    for (const auto& field: fields)
        std::cout << "(" << index++ << ") " << field.first << ": " << field.second << std::endl; 
    std::cout << "-------------- END --------------" << std::endl;
    return ;
}