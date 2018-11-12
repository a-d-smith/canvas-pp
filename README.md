# canvas-pp
canvas++ is a dependency free library for developing HTML canvas applications in C++

[![Build Status](https://travis-ci.org/a-d-smith/canvas-pp.svg?branch=master)](https://travis-ci.org/a-d-smith/canvas-pp)

## Getting started

### Compiling the library

```
# First you will need to get a copy of this code
git clone https://github.com/a-d-smith/canvas-pp.git

# Compile the library
cd canvas-pp
export CANVASPP_DIR=`pwd`

make -j4

# You can now find the shared object library at: $CANVASPP_DIR/libcanvaspp.so
# You now need to compile your project against this canvas++ library!
```

### Running the examples

canvas++ comes with a suite of examples under the directory [example/](example/). If you want to run these examples then please follow the
instructions below.

```
# Compile the examples
cd $CANVASPP_DIR/example/

export CANVASPP_EXAMPLE_DIR=`pwd`
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CANVASPP_DIR

make -j4

# You can now find the example binaries under: $CANVASPP_EXAMPLE_DIR/bin/
# Run one (for example "test") using
$CANVASPP_EXAMPLE_DIR/bin/test
```
