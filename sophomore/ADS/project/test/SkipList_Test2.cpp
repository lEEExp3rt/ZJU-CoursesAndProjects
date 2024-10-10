/**
 * @test SkipList_Test2.cpp
 * @author lqy
 * @brief Performance test for SkipList implementation.
 * @version 2.0
 * @date 2024-06-15
 * @copyright Copyright (c) 2024, !EEExp3rt. All rights reserved.
 */

#include "../src/SkipList.hpp"
#include <iostream>
#include <chrono>
#include <random>

void test(int num)
{
    SkipList<int> sl;
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dis(1, num);
    // Insertion.
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < num; i++) {
        sl.insert(dis(gen));
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto duration1 = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
    // Search.
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < num; i++)
    {
        sl.find(dis(gen));
    }
    end = std::chrono::high_resolution_clock::now();
    auto duration2 = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
    // Deletion.
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < num; i++)
    {
        sl.remove(dis(gen));
    }
    end = std::chrono::high_resolution_clock::now();
    auto duration3 = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
    // Print results.
    std::cout << num << "," << duration1 << "," << duration2 << "," << duration3 << std::endl;
    sl.clear();
}

int main()
{
    int num = 100000;
    int point = 20;
    std::cout << "size,insertion_time,search_time,deletion_time" << std::endl;
    for (int i = 0; i < point; i++) {
        test(num);
        num += 50000;
    }
    return 0;
}