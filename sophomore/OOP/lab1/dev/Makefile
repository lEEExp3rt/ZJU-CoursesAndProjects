CC = g++
CFLAG = -std=c++11
OBJ = personal_dairy.o
ADDOBJ = pdadd.o
LISTOBJ = pdlist.o
SHOWOBJ = pdshow.o
REMOVEOBJ = pdremove.o

all: pdadd pdlist pdshow pdremove

pdadd: $(ADDOBJ) $(OBJ)
	$(CC) $(CFLAG) -o pdadd $(ADDOBJ) $(OBJ)

pdlist: $(LISTOBJ) $(OBJ)
	$(CC) $(CFLAG) -o pdlist $(LISTOBJ) $(OBJ)

pdshow: $(SHOWOBJ) $(OBJ)
	$(CC) $(CFLAG) -o pdshow $(SHOWOBJ) $(OBJ)	

pdremove: $(REMOVEOBJ) $(OBJ)
	$(CC) $(CFLAG) -o pdremove $(REMOVEOBJ) $(OBJ)

.cpp.o:
	$(CC) $(CFLAG) -c $< -o $@

clean:
	rm -f $(OBJ) $(ADDOBJ) $(LISTOBJ) $(SHOWOBJ) $(REMOVEOBJ) pdadd pdlist pdshow pdremove
