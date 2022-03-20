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
    targetdir "%{wks.location}/release/%{prj.name}/dll"
    location "project/Engine"
    postbuildcommands {
       "{COPYFILE} %{wks.location}/release/%{prj.name}/dll/Engine.dll %{wks.location}/release/Application/app/Engine.dll"
    }
    --includedirs { 
     --  "$(VULKAN_SDK)/include", "libs/glfw/include/", "libs/glm/"
    --}
    --links { "GLFW", "GLM" }
    --files { "**.h", "**.cpp" }

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
    objdir "obj/%{cfg.buildcfg}"
    --location ""
    

    includedirs { 
       "$(VULKAN_SDK)/include", "include/",  "libs/glfw/include/", "libs/glm/"
    }
    links { "GLFW", "GLM", "$(VULKAN_SDK)/lib/vulkan-1.lib" }

    files { "project/Application/**.h", "project/Application/**.cpp" }

    filter "system:linux"
        links { "dl", "pthread" }

        defines { "_X11" }

    filter "system:windows"
        defines { "_WINDOWS" }

include "libs/glfw.lua"
include "libs/glm.lua"