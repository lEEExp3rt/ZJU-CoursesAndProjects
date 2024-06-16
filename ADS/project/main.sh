#!/usr/bin/fish
# This is the main script for running the SkipList tests.

make clean
make all
./SkipList_Test1 > out/SkipList_Test1_output.log
./SkipList_Test2 > out/SkipList_Test2_output.csv
cd src/
python3 plot.py ../out/SkipList_Test2_output.csv ../out/SkipList_Test2_output_insertions.png ../out/SkipList_Test2_output_searchings.png ../out/SkipList_Test2_output_deletions.png