CC=gcc
CFLAGS=-W -Wall -Werror -ansi -pedantic -std=c99
LDFLAGS=

SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)
BRC=$(shell grep -il "main" *.c  )
BRO=$(BRC:.c=.o)
BIN=$(BRC:.c=)

all: $(BIN)
	
$(BIN): $(OBJ)
	$(CC) -o $@ $(filter-out $(filter-out $@.o, $(BRO)), $(OBJ)) $(LDFLAGS)
	
%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)
	$(CC) -MM $(CFLAGS) $*.c > $*.d

.PHONY: clean
clean:
	@rm -rf *.o *.d
	@rm -rf $(BIN)

-include $(OBJ:.o=.d)
