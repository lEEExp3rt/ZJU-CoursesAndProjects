CC = g++
AR = ar
SRC = src
OD = 
CFLAG = -std=c++11 -I$(SRC)
LIBS = clock.a
OBJS = main.o
MAKE = make

all: $(LIBS) $(OBJS)
	$(CC) $(CFLAG) -o test $(OBJS) $(LIBS)

$(LIBS):
	cd $(SRC) && $(MAKE)

.cpp.o:
	$(CC) $(CFLAG) -c $< -o $@

clean:
	cd $(SRC) && $(MAKE) clean
	rm -f $(OBJS)
	rm -f test
