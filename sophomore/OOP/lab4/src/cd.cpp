#include <iostream>
#include <string>
#include "collection.h"
#include "cd.h"

using namespace std;

CD::CD(): Collection(), tracks(0) {}

CD::CD(string artist, int tracks, int time, bool got, string comment): Collection(artist, time, got, comment), tracks(tracks) {}

void CD::parse(string input)
{
    int pos = input.find(",", 0);
    string name = input.substr(0, pos);
    input = input.substr(pos + 1);
    pos = input.find(",", 0);
    tracks = stoi(input.substr(0, pos));
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

void CD::print(void) const
{
    cout << "----------------------------------------" << endl;
    cout << "Artist: " << name << endl;
    cout << "Number of tracks: " << tracks << endl;
    cout << "Playing time: " << time << " minutes" << endl;
    cout << "Got it: " << (gotIt ? "yes" : "no") << endl;
    cout << "Comment: " << comment << endl;
    cout << "----------------------------------------" << endl;
    return ;
}