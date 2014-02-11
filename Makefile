export CC  = gcc
export CXX = g++
export CFLAGS = -Wall -O3 -msse2 -Wno-unknown-pragmas

# specify tensor path
BIN = test
OBJ =
.PHONY: clean all

all: $(BIN) $(OBJ)
export LDFLAGS= -pthread -lm 
test: testcompile.cpp tensor/*.h

$(BIN) :
	$(CXX) $(CFLAGS) $(LDFLAGS) -o $@ $(filter %.cpp %.o %.c, $^)

$(OBJ) :
	$(CXX) -c $(CFLAGS) -o $@ $(firstword $(filter %.cpp %.c, $^) )

install:
	cp -f -r $(BIN)  $(INSTALL_PATH)

clean:
	$(RM) $(OBJ) $(BIN) *~
