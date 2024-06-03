#ifndef _RECORD_H
#define _RECORD_H

#include <iostream>
#include <vector>
#include <map>

/**
 * A class to represent a single ADIF record.
 * @exception `std::runtime_error` if the input string has no primary key.
 * @note 1. All the values are stored in `string` format.
 * @note 2. `<QSO_DATE, TIME_ON>` is the primary key of the record.
 * @note 3. All the fields' name are stored in uppercase.
*/
class Record {
    std::map<std::string, std::string> fields; // Fields and values.
    int fieldSize; // Total size of fields.
public:
    /**
     * Constructor.
     * @param input A string of a ADIF record.
     * @note 1. The `input` string should be in one string and each record seperated by a newline.
     * @note 2. Each field and value pair should be in format `fieldName:value` and field name in uppercase.
     * @note 3. Invalid fields and records should be ignored and not passed to the constructor.
    */
    Record(std::string input);

    /**
     * Set a field with a value string.
     * @param field The name of the field in uppercase.
     * @param value The value of the field.
     * @note If the field already exists, the value will be updated.
    */
    void setField(std::string field, std::string value);

    /**
     * Get the value of a field.
     * @param field The name of the field.
     * @return The value of the field.
     * @note If the field does not exist, an empty string will be returned.
    */
    std::string getValue(std::string field) const;

    /**
     * Get the field names with valid data of the record.
     * @return A vector of field names.
    */
    std::vector<std::string> getFields(void) const;

    /**
     * Get the primary key of a record.
     * @return The primary key of the record in `string` format.
    */
    std::string getPrimaryKey(void) const;

    /**
     * Print the record to the console.
     * @note Each field and its value are printed in one line.
    */
    void print(void) const;
};

#endif