/**
 * @headerfile Adventure.h
 * @author lqy
 * @brief Adventure game class, the main structure of the game.
 * @version 1.0
 * @date 2024-06-22
 * @copyright Copyright (c) 2024 !EEExp3rt. All rights reserved.
 */

#ifndef _ADVENTURE_H
#define _ADVENTURE_H

#include <string>
#include <vector>
#include "Room.h"

/**
 * @enum GameStatus
 * @brief The status of the game.
 */
enum GameStatus {
    NORMAL, // The game is running normally.
    PRINCESS_FOUND, // The princess is found.
    DEAD, // Meet the monster.
    WIN, // Find the exit.
    FAIL // Find the exit but not the princess.
};

/**
 * @class Adventure
 * @brief This class constructs the game structure.
 */
class Adventure {
public:
    /* Game Initalization */

    /**
     * @brief Construct a new Adventure object.
     * @param num The number of rooms in the game.
     */
    Adventure(int num);

    /**
     * @brief Add a new room.
     * @param type The type of the new room.
     * @note Randomly generate a new room and add it to the game.
     */
    void addRoom(RoomType type);

    /**
     * @brief Connect two rooms.
     * @param id1 The id of the first room.
     * @param id2 The id of the second room.
     * @return Whether the two rooms are connected successfully.
     */
    bool connectRooms(int id1, int id2);

    /* Game Play */

    /**
     * @brief For the player to go to a new room.
     * @param index The index of the next room.
     * @return True if the player can go to the next room, false otherwise.
     */
    bool go(int index);

    /**
     * @brief Check current status of the game.
     * @return The current status of the game.
     */
    GameStatus getStatus() const;

    /**
     * @brief Get the current room information.
     * @return A string of the current room information.
     */
    std::string getInfo() const;

private:
    int room_num; // The number of rooms in the game.
    std::vector<Room> rooms; // Record all the rooms.
    int current_id; // The current room id.
    GameStatus status; // The current status of the game.
};

#endif // _ADVENTURE_H