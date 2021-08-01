project "${project_name}"
	location "."
	kind "${project_type}"
	language "C"
	
	files { "**.c" }
	includedirs { "../_vendor", "../", "." }