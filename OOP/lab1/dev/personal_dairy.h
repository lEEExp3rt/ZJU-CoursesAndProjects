#ifndef _personal_dairy_h
#define _personal_dairy_h

/* Header Files Included Here */
#include <iostream>
#include <fstream>
#include <string>
#include <map>

/* Functions Prototypes Here */
int DateNum(std::string str);
void WriteFile(std::string content);
void pdadd(std::string date, std::string content);
void pdlist(void);
void pdshow(std::string date);
int pdremove(std::string date);

#endif