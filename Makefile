CXX := mpic++
CXXFLAGS := -std=c++17 -Wall -Wextra -Wpedantic -fopenmp
LDLIBS := -lcrypt
TARGET := build/password-cracker
SOURCE := src/main.cpp

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SOURCE)
	mkdir -p build
	$(CXX) $(CXXFLAGS) $(SOURCE) $(LDLIBS) -o $(TARGET)

clean:
	rm -rf build
