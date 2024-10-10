#include "numberdisplay.h"
#include "clock.h"
#include <iostream>
#include <fstream>
#include <iosfwd>

#define JUDGE(result, stanard, score, message, out) \
    {\
        if ((result) == (stanard)) { \
            (score) +=1; \
            (out) << (message) << ": PASS" << std::endl; \
        } else { \
            (out) << (message) << ": FAIL, should be " << (stanard) << ",but " << (result) << std::endl; \
        }\
    }

int main(int argc, char const *argv[]) {
    if ( argc != 2 ) {
        exit(-1);
    }
    int score = 0;
    bool p;
    std::ofstream file(argv[1], std::ios::trunc);
    NumberDisplay nd(10);
    JUDGE(nd.getValue(), 0, score, "NumberDisplay: init value 0", file);
    nd.setValue(9);
    JUDGE(nd.getValue(), 9, score, "NumberDisplay: set value 9", file);
    p = nd.dida();
    JUDGE(p, 1, score, "NumberDisplay: dida turn over", file);
    JUDGE(nd.getValue(), 0, score, "NumberDisplay: dida turn over value", file);
    NumberDisplay nd2(20);
    nd2.setValue(9);
    JUDGE(nd2.getValue(), 9, score, "NumberDisplay: 2nd obj set value 9", file);
    p = nd2.dida();
    JUDGE(p, 0, score, "NumberDisplay: 2nd obj dida not turn over", file);
    JUDGE(nd2.getValue(), 10, score, "NumberDisplay: 2nd obj dida not turn over value", file);
    JUDGE(nd.getValue(), 0, score, "NumberDisplay: 1st obj is stll 0", file);
    JUDGE(nd.toString(), "00", score, "NumberDisplay: 1st obj toString", file); 
    JUDGE(nd2.toString(), "10", score, "NumberDisplay: 2nd obj toString", file);
    
    Clock c(0,1,2);
    JUDGE(c.toString(), "00:01:02", score, "Clock: init time 00:01:02", file);
    c.dida();
    JUDGE(c.toString(), "00:01:03", score, "Clock: dida not turn over time", file); 
    Clock c0(0,0,59);
    c0.dida();
    JUDGE(c0.toString(), "00:01:00", score, "Clock: dida turn over time 1", file);
    Clock c1(0,59,59);
    c1.dida();
    JUDGE(c1.toString(), "01:00:00", score, "Clock: dida turn over time 2", file);
    Clock c2(23,59,59);
    c2.dida();
    JUDGE(c2.toString(), "00:00:00", score, "Clock: dida turn over a day", file);

    file << std::endl << score << std::endl;
    file.close();
    return 0;
}