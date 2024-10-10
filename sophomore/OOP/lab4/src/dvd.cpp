#include <iostream>
#include <string>
#include "collection.h"
#include "dvd.h"

using namespace std;

DVD::DVD(): Collection(), title("") {}

DVD::DVD(string director, string dvdTitle, int time, bool got, string comment): Collection(director, time, got, comment), title(dvdTitle) {}

void DVD::parse(string input)
{
    int pos = input.find(",", 0);
    string name = input.substr(0, pos);
    input = input.substr(pos + 1);
    pos = input.find(",", 0);
    title = input.substr(0, pos);
    input = input.substr(pos + 1);
    pos = input.find(",", 0);
    int time = stoi(input.substr(0, pos));
    input = input.substr(pos + 1);
    pos = input.find(",", 0);
    bool got = ((input.substr(0, pos)) == "1"? true : false);
    input = input.substr(pos + 1);
    string comment = input;
    Collection::parse(name, time, got, comment);
    return ;
}

void DVD::print(void) const
{
    cout << "----------------------------------------" << endl;
    cout << "Director: " << name << endl;
    cout << "Title: " << title << endl;
    cout << "Playing time: " << time << " minutes" << endl;
    cout << "Got it: " << (gotIt ? "yes" : "no") << endl;
    cout << "Comment: " << comment << endl;
    cout << "----------------------------------------" << endl;
    return ;
}