#include <iostream>
#include "ADIF.h"
#include "CLI.h"

int main()
{
    CLI command;
    ADIF adif;
    command.welcomeMessage();
    while (true) {
        command.readCommand();
        try {
            switch(command.getCommand()) {
                case CLI::ADIF_COMMAND::PARSE_ADIF:
                    adif.parse(command.getName());
                    break;
                case CLI::ADIF_COMMAND::PRINT_ADIF:
                    adif.print();
                    break;
                case CLI::ADIF_COMMAND::EXPORT_ADIF_TO_CSV:
                    adif.exportToCSV(command.getName());
                    break;
                case CLI::ADIF_COMMAND::EXPORT_ADIF_TO_JSON:
                    adif.exportToJSON(command.getName());
                    break;
                case CLI::ADIF_COMMAND::SEARCH_ADIF_RECORDS:
                    adif.searchRecords(command.getSearchConditions());
                    break;
                case CLI::ADIF_COMMAND::MODIFY_ADIF_RECORD:
                    adif.modifyRecord(command.getName(), command.getSearchConditions());
                    break;
                case CLI::ADIF_COMMAND::DELETE_ADIF_RECORD:
                    adif.deleteRecord(command.getName());
                    break;
                case CLI::ADIF_COMMAND::EXIT:
                    command.goodbyeMessage();
                    return 0;
                case CLI::ADIF_COMMAND::HELP:
                    command.printHelp();
                    break;
                default:
                    command.printInvalidCommand();
                    break;
            }
        } catch (const std::runtime_error e) {
            std::cerr << e.what() << std::endl;
        }
    }
}