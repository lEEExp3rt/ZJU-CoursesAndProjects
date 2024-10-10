CC = g++
CFLAGS = -std=c++11 -I.
SRC = .
OD = ..
RM = rm -rf
OBJS = $(SRC)/main.o $(SRC)/CLI.o $(SRC)/Adventure.o $(SRC)/Room.o
TARGET = $(OD)/AdventureGame

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ -g

.cpp.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJS) $(TARGET)