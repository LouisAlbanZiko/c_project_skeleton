#!/bin/bash
_premake/premake5 gmake
if [[ $1 == "all" ]]; then
	make clean
	make all
elif [ ! -z $1 ]; then
	if [ -d $1 ] && [[ ! $1 == _* ]]; then
		make clean
		make $1
	else
		"Argument passed is not a project."
	fi
else
	echo "No arguments passed".
fi
