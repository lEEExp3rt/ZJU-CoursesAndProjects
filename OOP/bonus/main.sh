#! /bin/bash
javac src/*.java
cd src
java Main < ../conf/input_1.txt
rm *.class