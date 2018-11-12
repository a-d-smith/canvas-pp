#
# Makefile for canvas++ example
#
# usage: make       - to compile the canvas++ example executable
#        make clean - to remove all compiled objects

# Make sure the canvas++ directory has been set in the environment
ifndef CANVASPP_DIR
$(error Environment variable CANVASPP_DIR is not set)
endif

# Make sure the canvas++ example directory has been set in the environment
ifndef CANVASPP_EXAMPLE_DIR
$(error Environment variable CANVASPP_EXAMPLE_DIR is not set)
endif

# Compiler options
CC = g++
CFLAGS = -c -g -fPIC -O2 -Wall -Wextra -Werror -pedantic -Wno-long-long -Wshadow -fno-strict-aliasing -std=c++11

# Set up the reqired directories
SOURCE_DIR=$(CANVASPP_EXAMPLE_DIR)/src/
BINARY_DIR=$(CANVASPP_EXAMPLE_DIR)/bin/

# Set up the sources and objects
INCLUDES = -I$(CANVASPP_DIR)/inc/
SOURCES = $(wildcard $(SOURCE_DIR)/*.cxx)
OBJECTS = $(SOURCES:.cxx=.o)
DEPENDS = $(OBJECTS:.o=.d)
LIBS = -L$(CANVASPP_DIR) -lcanvaspp

# make test
test: $(OBJECTS)
	@mkdir -p $(BINARY_DIR)
	$(CC) $< $(LIBS) -o $(BINARY_DIR)/test

# make clean
.PHONY: clean
clean:
	@rm -f $(OBJECTS)
	@rm -f $(DEPENDS)
	@rm -rf $(BINARY_DIR)

-include: $(DEPENDS)

%.o: %.cxx
	$(CC) $(CFLAGS) $(INCLUDES) $(DEFINES) -MP -MMD -MT $*.o -MT $*.d -MF $*.d -o $*.o $*.cxx
