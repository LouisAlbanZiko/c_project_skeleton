#!/bin/bash
[ -f Makefile ] || _premake/premake5 gmake
make clean