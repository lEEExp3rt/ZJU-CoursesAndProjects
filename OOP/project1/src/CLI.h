#ifndef _CLI_H
#define _CLI_H

#include <iostream>
#include <string>
#include <vector>

/**
 * @brief The CLI class is used to read and parse user input commands.
*/
class CLI {
public:
    /**
     * @brief The ADIF_COMMAND enum defines all supported commands that can be entered by the user.
    */
    enum ADIF_COMMAND {
        PARSE_ADIF,
        PRINT_ADIF,
        EXPORT_ADIF_TO_CSV,
        EXPORT_ADIF_TO_JSON,
        SEARCH_ADIF_RECORDS,
        MODIFY_ADIF_RECORD,
        DELETE_ADIF_RECORD,
        EXIT,
        HELP,
        INVALID_COMMAND
    };

    /**
     * Constructor.
    */
    CLI();

    /**
     * Read and parse user input commands.
    */
    void readCommand();

    /**
     * Get the command entered by the user.
     * @return The command entered by the user.
    */
    ADIF_COMMAND getCommand() const;

    /**
     * Get the filename or key entered by the user for search or modify commands.
     * @return The filename or key entered by the user.
    */
    std::string getName() const;

    /**
     * Get the vector of `<fieldName, fieldValue>` pair to search or modify.
     * @return The vector of `<fieldName, fieldValue>` pair to search or modify.
    */
    std::vector<std::pair<std::string, std::string>> getSearchConditions() const;

    /**
     * Print the error message for invalid command entered by the user.
    */
    void printInvalidCommand(void) const;

    /**
     * Get the help mannual for user.
    */
    void printHelp(void) const;

    /**
     * Print welcome message.
    */
    void welcomeMessage(void);

    /**
     * Print goodbye message.
    */
    void goodbyeMessage(void);

private:
    ADIF_COMMAND command; // Store the command.
    std::string name; // Store the filename or key for search or modify commands.
    std::vector <std::pair<std::string, std::string>> searchConditions; // Store the search conditions.
};

#endif