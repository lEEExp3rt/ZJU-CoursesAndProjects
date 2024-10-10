#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <algorithm>
#include "ADIF.h"
#include "Record.h"

#define EndOfHeader "EOH"
#define EndOfRecord "EOR"

ADIF::ADIF()
{
    // Initialize variables.
    records = std::map<std::string, Record>();
    fieldNames = std::vector<std::string>();
}

std::vector<Record> ADIF::getRecords() const
{
    std::vector<Record> result;
    for (const auto& record : records) {
        result.push_back(record.second);
    }
    return result;
}

void ADIF::parse(std::string filename)
{
    if (filename.find(".adi") == std::string::npos) {
        throw std::runtime_error("[ERROR] Invalid file format: " + filename);
    }
    std::cout << "[ADIF] Start parsing ADIF file: " << filename << "..." << std::endl;
    // Open ADIF file for reading.
    std::ifstream file;
    file.open(filename, std::ios::in);
    if (!file.is_open()) {
        throw std::runtime_error("[ERROR] Failed to open file: " + filename);
    }
    // Read ADIF file into buffer.
    std::string buffer = "";
    while (!file.eof()) {
        char tmp = file.get();
        if (tmp == '\n')
            continue;
        buffer += tmp;
    }
    // Close ADIF file.
    file.close();
    // Get records.
    int pos1 = 0, pos2 = 0;
    std::string buf = ""; // Buffer to store data in buffer.
    while (1) {
        pos1 = buffer.find('<', pos2);
        if (pos1 == std::string::npos) // No more tags.
            break;
        pos2 = buffer.find('>', pos1);
        if (pos2 == std::string::npos) // Invalid tag.
            break;
        std::string tag = buffer.substr(pos1 + 1, pos2 - pos1 - 1);
        int sep_pos = tag.find(':');
        if (sep_pos != std::string::npos) { // B tag.
            int num = std::stoi(tag.substr(sep_pos + 1));
            std::string field = tag.substr(0, sep_pos);
            transform(field.begin(), field.end(), field.begin(), ::toupper); // Convert field name to uppercase.
            if (std::find(fieldNames.begin(), fieldNames.end(), field) == fieldNames.end()) {
                fieldNames.push_back(field);
            }
            buf += field + ':' + buffer.substr(pos2 + 1, num) + '\n';
        } else {
            transform(tag.begin(), tag.end(), tag.begin(), ::toupper);
            // A tag.
            if (tag == EndOfRecord) {
                Record record(buf);
                std::string id = record.getPrimaryKey();
                // Check if record already exists.
                if (records.count(id)) {
                    std::cout << "[ADIF] Record with ID = " << id << " already exists. Overwrite it? (Y/n): ";
                    std::string c;
                    getline(std::cin, c);
                    if (c == "y" || c == "Y" || c == "yes" || c == "Yes" || c == "YES") {
                        std::cout << "[ADIF] Overwriting record with ID = " << id << std::endl;
                        records.at(id) = record;
                    } else {
                        std::cout << "[ADIF] Skipping record with ID = " << id << std::endl;
                        continue;
                    }
                } else {
                    records.insert(std::pair<std::string, Record>(id, record));
                }
            } else if (tag == EndOfHeader) {
                continue;
            } else { // Invalid tag.
                throw std::runtime_error("[ERROR] Invalid tag: " + tag);
            }
        }
    }
    std::sort(fieldNames.begin(), fieldNames.end());
    std::cout << "[ADIF] Successfully parsed ADIF file: " << filename << std::endl;
    return ;
}

void ADIF::print(void) const
{
    std::cout << "[ADIF] Start printing " << records.size() << " ADIF data..." << std::endl;
    for (const auto& record : records) {
        record.second.print();
    }
    std::cout << "[ADIF] Printing ADIF data done." << std::endl;
    return ;
}

void ADIF::exportToCSV(std::string filename) const
{
    std::cout << "[ADIF] Start exporting to CSV file... " << filename << "..." << std::endl;
    std::string content = ""; // Content to write to file.
    // Write header.
    for (const std::string& field : fieldNames) {
        content += field + ',';
    }
    content.erase(content.end() - 1);
    content += '\n';
    // Write records.
    for (const auto& record : records) {
        for (const std::string& field : fieldNames) {
            content += record.second.getValue(field) + ',';
        }
        content.replace(content.length() - 1, 1, "\n");
    }
    content.erase(content.end() - 1);
    // Open file for writing.
    if (filename.find(".csv") == std::string::npos) {
        filename += ".csv";
    }
    if (filename.find("out/") == std::string::npos) {
        filename = "out/" + filename;
    }
    std::ofstream file;
    file.open(filename, std::ios::out);
    if (!file.is_open()) {
        throw std::runtime_error("[ERROR] Failed to export to file: " + filename);
    }
    file << content;
    file.close();
    std::cout << "[ADIF] Successfully exported to file: " << filename << std::endl;
    return ;
}

