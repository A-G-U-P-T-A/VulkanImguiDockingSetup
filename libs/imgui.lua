project "ImGui"
	kind "StaticLib"
	language "C"
	architecture "x86_64"

	targetdir "../bin/%{cfg.buildcfg}"
	objdir "../bin/obj/%{cfg.buildcfg}"
	links {"$(VULKAN_SDK)/lib/vulkan-1.lib"}
	includedirs { "imgui/", "imgui/examples/", "$(VULKAN_SDK)/include", "glfw/include/", "imgui/backend/" }

	files
	{
		"imgui/*.cpp",
		"imgui/backends/imgui_impl_glfw.cpp",
		"imgui/backends/imgui_impl_vulkan.cpp"
	}

	defines 
	{
		"IMGUI_IMPL_OPENGL_LOADER_VULKAN"
	}
    
	filter "system:linux"
		pic "On"

		systemversion "latest"
		staticruntime "On"

		defines
		{
			"_IMGUI_X11"
		}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		defines 
		{ 
			"_IMGUI_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"