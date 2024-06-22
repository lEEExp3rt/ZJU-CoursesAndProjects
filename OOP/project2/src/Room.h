/**
 * @headerfile Room.h
 * @author lqy
 * @brief Room class definition for project2, basic class for the game.
 * @version 1.0
 * @date 2024-06-22
 * @copyright Copyright (c) 2024 !EEExp3rt. All rights reserved.
 */

#ifndef _ROOM_H
#define _ROOM_H

#include <vector>

/**
 * @class Room
 * @brief Room type for game Adventure.
 */
enum RoomType {
    ROOM, // Normal room.
    PRINCESS, // Princess room.
    MONSTER, // Monster room.
    EXIT // Room with exit.
};

/**
 * @brief Room class definition.
 */
class Room {
public:
    /**
     * @brief Default constructor of Room class.
     */
    Room() = default;

    /**
     * @brief Constructor of Room class.
     * @param id Room id.
     * @param type Room type.
     */
    Room(int id, RoomType type);

    /**
     * @brief Copy constructor of Room class.
     * @param other Another Room object.
     */
    Room(const Room& other) = default;

    /**
     * @brief Destructor of Room class.
     */
    ~Room() = default;

    /**
     * @brief Get room id.
     * @return Room id.
     */
    int getId() const;

    /**
     * @brief Get number of exits.
     * @return Number of exits.
     */
    int getExits() const;

    /**
     * @brief Get room type.
     * @return Room type.
     */
    RoomType getType() const;

    /**
     * @brief Check if the room has a connection to another room.
     * @param next_id Room id to check.
     * @return True if the room has a connection to the next_id, false otherwise.
     */
    bool isConnected(int next_id) const;

    /**
     * @brief Connect two rooms.
     * @param next_id Room id to connect.
     * @note Before connecting, make sure the rooms are not connected to this room or is fully connected already.
     */
    void connect(int next_id);

    /**
     * @brief Get the room id of the given index.
     * @param index The index of the room id to get.
     * @return The room id of the given index.
     * @note If the index is out of range, return -1.
     */
    int getRoom(int index) const;

private:
    int id_; // Room id.
    int exits_; // Number of exits.
    RoomType type_; // Room type.
    std::vector<int> rooms_; // Rooms connected to this room.
};

#endif // _ROOM_H