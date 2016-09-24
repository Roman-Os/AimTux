CC = c++
CXXFLAGS = -fPIC -std=c++14 -g -shared -ldl

SOURCES := ./src/AimTux.cpp ./src/draw.cpp ./src/hooker.cpp ./src/NetVarManager.cpp ./src/Offsets.cpp
OBJECTS := ./src/AimTux.o ./src/draw.o ./src/hooker.o ./src/NetVarManager.o ./src/Offsets.o
OUT := aimtux-csgo.so

all: clean build

clean:
	rm -vf $(OBJECTS) $(OUT)

%.cpp: ../%.cpp
	$(CC) $(CFLAGS) $(CFLAGS) -o "$@" "$<" -ldl

%.o: ../%.cpp
	$(CC) $(CFLAGS) $(CFLAGS) -o "$@" "$<" -ldl

build: $(OBJECTS)
	$(CC) $(CXXFLAGS) -o $(OUT) $(OBJECTS) -ldl
	rm  ./src/*.o
