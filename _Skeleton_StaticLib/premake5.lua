project "${project_name}"
	location "."
	kind "${project_type}"
	language "C"
	
	files { "**.c", "**.h" }
	includedirs { "../_vendor", "../", "." }

	filter "system:linux"
		links { "m" }
		buildoptions "-g"
