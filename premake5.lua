workspace "GameGenie"
    configurations { "Debug", "Release" }
    startproject "Application"

    flags { "MultiProcessorCompile" }

    filter "configurations:Debug"
        defines { "DEBUG", "DEBUG_SHADER" }
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "Speed"
        flags { "LinkTimeOptimization" }

project "Engine"
    kind "SharedLib"
    language "C++"
    cppdialect "C++17"
	architecture "x86_64"
    targetdir "bin/%{cfg.buildcfg}"
    objdir "bin/obj/%{cfg.buildcfg}"
    
    includedirs { 
        "$(VULKAN_SDK)/include",
        "include/",
        "libs/glfw/include/",
        "libs/glm/",
        "libs/imgui/",
        "libs/imgui/examples", 
        "libs/imgui/backends"
    }
    links { 
        "GLFW",
        "GLM", 
        "$(VULKAN_SDK)/lib/vulkan-1.lib",
        "ImGui" 
    }

    files { 
        "project/Engine/**.h",
        "project/Engine/**.cpp" 
    }

    filter "system:linux"
        links { "dl", "pthread" }

        defines { "_X11" }

    filter "system:windows"
        defines { "_WINDOWS" }

project "Application"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
	architecture "x86_64"
    targetdir "bin/%{cfg.buildcfg}"
    objdir "bin/obj/%{cfg.buildcfg}"
    

    includedirs { 
        "$(VULKAN_SDK)/include", 
        "include/",
        "libs/glfw/include/",
        "libs/glm/",
        "libs/imgui/",
        "libs/imgui/examples",
        "libs/imgui/backends",
        "%{prj.location}/project/Engine/src/"
    }
    links { 
        "GLFW",
        "GLM",
        "$(VULKAN_SDK)/lib/vulkan-1.lib",
        "ImGui",
        "Engine"
    }

    files { "project/Application/**.h", "project/Application/**.cpp" }

    filter "system:linux"
        links { "dl", "pthread" }

        defines { "_X11" }

    filter "system:windows"
        defines { "_WINDOWS" }

include "libs/glfw.lua"
include "libs/glm.lua"
include "libs/imgui.lua"