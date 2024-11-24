SRC = $(wildcard *.c)
OBJ = $(patsubst %.c,%.o,$(SRC))

all: $(OBJ)

%.o: %.c
	$(GCC) $(CFLAG) -c $< -o $@

.PHONY: clean
clean:
	rm -f *.o