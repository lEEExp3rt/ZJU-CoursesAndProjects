#include "database.h"
#include "cd.h"
#include "dvd.h"

#include <iostream>
using namespace std;

int main()
{
    Database db;
    CD cd1("The Beatles", 7, 50, true, "Great album");
    CD cd2("The Beatles", 6, 60, false, "Boring album");
    DVD dvd1("James Cameron", "Avatar", 120, true, "Great movie");
    DVD dvd2("Christopher Nolan", "Inception", 90, false, "Boring movie");
    db.add(&cd1);
    db.add(&cd2);
    db.add(&dvd1);
    db.add(&dvd2);

    while (true) {
        string type;
        cin >> type;
        if (type == "END") {
            break;
        }
        string line;
        getline(cin, line);
        if (type == "CD:") {
            CD *cd = new CD();
            cd->parse(line);
            db.add(cd);
        }
        else if (type == "DVD:") {
            DVD *dvd = new DVD();
            dvd->parse(line);
            db.add(dvd);
        }
    }

    db.list();
    return 0;
}