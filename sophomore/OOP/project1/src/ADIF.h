#ifndef _ADIF_H
#define _ADIF_H

#include <iostream>
#include <vector>
#include <map>
#include "Record.h"

/**
 * ADIF class to parse ADIF file and store data in main memory.
 * @exception Throw `std::runtime_error` when error happens.
 * @note If the ADIF file contains multiple ADIF data, they will be stored together.
*/
class ADIF {
    std::map<std::string, Record> records; // Store all records.
    std::vector<std::string> fieldNames; // Store all field names.
public:
    /**
     * Constructor to initialize ADIF object.
    */
    ADIF();

    /**
     * Get all records
     * @return A vector of Record objects.
    */
    std::vector<Record> getRecords() const;

    /**
     * Parse ADIF file and store data in main memory.
     * @param filename ADIF file name to open.
     * @exception `std::runtime_error`.
     * @note Data will be combined if there already exists data in the ADIF object.
    */
    void parse(std::string filename);

    /**
     * Print the ADIF data.
     * @note The header will be printed if it exists.
    */
    void print(void) const;

    /**
     * Export the ADIF data to CSV file.
     * @param filename CSV file name to export.
     * @exception `std::runtime_error`.
     * @note ".csv" suffix will be added if not present in the filename.
    */
    void exportToCSV(std::string filename) const;

    /**
     * Export the ADIF data to JSON file.
     * @param filename JSON file name to export.
     * @exception `std::runtime_error`.
     * @note ".json" suffix will be added if not present in the filename.
    */
    void exportToJSON(std::string filename) const;

    /**
     * Search ADIF record(s) with given field value.
     * @param searchConditions A vector of search conditions with pairs of `<fieldName, fieldValue>`.
     * @return A vector of Record objects.
    */
    std::vector<Record> searchRecords(std::vector<std::pair<std::string, std::string>> searchConditions) const;

    /**
     * Modify one ADIF record.
     * @param key The primary key of the record to modify.
     * @param valuePairs A vector of pairs of `<fieldName, fieldValue>` to modify.
     * @return True if the record is modified successfully, false otherwise.
     * @note If the record not exists it will be false.
    */
    bool modifyRecord(std::string key, std::vector<std::pair<std::string, std::string>> valuePairs);

    /**
     * Delete one ADIF record.
     * @param key The primary key of the record to delete.
     * @return True if the record is deleted successfully, false otherwise.
     * @note If the record not exists it will be false.
    */
    bool deleteRecord(std::string key);
};

#endif