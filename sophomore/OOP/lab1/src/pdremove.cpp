#include <iostream>
#include <string>
#include "personal_dairy.h"
using namespace std;

int main(int argc, char* argv[])
{
    int flag = pdremove(argv[1]);
    if (flag == -1)
        cout << "Entry not found at " << argv[1] << endl;
    return flag;
}
