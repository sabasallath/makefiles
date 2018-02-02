CXX=g++
CPPFLAGS=-std=c++11 -W -Wall -Werror -Wextra -g
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
	$(CXX) -o $@ $(filter-out $(filter-out $@.o, $(BRO)), $(OBJ)) $(LDFLAGS)
	
%.o: %.c
	$(CXX) $(CFLAGS) -o $@ -c $< 
	$(CXX) -MM $*.cpp > $*.d

clean:
	@rm -rf *.o *.d
	@rm -rf $(BIN)

-include $(SRC:.cpp=.d)
