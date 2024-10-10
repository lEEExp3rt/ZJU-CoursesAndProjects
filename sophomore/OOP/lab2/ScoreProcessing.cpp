#include <iostream>
#include <iomanip>
#include <string>
#include <map>
#include <vector>
using namespace std;

int main()
{
    map<string, string> student; // student[id] = name.
    map<string, map<string, double>> scores; // scores[id] = <course1, score1>, <cocurse2, score2> ...
    map<string, vector<double>> courses; // courses[course_name] = <score1, score2, ...>
    string tmp;
    // Input.
    while (1) {
        getline(cin, tmp);
        if (tmp == "")
            break;
        string id = tmp.substr(0, 10);
        int comma_pos = tmp.find(",", 11);
        // ID, NAME.
        if (comma_pos == -1)
            student[id] = tmp.substr(12);
        // ID, courses.
        else {
            string course_name = tmp.substr(12, comma_pos - 12);
            double score = stof(tmp.substr(comma_pos + 2));
            scores[id][course_name] = score;
            courses[course_name].push_back(score);
        } 
    }
    // Output.
    cout << "student id, name";
    for (const auto& header : courses)
        cout << ", " << header.first;
    cout << fixed << setprecision(1)<< ", average" << endl;
    for (const auto& stu : student) {
        cout << stu.first << ", " << stu.second;
        map<string, double> s = scores[stu.first];
        double total_score = 0;
        for (const auto& header : courses) {
            cout << ", ";
            if (s.count(header.first)) {
                cout << s[header.first];
                total_score += s[header.first];
            }
        }
        cout << ", " << total_score / s.size() << endl;
    }
    cout << ", ";
    double average = 0;
    for (const auto& avg : courses) {
        double sum = 0;
        for (double each_score : avg.second)
            sum += each_score;
        average += sum / avg.second.size();
        cout << ", " << sum / avg.second.size();
    }
    cout << ", " << average / courses.size() << endl;
    return 0;
}
