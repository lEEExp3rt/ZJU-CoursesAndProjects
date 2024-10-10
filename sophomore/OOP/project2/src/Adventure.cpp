/**
 * @file Adventure.cpp
 * @author lqy
 * @brief Adventure class implementation.
 * @version 1.0
 * @date 2024-06-22
 * @copyright Copyright (c) 2024 by !EEExp3rt. All rights reserved.
 */

#include "Adventure.h"
#include <cstdlib>
#include <ctime>
#include <string>

Adventure::Adventure(int num): room_num(0), status(GameStatus::NORMAL), current_id(0)
{
    std::srand(std::time(nullptr));
    // Add rooms.
    int i;
    for (i = 0; i < num; i++) addRoom(RoomType::ROOM);
    addRoom(RoomType::MONSTER);
    addRoom(RoomType::PRINCESS);
    addRoom(RoomType::EXIT);
    // Connect rooms randomly.
    int connections = std::rand() % (room_num * (room_num - 1) / 2);
    i = 0;
    while (i < connections) {
        int id1 = std::rand() % room_num;
        int id2 = std::rand() % room_num;
        while (id1 == id2) {
            id2 = std::rand() % room_num;
        }
        if (connectRooms(id1, id2)) i++;
    }
}

void Adventure::addRoom(RoomType type)
{
    Room room(room_num, type);
    rooms.push_back(room);
    room_num++;
}

bool Adventure::connectRooms(int id1, int id2)
{
    Room& room1 = rooms[id1];
    Room& room2 = rooms[id2];
    // Check if the connection is valid.
    if (room1.getExits() > 6 || room1.isConnected(id2)) {
        return false;
    }
    if (room2.getExits() > 6 || room2.isConnected(id1)) {
        return false;
    }
    room1.connect(id2);
    room2.connect(id1);
    return true;
}

bool Adventure::go(int index)
{
    int id = rooms[current_id].getRoom(index);
    // Check if the exit is valid.
    if (id != -1) {
        current_id = index;
        Room room = rooms[current_id];
        // Update status.
        switch (room.getType()) {
            case RoomType::ROOM:
                break;
            case RoomType::MONSTER:
                status = GameStatus::DEAD;
                break;
            case RoomType::PRINCESS:
                // Check if the princess has been found.
                if (status == GameStatus::NORMAL) {
                    status = GameStatus::PRINCESS_FOUND;
                }
                break;
            case RoomType::EXIT:
                status = status == GameStatus::PRINCESS_FOUND? GameStatus::WIN : GameStatus::FAIL;
                break;
        }
        return true;
    } else {
        return false;
    }
}

GameStatus Adventure::getStatus() const { return status; }

std::string Adventure::getInfo() const
{
    std::string info;
    info.append("[Adventure] You are now in room " + std::to_string(current_id) + ". ");
    int num = rooms[current_id].getExits();
    info.append("There are " + std::to_string(num) + " exits as: ");
    for (int i = 0; i < num - 1; i++) {
        info.append("door " + std::to_string(i) + ", ");
    }
    info.append("door " + std::to_string(num - 1) + ".");
    return info;
}