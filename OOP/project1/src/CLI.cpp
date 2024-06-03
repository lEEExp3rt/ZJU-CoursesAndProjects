#include <iostream>
#include <string>
#include "CLI.h"

CLI::CLI()
{
    command = INVALID_COMMAND;
    name = "";
    searchConditions = std::vector<std::pair<std::string, std::string>>();
}

void CLI::readCommand()
{
    std::cout << "user@localhost:~$ ";
    std::string input;
    std::getline(std::cin, input);
    if (input.substr(0, 5) == "parse") {
        if (input.size() < 7) {
            command = INVALID_COMMAND;
        } else {
            name = input.substr(6);
            command = PARSE_ADIF;
        }
    } else if (input == "print") {
        command = PRINT_ADIF;
    } else if (input.substr(0, 12) == "export --csv") {
        if (input.size() < 14) {
            command = INVALID_COMMAND;
        } else {
            command = EXPORT_ADIF_TO_CSV;
            name = input.substr(13);
        }
    } else if (input.substr(0, 13) == "export --json") {
        if (input.size() < 15) {
            command = INVALID_COMMAND;
        } else {
            command = EXPORT_ADIF_TO_JSON;
            name = input.substr(14);
        }
    } else if (input == "search") {
        searchConditions.clear();
        command = SEARCH_ADIF_RECORDS;
        std::cout << "[ADIF] Input search condition(s): " << std::endl;
        std::string buffer;
        int num = 1;
        while (true) {
            std::cout << "Condition(" << num++ << "): ";
            getline(std::cin, buffer);
            if (buffer == "end") {
                break;
            }
            std::string fieldName, fieldValue;
            int pos = buffer.find(" ");
            if (pos == std::string::npos) {
                std::cout << "Invalid input! Please input again." << std::endl;
                num--;
                continue;
            }
            fieldName = buffer.substr(0, pos);
            fieldValue = buffer.substr(pos + 1);
            searchConditions.push_back(std::make_pair(fieldName, fieldValue));
        }
    } else if (input.substr(0, 6) == "modify") {
        if (input.size() < 8) {
            command = INVALID_COMMAND;
        } else {
            name = input.substr(7);
            std::cout << "[ADIF] Input modify field and value: " << std::endl;
            std::string buffer;
            command = MODIFY_ADIF_RECORD;
            int num = 1;
            while (true) {
                std::cout << "Pair(" << num++ << "): ";
                getline(std::cin, buffer);
                if (buffer == "end") {
                    break;
                }
                std::string fieldName, fieldValue;
                int pos = buffer.find(" ");
                if (pos == std::string::npos) {
                    std::cout << "Invalid input! Please input again." << std::endl;
                    num--;
                    continue;
                }
                fieldName = buffer.substr(0, pos);
                fieldValue = buffer.substr(pos + 1);
                searchConditions.push_back(std::make_pair(fieldName, fieldValue));
            }
        }
    } else if (input.substr(0, 6) == "delete") {
        if (input.size() < 8) {
            command = INVALID_COMMAND;
        } else {
            command = DELETE_ADIF_RECORD;
            name = input.substr(7);
        }
    } else if (input == "exit") {
        command = EXIT;
    } else if (input == "help") {
        command = HELP;
    } else {
        command = INVALID_COMMAND;
    }
    return ;
}

CLI::ADIF_COMMAND CLI::getCommand() const
{
    return command;
}

std::string CLI::getName() const
{
    return name;
}

std::vector<std::pair<std::string, std::string>> CLI::getSearchConditions() const
{
    return searchConditions;
}

void CLI::printInvalidCommand(void) const
{
    std::cout << "[ADIF] Invalid command! Type 'help' for help." << std::endl;
}

void CLI::printHelp(void) const
{
    std::cout << "##########################################" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##        ADIF Parser Help Menu         ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##  1. parse [filename]                 ##" << std::endl;
    std::cout << "##     Parse ADIF file and store        ##" << std::endl;
    std::cout << "##     it in memory.                    ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##  2. print                            ##" << std::endl;
    std::cout << "##     Print all ADIF records in        ##" << std::endl;
    std::cout << "##     console.                         ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##  3. export [--csv|--json] [filename] ##" << std::endl;
    std::cout << "##     Export ADIF records to CSV       ##" << std::endl;
    std::cout << "##     or JSON file.                    ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##  4. search                           ##" << std::endl;
    std::cout << "##     Search ADIF records by           ##" << std::endl;
    std::cout << "##     specific conditions in format    ##" << std::endl;
    std::cout << "##     <fieldName fieldValue>.          ##" << std::endl;
    std::cout << "##     Type 'End' to start search.      ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##  5. modify [recordID]                ##" << std::endl;
    std::cout << "##     Modify ADIF record by specific   ##" << std::endl;
    std::cout << "##     field and value in format        ##" << std::endl;
    std::cout << "##     <fieldName fieldValue>.          ##" << std::endl;
    std::cout << "##     Type 'End' to start modify.      ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##  6. delete [recordID]                ##" << std::endl;
    std::cout << "##     Delete ADIF record by its ID.    ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##  7. exit                             ##" << std::endl;
    std::cout << "##     Exit the program.                ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##  8. help                             ##" << std::endl;
    std::cout << "##     Show this help menu.             ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##---------------EXAMPLES---------------##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##  1. parse myadif.adi                 ##" << std::endl;
    std::cout << "##  2. print                            ##" << std::endl;
    std::cout << "##  3. export --csv output.csv          ##" << std::endl;
    std::cout << "##  4. search 20240531120503            ##" << std::endl;
    std::cout << "##     QSO_DATE 20240601                ##" << std::endl;
    std::cout << "##     CALL 111032564533                ##" << std::endl;
    std::cout << "##     End                              ##" << std::endl;
    std::cout << "##  5. modify 20240531010101            ##" << std::endl;
    std::cout << "##     QSO_DATE 20240601                ##" << std::endl;
    std::cout << "##     CALL 111032564533                ##" << std::endl;
    std::cout << "##     End                              ##" << std::endl;
    std::cout << "##  6. delete 20240531010203            ##" << std::endl;
    std::cout << "##  7. exit                             ##" << std::endl;
    std::cout << "##  8. help                             ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##########################################" << std::endl;
    return ;
}

void CLI::welcomeMessage(void)
{
    std::cout << "##########################################" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##      Welcome to my ADIF parser!      ##" << std::endl;
    std::cout << "##      Written by lqy 3220103373       ##" << std::endl;
    std::cout << "##      Type 'help' for help menu       ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##########################################" << std::endl;
    return ;
}

void CLI::goodbyeMessage(void)
{
    std::cout << "##########################################" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##              Goodbye!!!              ##" << std::endl;
    std::cout << "##                                      ##" << std::endl;
    std::cout << "##########################################" << std::endl;
    return ;
}