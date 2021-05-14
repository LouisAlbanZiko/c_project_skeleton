#!/bin/bash
Project_Name="$1"
Project_Kind="$2"
if [[ -z "$Project_Name" || -z "$Project_Kind" ]]; then
	echo "Parameters empty."
elif [ -d "$Project_Name" ]; then
	echo "Project already exists."
elif [[ "$Project_Kind" != "StaticLib" && "$Project_Kind" != "ConsoleApp" ]]; then
	echo "Unrecognized project type '$Project_Kind'."
else
	mkdir "$Project_Name"
	mkdir -p "${Project_Name}/_bin"
	mkdir -p "${Project_Name}/_bin_obj"
	mkdir -p "${Project_Name}/_vendor"
	mkdir -p "${Project_Name}/src"
	
	cp _Skeleton/build.sh $Project_Name/build.sh
	cp _Skeleton/test.sh $Project_Name/test.sh
	cp _Skeleton/.gitignore $Project_Name/.gitignore

	if [[ $Project_Kind == "StaticLib" ]]; then
		Project_Name_Exe=Sandbox
		Project_Path_Exe=$Project_Name_Exe
		Project_Name_Lib=$Project_Name
		Project_Path_Lib=src

		mkdir -p "${Project_Name}/${Project_Name_Exe}"

		cp _Skeleton/src/lib.c $Project_Name/src/lib.c
		cp _Skeleton/src/lib.h $Project_Name/src/lib.h
		cp _Skeleton/Sandbox/main.c $Project_Name/Sandbox/main.c
		cp _Skeleton/premake5.lua $Project_Name/premake5.lua
		cp _Skeleton/src/premake5.lua $Project_Name/src/premake5.lua
	
	elif [[ $Project_Kind == "ConsoleApp" ]]; then
		Project_Name_Exe=$Project_Name
		Project_Path_Exe=src

		cp _Skeleton/src/main.c $Project_Name/src/main.c
		head _Skeleton/premake5.lua -n 17 > $Project_Name/premake5.lua

	fi

	
	replace_variables_in_files()
	{
		for file in $Project_Name/*; do
			if [ -f $file ]; then
				sed -i "s/\${Project_Kind}/$Project_Kind/g" $file
				sed -i "s/\${Project_Name_Exe}/$Project_Name_Exe/g" $file
				sed -i "s/\${Project_Path_Exe}/$Project_Path_Exe/g" $file
				if [ $Project_Kind == "StaticLib" ]; then
					sed -i "s/\${Project_Name_Lib}/$Project_Name_Lib/g" $file
					sed -i "s/\${Project_Path_Lib}/$Project_Path_Lib/g" $file
				fi
			elif [ -d $file ]; then
				replace_variables_in_files $file
			fi
		done
	}

	replace_variables_in_files $Project_Name
	
	for script in $Project_Name/*.sh; do
		echo "chmod +x $script"
		chmod +x $script
	done
	
	cd $Project_Name
	git init
fi
