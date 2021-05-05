workspace "${Project_Name_Exe}"

	configurations { "Debug", "Release" }
	architecture "x64"

	outputpath = "%{cfg.system}/%{cfg.architecture}/%{cfg.buildcfg}/"

	targetdir ("_bin/%{prj.name}/" .. outputpath)
	objdir ("_bin_obj/%{prj.name}/" .. outputpath)

	project "${Project_Name_Exe}"
		location "${Project_Path_Exe}"
		kind "ConsoleApp"
		language "C"
		
		files { "${Project_Path_Exe}/**.c" }
		includedirs { "_vendor", "${Project_Path_Exe}" }

		includedirs { "${Project_Path_Lib}" }
		links { "${Project_Name_Lib}" }

	include "${Project_Path_Lib}"