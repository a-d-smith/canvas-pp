#
# Makefile for canvas++
#
# usage: make       - to compile the canvas++ library
#        make clean - to remove all compiled objects


# Make sure the canvas++ directory has been set in the environment
ifndef CANVASPP_DIR
$(error Environment variable CANVASPP_DIR is not set)
endif

# Compiler options
CC = g++
CFLAGS = -c -g -fPIC -O2 -Wall -Wextra -Werror -pedantic -Wno-long-long -Wshadow -fno-strict-aliasing -std=c++11

# Set up the reqired directories
INCLUDE_DIR=$(CANVASPP_DIR)/inc/
SOURCE_DIR=$(CANVASPP_DIR)/src/

# Set up the sources and objects
INCLUDES  = -I$(INCLUDE_DIR)
SOURCES = $(wildcard $(SOURCE_DIR)/*.cc)

OBJECTS = $(SOURCES:.cc=.o)
DEPENDS = $(OBJECTS:.o=.d)
LIBRARY = $(CANVASPP_DIR)/libcanvaspp.so

# make all
all: $(LIBRARY)

# make clean
.PHONY: clean
clean:
	@rm -f $(OBJECTS)
	@rm -f $(DEPENDS)
	@rm -f $(LIBRARY)

$(LIBRARY): $(OBJECTS)
	$(CC) -shared -o $(LIBRARY) $(OBJECTS)

-include: $(DEPENDS)

%.o: %.cc
	$(CC) $(CFLAGS) $(INCLUDES) $(DEFINES) -MP -MMD -MT $*.o -MT $*.d -MF $*.d -o $*.o $*.cc

