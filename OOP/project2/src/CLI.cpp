/**
 * @file CLI.cpp
 * @author lqy
 * @brief The implementation of the command line interface.
 * @version 1.0
 * @date 2024-06-22
 * @copyright Copyright (c) 2024, !EEExp3rt. All rights reserved.
 */

#include "CLI.h"
#include <iostream>
#include <string>

CLI::CLI(): adventure(NUM)
{
    std::cout << "[Adventure] Welcome to the lobby." << std::endl;
}

void CLI::interact()
{
    std::cout << adventure.getInfo() << std::endl;
    std:: cout << "[Adventure] Enter a command: " << std::endl;
    std::string command;
    std::getline(std::cin, command);
    while (command.substr(0, 3) != "go ") {
        if (command == "exit") return;
        std::cout << "[Adventure] Invalid command! Please re-enter a command: " << std::endl;
        std::getline(std::cin, command);
    }
    int id = std::stoi(command.substr(3));
    if (adventure.go(id)) {
        GameStatus status = adventure.getStatus();
        switch (status) {
            case GameStatus::NORMAL:
                break;
            case GameStatus::WIN:
                std::cout << "[Adventure] Congratulations! You win!" << std::endl;
                break;
            case GameStatus::FAIL:
                std::cout << "[Adventure] Sorry, you lose! You don't find the princess. TT" << std::endl;
                break;
            case GameStatus::PRINCESS_FOUND:
                std::cout << "[Adventure] Congratulations! You found the princess!" << std::endl;
                break;
        }
    } else {
        std::cout << "[Adventure] Invalid direction!" << std::endl;
    }
    return;
}