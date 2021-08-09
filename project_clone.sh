#!/bin/bash
project_name=$1
project_link=$2
if [[ -z "$project_name" || -z "$project_link" ]]; then
	echo "Parameters empty."
elif [ -d "$project_name" ]; then
	echo "Project already exists."
else
	git clone $project_link $project_name
	echo -e "include \"${project_name}\"" >> project_list.lua
fi