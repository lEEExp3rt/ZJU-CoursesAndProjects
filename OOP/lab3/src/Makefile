CC = g++
AR = ar
CFLAG = -std=c++11
SRC = .
OD = ..
OBJS = $(SRC)/numberdisplay.o $(SRC)/clock.o	# put your extra object files here

clock.a: $(OBJS)
	$(AR) rcs $(OD)/$@ $^

.cpp.o:
	$(CC) $(CFLAG) -c $< -o $@

clean:
	rm -f $(OBJS) $(OD)/clock.a
