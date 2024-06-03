#include <iostream>
#include <string>
#include "personal_dairy.h"
using namespace std;

int main(int argc, char* argv[])
{
    string content;
    getline(cin, content);
    pdadd(argv[1], content);
    return 0;
}