CC = g++
CFLAG = -std=c++11
SRC = .
OD = ..
OBJ = $(SRC)/personal_dairy.o	#	object files of all common files
ADDOBJ = $(SRC)/pdadd.o			#	object file for pdadd
LISTOBJ = $(SRC)/pdlist.o		#	object file for pdlist
REMOVEOBJ = $(SRC)/pdremove.o	#	object file for pdremove
SHOWOBJ = $(SRC)/pdshow.o		#	object file for pdshow

all: $(OD)/pdadd $(OD)/pdlist $(OD)/pdremove $(OD)/pdshow

$(OD)/pdadd: $(ADDOBJ) $(OBJ)
	$(CC) $(CFLAG) -o $(OD)/pdadd $(ADDOBJ) $(OBJ)

$(OD)/pdlist: $(LISTOBJ) $(OBJ)
	$(CC) $(CFLAG) -o $(OD)/pdlist $(LISTOBJ) $(OBJ)

$(OD)/pdremove: $(REMOVEOBJ) $(OBJ)
	$(CC) $(CFLAG) -o $(OD)/pdremove $(REMOVEOBJ) $(OBJ)

$(OD)/pdshow: $(SHOWOBJ) $(OBJ)
	$(CC) $(CFLAG) -o $(OD)/pdshow $(SHOWOBJ) $(OBJ)	

.cpp.o:
	$(CC) $(CFLAG) -c $< -o $@

clean:
	rm -f $(OBJ) $(ADDOBJ) $(LISTOBJ) $(REMOVEOBJ) $(SHOWOBJ) $(OD)/pdadd $(OD)/pdlist $(OD)/pdremove $(OD)/pdshow
