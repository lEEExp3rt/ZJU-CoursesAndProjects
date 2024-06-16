# This file is used to compile the SkipList_Test1 and SkipList_Test2 files.

CC = g++
CFLAGS = -std=c++11 -g
TEST1 =./test/SkipList_Test1.cpp
TEST2 = ./test/SkipList_Test2.cpp
TARGET1 = SkipList_Test1
TARGET2 = SkipList_Test2
RM = rm -f

all: $(TARGET1) $(TARGET2)

$(TARGET1): $(TEST1)
	$(CC) $(CFLAGS) $^ -o $@

$(TARGET2): $(TEST2)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	$(RM) $(TARGET1) $(TARGET2) out/*