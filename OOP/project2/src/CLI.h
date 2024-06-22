/**
 * @headerfile CLI.h
 * @author lqy
 * @brief The CLI interface for the game.
 * @version 1.0
 * @date 2024-06-22
 * @copyright Copyright (c) 2024, !EEExp3rt. All rights reserved.
 */


#ifndef _CLI_H
#define _CLI_H

#define NUM 7
#include "Adventure.h"

/**
 * @brief The CLI interface for the game.
 */
class CLI {
public:
    /**
     * @brief Constructor of the CLI interface.
     */
    CLI();

    /**
     * @brief Read command and interact.
     */
    void interact();

private:
    Adventure adventure;
};

#endif