/**
 * @file SkipList.hpp
 * @author lqy
 * @brief SkipList template implementation
 * @version 2.0
 * @date 2024-06-15
 * @copyright Copyright (c) 2024, !EEExp3rt. All rights reserved.
 * @note Updated version of SkipList.h.
 */
#ifndef _SKIPLIST_HPP
#define _SKIPLIST_HPP

/* Include */
#include <iostream>
#include <stdlib.h>

/* Macro definition */
#define MAXLEVEL 10 // Maximum level of the skip list.

/* Class definition */

/**
 * @brief Node class of the SkipList.
 */
template <typename T>
class Node {
private:
    T value; // The value of the node.
    int maxNodeLevel; // The maximum level of the node.
    Node<T>** next; // Next nodes in each level.
public:
    Node(): maxNodeLevel(0) {
        next = new Node<T>*[MAXLEVEL];
        for (int i = 0; i < MAXLEVEL; i++) {
            next[i] = nullptr;
        }
    }

    Node(const Node<T>& other) = default;

    Node<T>& operator=(const Node<T>& other) = default;

    ~Node() { delete [] next; }

    /**
     * @brief Get the value of the node.
     * @return The value of the node.
     */
    T getValue() const { return value; }

    /**
     * @brief Get the maximum level of the node.
     * @return The maximum level of the node.
     */
    int getLevel() const { return maxNodeLevel; }

    /**
     * @brief Get the next node in the specified level.
     * @param level The level of the next node.
     * @return The next node in the specified level.
     */
    Node<T>* getNext(int level = 0) const { return next[level]; }

    /**
     * @brief Set the value of the node.
     * @param value The new value of the node.
     */
    void setValue(T value) { this->value = value; }

    /**
     * @brief Set the value of the node.
     * @param value The new value of the node.
     */
    void setLevel(int level) { maxNodeLevel = level; }

    /**
     * @brief Set the index of the node in the SkipList.
     * @param index The new index of the node in the SkipList.
     */
    void setNext(int level, Node<T>* nextNode) { next[level] = nextNode; }

};

/**
 * @brief SkipList class.
 * @note The skip-list is in ascending order.
 */
template <typename T>
class SkipList {
public:
    /**
     * @brief Constructor of the SkipList.
     */
    SkipList();

    /**
     * @brief Destructor of the SkipList.
     */
    ~SkipList();

    /**
     * @brief Find the index of the node with the given value.
     * @param value The value of the node to be found.
     * @return If the node is found, return the the node; otherwise, return nullptr.
     */
    Node<T>* find(T value);

    /**
     * @brief Insert a new node with the given value.
     * @param value The value of the new node.
     */
    void insert(T value);

    /**
     * @brief Remove the node with the given value.
     * @param value The value of the node to be removed.
     * @return If the node exists, return true; otherwise, return false.
     */
    bool remove(T value);

    /**
     * @brief Print the SkipList.
     */
    void print();

    /**
     * @brief Get the number of nodes in the SkipList.
     * @return The number of nodes in the SkipList.
     */
    int getSize() const { return size; }

    /**
     * @brief Clear the SkipList.
     */
    void clear();

    /**
     * @brief Get the head node of the SkipList.
     * @return The head node of the SkipList.
     */
    Node<T>* getHead() { return head; }

private:
    int size; // The number of nodes in the SkipList.
    Node<T>* head; // The 1st node of the SkipList.

    /* Private utility methods */

    /**
     * @brief Search the index of the node with the given value.
     * @param value The value of the node to be found.
     * @param level The level of the node to be found.
     * @return Return the last node with its value less than the given value.
     * @note The next node of the returned node has equal value, greater value or is nullptr.
     */
    Node<T>* searchIndex(T value, int level = 0);

    /**
     * @brief Randomly generate a level for the new node.
     * @return A randomly generated level for the new node.
     */
    int randomLevel();

    /**
     * @brief Insert a new node at given level.
     * @param newnode The new node to be inserted.
     * @param level The level of the new node.
     */
    void insertNode(Node<T>* node, int level);

