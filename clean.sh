#!/bin/bash
[ -f Makefile ] || _premake/premake5 gmake
rm -rf _bin/* _bin_obj/*