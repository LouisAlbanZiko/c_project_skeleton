#!/bin/bash
project_name=$1
project_type=$2
if [[ -z "$project_name" || -z "$project_type" ]]; then
	echo "Parameters empty."
elif [ -d "$project_name" ]; then
	echo "Project already exists."
elif [[ "$project_type" != "StaticLib" && "$project_type" != "ConsoleApp" ]]; then
	echo "Unrecognized project type '$project_type'."
else
	mkdir -p $project_name
	cp _Skeleton_${project_type}/* ${project_name}/
	mv ${project_name}/_.gitignore ${project_name}/.gitignore
	
	if [[ "${project_type}" == "StaticLib" ]]; then
		mv ${project_name}/lib.c ${project_name}/${project_name}.c
		mv ${project_name}/lib.h ${project_name}/${project_name}.h
	fi

	replace_variables_in_files()
	{
		for file in $1/*; do
			if [ -f $file ]; then
				sed -i "s/\${project_type}/${project_type}/g" $file
				sed -i "s/\${project_name}/${project_name}/g" $file
			elif [ -d $file ]; then
				replace_variables_in_files $file
			fi
		done
	}

	replace_variables_in_files $project_name

	echo -e "include \"${project_name}\"\n" >> project_list.lua

fi
