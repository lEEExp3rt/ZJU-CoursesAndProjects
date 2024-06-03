CC = gcc
CFLAGS = -g -w -lcrypto
OBJ = exe
TARGET = main.c
RM = rm

${OBJ}: ${TARGET}
	${CC} $+ -o $@ ${CFLAGS}
.PHONY:clean
clean:
	${RM} ${OBJ}