    /**
     * @brief Remove the node at given level.
     * @param node The node to be removed.
     * @param level The level of the node to be removed.
     * @return The node previously next to the removed node.
     */
    Node<T>* removeNode(Node<T>* node, int level);

};

/* Implementation */

template <typename T>
SkipList<T>::SkipList(): size(0), head(nullptr) {}

template <typename T>
SkipList<T>::~SkipList() { delete head; }

template <typename T>
Node<T>* SkipList<T>::searchIndex(T value, int level)
{
    // Boundary cases.
    if (!head) return nullptr; // Empty list.
    if (value < head->getValue()) return nullptr; // Value smaller than the head.
    // Value equal to the head.
    if (value == head->getValue()) {
        Node<T>* prev = new Node<T>();
        prev->setNext(level, head);
        prev->setLevel(head->getLevel());
        return prev;
    }

    // Search in each level from the highest to the lowest.
    int currentLevel = head->getLevel();
    int l = currentLevel;
    Node<T>* current = head;
    for (; l >= level; l--) {
        Node<T>* next = current->getNext(l);
        while (next != nullptr && next->getValue() < value) {
            current = next;
            next = next->getNext(l);
        }
    }

    return current; // The next node will be the node with the value, or the position to insert.
}

template <typename T>
Node<T>* SkipList<T>::find(T value)
{
    Node<T>* node = searchIndex(value);
    if (!node) return nullptr; // Empty list.
    node = node->getNext(0);
    if (!node) return nullptr; // Value not found.
    return node->getValue() == value ? node : nullptr; // If not found, return an empty node.
}

template <typename T>
int SkipList<T>::randomLevel()
{
    int level = 1;
    while (rand() % 2 && level < MAXLEVEL) {
        level++;
    }
    return level - 1;
}

template <typename T>
void SkipList<T>::insertNode(Node<T>* node, int level)
{
    // Find the index of the value to insert.
    Node<T>* target = searchIndex(node->getValue(), level);
    // Insert the new node.
    if (target) {
        Node<T>* next = target->getNext(level);
        target->setNext(level, node);
        node->setNext(level, next);
    } else {
        // Insert at the head.
        node->setNext(level, head);
    }
    return ;
}

template <typename T>
void SkipList<T>::insert(T value)
{
    // Check if the value already exists.
    // if (find(value)) return false;

    // Create a new node to insert.
    Node<T>* newNode = new Node<T>();
    newNode->setValue(value);

    // Case1: Insert into the empty list.
    if (!head) {
        newNode->setNext(0, nullptr);
        newNode->setLevel(0);
        head = newNode;
        size++;
        return ;
    }

    // Random level for the new node.
    int level = randomLevel();

    // Case2: Insert into the head.
    if (value <= head->getValue()) {
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
        return ;
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
    return ;
}

template <typename T>
Node<T>* SkipList<T>::removeNode(Node<T>* node, int level)
{
    // Find the previous node to the node to remove.
    Node<T>* prev = searchIndex(node->getValue(), level);
    // Remove the node.
    Node<T>* next = node->getNext(level);
    prev->setNext(level, next);
    node->setNext(level, nullptr);
    return prev;
}

template <typename T>
bool SkipList<T>::remove(T value)
{
    // Find the node to remove.
    Node<T>* prev = searchIndex(value);
    if (!prev) return false; // Empty list OR value smaller than the head.
    Node<T>* target = prev->getNext(0); // Move to the target node.
    if (!target || target->getValue() != value) return false; // Value not found.

    // Remove the head.
    if (value == head->getValue()) {
        Node<T>* newHead = head->getNext(0);
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

template <typename T>
void SkipList<T>::print()
{
    if (!head) {
        std::cout << "Empty list." << std::endl;
        return ;
    }
    for (int i = head->getLevel(); i >= 0; i--) {
        std::cout << "Level [" << i << "]: ";
        Node<T>* current = head;
        while (current) {
            std::cout << current->getValue() << " -> ";
            current = current->getNext(i);
        }
        std::cout << std::endl;
    }
    return ;
}

template <typename T>
void SkipList<T>::clear()
{
    delete head;
    head = nullptr;
    size = 0;
    return ;
}

#endif // _SKIPLIST_HPP