/**
 * @test SkipList_Test1.cpp
 * @author lqy
 * @brief Validation test for SkipList implementation.
 * @version 2.0
 * @date 2024-06-15
 * @copyright Copyright (c) 2024, !EEExp3rt. All rights reserved.
 */

#include "../src/SkipList.hpp"
#include <iostream>
#include <map>
#include <random>

#define TEST_MESSAGE(i, msg) std::cout << "---------- TEST " << i << ": " << msg << " ----------" << std::endl

int main()
{
    /* Tset0: Initialization */
    TEST_MESSAGE(0, "Initialization");
    bool isCorrect0 = true;
    SkipList<int> sl;
    sl.print(); // Check if the list is empty.
    // Check if the list is empty.
    if (sl.getSize() != 0 || sl.getHead() != nullptr) isCorrect0 = false;
    std::cout << std::endl << "[INFO] Initialization validation: " << (isCorrect0 ? "PASS" : "FAIL") << std::endl;

    /* Tset1: Insertion */
    TEST_MESSAGE(1, "Insertion");
    int num = 50; // Number of random numbers to generate.
    std::map<int, int> nums; // Map for checking if the list is correct.
    // Generate random numbers for insertion.
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dis(0, num);
    for (int i = 0; i < num; i++) {
        int key = dis(gen);
        sl.insert(key);
        nums[key]++;
    }
    std::cout << "Generated " << num << " random numbers." << std::endl;
    std::cout << "Current size: " << sl.getSize() << std::endl;
    sl.print(); // Check if the list is correct.
    // Check the inserted elements.
    std::cout << "Expected elements:" << std::endl << "Level [0]: ";
    for (auto it: nums) {
        for (int i = 0; i < it.second; i++) {
            std::cout << it.first << " -> ";
        }
    }
    std::cout << std::endl;
    bool isCorrect1 = true;
    // Check if the list is correct.
    std::map<int, int> list = nums;
    Node<int> *head1 = sl.getHead();
    while (head1 != nullptr) {
        list[head1->getValue()]--;
        if (list[head1->getValue()] == 0) list.erase(head1->getValue());
        head1 = head1->getNext();
    }
    if (list.size() > 0) isCorrect1 = false;
    std::cout << std::endl << "[INFO] Insert validation: " << (isCorrect1 ? "PASS" : "FAIL") << std::endl;

    /* Tset2: Finding */
    TEST_MESSAGE(2, "Finding");
    int findNum = 20;
    // Generate random numbers for finding.
    bool isCorrect2 = true;
    for (int i = 0; i < findNum; i++) {
        int key = dis(gen);
        bool isFound = sl.find(key);
        if (isFound) {
            std::cout << "Find key " << key << std::endl;
        } else {
            std::cout << "Cannot find key " << key << std::endl;
        }
        if (isFound ^ (nums.count(key) > 0)) isCorrect2 = false;
    }
    std::cout << std::endl << "[INFO] Find validation: " << (isCorrect2 ? "PASS" : "FAIL") << std::endl;

    /* Tset3: Deletion */
    TEST_MESSAGE(3, "Deletion");
    int deleteNum = 20;
    bool isCorrect3 = true;
    // Generate random numbers for deletion.
    for (int i = 0; i < deleteNum; i++) {
        int key = dis(gen);
        bool isDeleted = sl.remove(key);
        if (isDeleted) {
            std::cout << "Remove key " << key << std::endl;
            if (nums.count(key) > 0) {
                nums[key]--;
                if (nums[key] == 0) nums.erase(key);
            } else {
                isCorrect3 = false;
            }
        } else {
            std::cout << "Cannot find key " << key << std::endl;
            if (nums.count(key) > 0) isCorrect3 = false;
        }
    }
    std::cout << "Current size: " << sl.getSize() << std::endl;
    sl.print(); // Check if the list is correct.
    // Check the remaining elements.
    Node<int> *head2 = sl.getHead();
    while (head2 != nullptr) {
        nums[head2->getValue()]--;
        if (nums[head2->getValue()] == 0) nums.erase(head2->getValue());
        head2 = head2->getNext();
    }
    if (nums.size() > 0) isCorrect3 = false;
    std::cout << std::endl << "[INFO] Delete validation: " << (isCorrect3 ? "PASS" : "FAIL") << std::endl;

    /* Tset4: Clear */
    TEST_MESSAGE(4, "Clear");
    bool isCorrect4 = true;
    sl.clear();
    std::cout << "Current size: " << sl.getSize() << std::endl;
    sl.print(); // Check if the list is empty.
    if (sl.getSize() != 0 || sl.getHead() != nullptr) isCorrect4 = false;
    std::cout << std::endl << "[INFO] Clear validation: " << (isCorrect4 ? "PASS" : "FAIL") << std::endl;

    /* SkipList_Test1 result */
    std::cout << std::endl << "---------- SkipList_Test1 result ----------" << std::endl;
    std::cout << "[INFO] SkipList_Test1 result: " << (isCorrect0 && isCorrect1 && isCorrect2 && isCorrect3 && isCorrect4 ? "PASS" : "FAIL") << std::endl;

    return 0;
}