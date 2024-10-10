CC = g++
CFLAGS = -std=c++11 -I.
SRC = .
OD = ..
OUT = $(OD)/out
RM = rm -f
OBJS = $(SRC)/main.o $(SRC)/ADIF.o $(SRC)/Record.o $(SRC)/CLI.o
TARGET = $(OD)/ADIF

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ -g

.cpp.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(TARGET) $(OBJS) $(OUT)/*