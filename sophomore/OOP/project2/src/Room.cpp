/**
 * @file Room.cpp
 * @author lqy
 * @brief Room class implementation
 * @version 1.0
 * @date 2024-06-24
 * @copyright Copyright (c) 2024 !EEExp3rt. All rights reserved.
 */

#include "Room.h"
#include <algorithm>
#include <string>
#include <cstdlib>
#include <ctime>
#include <vector>

Room::Room(int id, RoomType type): id_(id), exits_(0), type_(type)
{
    rooms_ = std::vector<int>();
}

int Room::getId() const { return id_; }

int Room::getExits() const { return exits_; }

RoomType Room::getType() const { return type_; }

bool Room::isConnected(int next_id) const
{
    return std::find(rooms_.begin(), rooms_.end(), next_id) != rooms_.end();
}

void Room::connect(int next_id)
{
    rooms_.push_back(next_id);
    exits_++;
}

int Room::getRoom(int index) const
{
    return (index >= 0 && index < exits_) ? rooms_[index] : -1;
}