CC=g++
CFLAGS=-W -Wall -Werror -Wextra
LDFLAGS=

SRC=$(wildcard *.cpp)
OBJ=$(SRC:.cpp=.o)
BRC=$(shell grep -il "main" *.cpp)
BRO=$(BRC:.cpp=.o)
BIN=$(BRC:.cpp=)

.PHONY: all
.PHONY: clean

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) -o $@ $(filter-out $(filter-out $@.o, $(BRO)), $(OBJ)) $(LDFLAGS)
	
%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)
	$(CC) -MM $(CFLAGS) $*.c > $*.d

clean:
	@rm -rf *.o *.d
	@rm -rf $(BIN)

-include $(SRC:.cpp=.d)
