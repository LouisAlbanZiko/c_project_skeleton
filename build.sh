#!/bin/bash
_premake/premake5 gmake
[ -f Makefile ] || _premake/premake5 gmake
if [[ $1 == "all" ]]; then
	_premake/premake5 gmake
	make all
elif [ ! -z $1 ]; then
	if [ -d $1 ] && [[ ! $1 == _* ]]; then
		make $1
	else
		"Argument passed is not a project."
	fi
else
	echo "No arguments passed".
fi