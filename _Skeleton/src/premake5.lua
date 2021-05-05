project "${Project_Name_Lib}"
	location "."
	kind "${Project_Kind}"
	language "C"
	
	files { "**.c" }
	includedirs { "_vendor", "." }