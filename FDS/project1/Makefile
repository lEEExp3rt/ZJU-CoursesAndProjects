# Makefile for ZJU_FDS_2023 project1

CC=gcc
OBJ=timetest.o power.o
RM=rm
TARGET=timetest.exe
CXXFLAGS=-c -W

${TARGET}:${OBJ}
	${CC} -o $@ $^
%.o:%.c
	${CC} ${CXXFLAGS} $^ 
.PHONY:clean
clean:
	${RM} *.o
