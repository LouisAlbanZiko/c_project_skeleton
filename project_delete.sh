#!/bin/bash
project_name=$1
if [[ -z "$project_name" ]]; then
	echo "Parameters empty."
elif [ ! -d "$project_name" ]; then
	echo "Project doesn't exist."
else
	read -p "Are you sure you want to delete ${project_name}? [Y/n] " yn
	if [[ "$yn" == "y" || "$yn" == "Y" ]]; then
		rm -rf $project_name
		# find project in list and remove
		sed -i "/include \"${project_name}\"/d" project_list.lua
	fi
fi