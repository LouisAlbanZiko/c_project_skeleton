workspace "C"

	configurations { "Debug", "Release" }
	architecture "x64"

	outputpath = "%{cfg.system}/%{cfg.architecture}/%{cfg.buildcfg}/"

	targetdir ("_bin/%{prj.name}/" .. outputpath)
	objdir ("_bin_obj/%{prj.name}/" .. outputpath)

	include "project_list.lua"