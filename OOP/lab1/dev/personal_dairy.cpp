#include <iostream>
#include <string>
#include <fstream>
#include <map>
#include "personal_dairy.h"
#define FILENAME "personal_dairy.txt"

using namespace std;

int DateNum(string str)
{
    return stoi(str.substr(0, 4) + str.substr(5, 2) + str.substr(8, 2));
}

void WriteFile(string content)
{
    fstream outfile;
    outfile.open(FILENAME, ios::out | ios::trunc);
    outfile.write(content.c_str(), content.size());
    outfile.close();
    return ;
}

void pdadd(string date, string adder)
{
    fstream file;
    string tmp;
    map<int, string> content;
    int isExisted = 0;
    file.open(FILENAME, ios::in);
    while (!file.eof()) {
        getline(file, tmp);
        if (tmp == "")
            continue;
        if (tmp.substr(0, 10) != date)
            content[DateNum(tmp)] = tmp;
        else {
            content[DateNum(tmp)] = date + ":" + adder;
            isExisted = 1;
        }
    }
    if (!isExisted)
        content[DateNum(date)] = date + ":" + adder;
    file.close();
    /* Write */
    string writer;
    for (const auto& pair : content)
        writer += pair.second + '\n';
    writer = writer.substr(0, writer.size() - 1);
    WriteFile(writer);
    return ;
}

void pdlist(void)
{
    fstream file;
    string tmp;
    map<int, string> content;
    file.open(FILENAME, ios::in);
    while (!file.eof()) {
        getline(file, tmp);
        if (tmp == "")
            continue;
        content[DateNum(tmp)] = tmp;
    }
    file.close();
    for (const auto& pair : content)
        cout << pair.second << endl;
    return ;
}

void pdshow(string date)
{
    fstream file;
    string content;
    file.open(FILENAME, ios::in);
    while (!file.eof()) {
        getline(file, content);
        if (content.substr(0, 10) == date) {
            cout << content << endl;
            file.close();
            return ;
        }
    }
    cout << date << ":No entry found for the given date" << endl;
    file.close();
    return ;
}

int pdremove(string date)
{
    int isDuplicated = 0;
    fstream infile;
    string content, tmp;
    infile.open(FILENAME, ios::in);
    while (!infile.eof()) {
        getline(infile, tmp);
        if (tmp.substr(0, 10) != date)
            content += tmp + '\n'; 
        else
            isDuplicated = 1;
    }
    infile.close();
    content = content.substr(0, content.size() - 1);
    if (isDuplicated) {
        WriteFile(content);
        return 0;
    }
    else
        return -1;
}