void ADIF::exportToJSON(std::string filename) const
{
    std::cout << "[ADIF] Start exporting to JSON file... " << filename << "..." << std::endl;
    std::string content = "{\n"; // Content to write to file.
    content += "\t\"Number of Records\": " + std::to_string(records.size()) + ",\n";
    // Write records.
    content += "\t\"Records Info\": [\n";
    for (const auto& record : records) {
        std::vector<std::string> fields = record.second.getFields();
        content += "\t\t{\n";
        for (const std::string& field : fields) {
            content += "\t\t\t\"" + field + "\": \"" + record.second.getValue(field) + "\",\n";
        }
        content.erase(content.end() - 2, content.end());
        content += "\n\t\t},\n";
    }
    content.erase(content.end() - 2, content.end());
    content += "\n\t]\n}"; // End of content.
    // Open file for writing.
    if (filename.find(".json") == std::string::npos) {
        filename += ".json";
    }
    if (filename.find("out/") == std::string::npos) {
        filename = "out/" + filename;
    }
    std::ofstream file;
    file.open(filename, std::ios::out);
    if (!file.is_open()) {
        throw std::runtime_error("[ERROR] Failed to export to file: " + filename);
    }
    file << content;
    file.close();
    std::cout << "[ADIF] Successfully exported to file: " << filename << std::endl;
    return ;
}

std::vector<Record> ADIF::searchRecords(std::vector<std::pair<std::string, std::string>> searchConditions) const
{
    std::cout << "[ADIF] Start searching records satisfying search conditions..." << std::endl;
    for (auto& condition : searchConditions) {
        transform(condition.first.begin(), condition.first.end(), condition.first.begin(), ::toupper);
    }
    std::vector<Record> result;
    for (const auto& record : records) {
        bool match = true;
        for (const auto& condition : searchConditions) {
            if (record.second.getValue(condition.first).find(condition.second) == std::string::npos) {
                match = false;
                break;
            }
        }
        if (match) {
            result.push_back(record.second);
        }
    }
    std::cout << "[ADIF] Searching records done, found " << result.size() << " records." << std::endl;
    for (const Record& record : result) {
        record.print();
    }
    return result;
}

bool ADIF::modifyRecord(std::string key, std::vector<std::pair<std::string, std::string>> valuePairs)
{
    if (!records.count(key)) {
        std::cout << "[ADIF] Record with ID = " << key << " does not exist, no modification is made." << std::endl;
        return false;
    }
    Record record = records.at(key);
    for (const auto& valuePair : valuePairs) {
        std::string fieldName = valuePair.first;
        std::string fieldValue = valuePair.second;
        transform(fieldName.begin(), fieldName.end(), fieldName.begin(), ::toupper);
        record.setField(fieldName, fieldValue);
    }
    std::string newKey = record.getPrimaryKey();
    // Check if primary key is changed.
    if (newKey != key) {
        // Check if new primary key already exists.
        if (records.count(newKey)) {
            std::cout << "[ADIF] Modified record with ID = " << newKey << " already exists. Overwrite it? (Y/n): ";
            std::string c;
            getline(std::cin, c);
            if (c == "y" || c == "Y" || c == "yes" || c == "Yes" || c == "YES") {
                std::cout << "[ADIF] Overwriting record with ID = " << newKey << std::endl;
                records.at(newKey) = record;
                std::cout << "[ADIF] Modified record with ID = " << key << " into new ID = " << newKey << " by overwriting the old one." << std::endl;
            } else {
                std::cout << "[ADIF] Skipping to modify record with ID = " << key << ", no modifiction is made." << std::endl;
            }           
        } else {
            records.insert(std::pair<std::string, Record>(newKey, record));
            records.erase(key);
            std::cout << "[ADIF] Modified record with ID = " << key << " into new ID = " << newKey << "." << std::endl;
        }
    } else {
        records.at(key) = record;
        std::cout << "[ADIF] Modified record with ID = " << key << "." << std::endl;
    }
    return true;
}

bool ADIF::deleteRecord(std::string key)
{
    if (!records.count(key)) {
        std::cout << "[ADIF] Record with ID = " << key << " does not exist, no deletion is made." << std::endl;
        return false;
    }
    records.erase(key);
    std::cout << "[ADIF] Deleted record with ID = " << key << "." << std::endl;
    return true;
}