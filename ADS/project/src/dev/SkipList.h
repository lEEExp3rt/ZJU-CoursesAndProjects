/**
 * @headerfile SkipList.h
 * @author lqy
 * @brief SkipList implementation
 * @version 1.0
 * @date 2024-06-14
 * @copyright Copyright (c) 2024, !EEExp3rt. All rights reserved.
 * @note Only supports integer value type.
 */
#ifndef _SKIPLIST_H
#define _SKIPLIST_H

#define MAXLEVEL 10 // Maximum level of the skip list.

/**
 * @brief Node of the SkipList.
 */
class Node {
private:
    int value; // The value of the node.
    int maxNodeLevel; // The maximum level of the node.
    Node** next; // Next nodes in each level.
public:
    Node(): value(0), maxNodeLevel(0) {
        next = new Node*[MAXLEVEL];
        for (int i = 0; i < MAXLEVEL; i++) {
            next[i] = nullptr;
        }
    }

    Node(const Node& other) = default;

    Node& operator=(const Node& other) = default;

    ~Node() { delete [] next; }

    /**
     * @brief Get the value of the node.
     * @return The value of the node.
     */
    int getValue() const { return value; }

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
    Node* getNext(int level = 0) const { return next[level]; }

    /**
     * @brief Set the value of the node.
     * @param value The new value of the node.
     */
    void setValue(int value) { this->value = value; }

    /**
     * @brief Set the value of the node.
     * @param value The new value of the node.
     */
    void setLevel(int level) { maxNodeLevel = level; }

    /**
     * @brief Set the index of the node in the SkipList.
     * @param index The new index of the node in the SkipList.
     */
    void setNext(int level, Node* nextNode) { next[level] = nextNode; }

};

/**
 * @brief SkipList class.
 * @attention Only supports integer values.
 * @note The skip-list is in ascending order.
 */
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
    Node* find(int value);

    /**
     * @brief Insert a new node with the given value.
     * @param value The value of the new node.
     * @return If the node is inserted, return true; otherwise, return false.
     * @note If the value already exists in the SkipList, it will not be inserted again.
     */
    bool insert(int value);

    /**
     * @brief Remove the node with the given value.
     * @param value The value of the node to be removed.
     * @return If the node exists, return true; otherwise, return false.
     */
    bool remove(int value);

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

private:
    int size; // The number of nodes in the SkipList.
    Node* head; // The 1st node of the SkipList.

    /* Private utility methods */

    /**
     * @brief Search the index of the node with the given value.
     * @param value The value of the node to be found.
     * @param level The level of the node to be found.
     * @return Return the last node with its value less than the given value.
     * @note The next node of the returned node has equal value, greater value or is nullptr.
     */
    Node* searchIndex(int value, int level = 0);

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
    void insertNode(Node* node, int level);

    /**
     * @brief Remove the node at given level.
     * @param node The node to be removed.
     * @param level The level of the node to be removed.
     * @return The node previously next to the removed node.
     */
    Node* removeNode(Node* node, int level);

};

#endif  // _SKIPLIST_H