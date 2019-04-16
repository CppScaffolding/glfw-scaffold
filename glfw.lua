-- scaffold geniefile for glfw

glfw_script = path.getabsolute(path.getdirectory(_SCRIPT))
glfw_root = path.join(glfw_script, "glfw")

glfw_includedirs = {
	path.join(glfw_script, "config"),
	glfw_root,
}

glfw_libdirs = {}
glfw_links = {}
glfw_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { glfw_includedirs }
	end,

	_add_defines = function()
		defines { glfw_defines }
	end,

	_add_libdirs = function()
		libdirs { glfw_libdirs }
	end,

	_add_external_links = function()
		links { glfw_links }
	end,

	_add_self_links = function()
		links { "glfw" }
	end,

	_create_projects = function()

project "glfw"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		glfw_includedirs,
	}

	defines {}

	files {
		path.join(glfw_script, "config", "**.h"),
		path.join(glfw_root, "**.h"),
		path.join(glfw_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
