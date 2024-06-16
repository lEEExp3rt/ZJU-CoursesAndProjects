/**
 * @file SkipList.cpp
 * @author lqy
 * @brief Basic implementation of SkipList.
 * @version 1.0
 * @date 2024-06-14
 * @copyright Copyright (c) 2024, !EEExp3rt. All rights reserved.
 * @note Only basic implementation, not optimized for performance. Only supports integer values.
 */

#include <iostream>
#include <stdlib.h>
#include "SkipList.h"

SkipList::SkipList(): size(0), head(nullptr) {}

SkipList::~SkipList() { delete head; }

Node* SkipList::searchIndex(int value, int level)
{
    // Boundary cases.
    if (!head) return nullptr; // Empty list.
    if (value < head->getValue()) return nullptr; // Value smaller than the head.
    // Value equal to the head.
    if (value == head->getValue()) {
        Node* prev = new Node();
        prev->setNext(level, head);
        prev->setLevel(head->getLevel());
        return prev;
    }

    // Search in each level from the highest to the lowest.
    int currentLevel = head->getLevel();
    int l = currentLevel;
    Node* current = head;
    for (; l >= level; l--) {
        Node* next = current->getNext(l);
        while (next != nullptr && next->getValue() < value) {
            current = next;
            next = next->getNext(l);
        }
    }

    return current; // The next node will be the node with the value, or the position to insert.
}

Node* SkipList::find(int value)
{
    Node* node = searchIndex(value);
    if (!node) return nullptr; // Empty list.
    node = node->getNext(0);
    if (!node) return nullptr; // Value not found.
    return node->getValue() == value ? node : nullptr; // If not found, return an empty node.
}

int SkipList::randomLevel()
{
    int level = 1;
    while (rand() % 2 && level < MAXLEVEL) {
        level++;
    }
    return level - 1;
}

void SkipList::insertNode(Node* node, int level)
{
    // Find the index of the value to insert.
    Node* target = searchIndex(node->getValue(), level);
    // Insert the new node.
    if (target) {
        Node* next = target->getNext(level);
        target->setNext(level, node);
        node->setNext(level, next);
    } else {
        // Insert at the head.
        node->setNext(level, head);
    }
    return ;
}

bool SkipList::insert(int value)
{
    // Check if the value already exists.
    // if (find(value)) return false;

    // Create a new node to insert.
    Node* newNode = new Node();
    newNode->setValue(value);

    // Case1: Insert into the empty list.
    if (!head) {
        newNode->setNext(0, nullptr);
        newNode->setLevel(0);
        head = newNode;
        size++;
        return true;
    }

    // Random level for the new node.
    int level = randomLevel();

    // Case2: Insert into the head.
    if (value < head->getValue()) {
        level = std::max(level, head->getLevel()); // Update the level if necessary.
        for (int i = 0; i <= head->getLevel(); i++) {
            newNode->setNext(i, head);
        }
        for (int i = head->getLevel() + 1; i <= level; i++) {
            newNode->setNext(i, nullptr);
        }
        newNode->setLevel(level);
        head = newNode;
        size++;
        return true;
    }

    // Case3: Insert into the middle or tail.
    newNode->setLevel(level);
    // Update the head's level if necessary.
    if (level > head->getLevel()) {
        for (int i = head->getLevel() + 1; i <= level; i++) {
            head->setNext(i, nullptr);
        }
        head->setLevel(level);
    }
    // Insert the new node and update each level.
    for (int i = 0; i <= level; i++) {
        insertNode(newNode, i);
    }
    size++;
    return true;
}

Node* SkipList::removeNode(Node* node, int level)
{
    // Find the previous node to the node to remove.
    Node* prev = searchIndex(node->getValue(), level);
    // Remove the node.
    Node* next = node->getNext(level);
    prev->setNext(level, next);
    node->setNext(level, nullptr);
    return prev;
}

bool SkipList::remove(int value)
{
    // Find the node to remove.
    Node* prev = searchIndex(value);
    if (!prev) return false; // Empty list OR value smaller than the head.
    Node* target = prev->getNext(0); // Move to the target node.
    if (!target || target->getValue() != value) return false; // Value not found.

    // Remove the head.
    if (value == head->getValue()) {
        Node* newHead = head->getNext(0);
        for (int i = 0; i <= newHead->getLevel(); i++) head->setNext(i, nullptr);
        for (int i = newHead->getLevel() + 1; i <= head->getLevel(); i++) {
            newHead->setNext(i, head->getNext(i));
            head->setNext(i, nullptr);
        }
        newHead->setLevel(head->getLevel());
        head = newHead;
        size--;
        delete target;
        return true;
    }

    // Remove the node and update each level.
    for (int i = target->getLevel(); i >= 0; i--) {
        removeNode(target, i);
    }
    delete target;
    size--;
    return true;
}

void SkipList::print()
{
    if (!head) {
        std::cout << "Empty list." << std::endl;
        return ;
    }
    for (int i = head->getLevel(); i >= 0; i--) {
        std::cout << "Level [" << i << "]: ";
        Node* current = head;
        while (current) {
            std::cout << current->getValue() << " -> ";
            current = current->getNext(i);
        }
        std::cout << std::endl;
    }
    return ;
}

void SkipList::clear()
{
    delete head;
    head = nullptr;
    size = 0;
    return ;
}