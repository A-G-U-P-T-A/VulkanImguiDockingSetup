-- premake5.lua
-- add system variable 
-- Set the variable name as "DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1"
-- Set the variable value as 1
-- outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

workspace "GameGenie"
   configurations { 
       "Debug", "Release" 
   }
   platforms { 
       "Win64" 
   }
   startproject "Application"

project "Application"
   kind "ConsoleApp"
   language "C++"
   targetdir "%{wks.location}/release/%{prj.name}/app"
   location "project/Application"

   links { 
        "Engine",
        "$(VULKAN_SDK)/lib/vulkan-1.lib"
   }
   includedirs { 
       "%{wks.location}/project/Engine/src/**" ,
       "$(VULKAN_SDK)/include",
       "%{wks.location}/libs/glfw/include/"
   }
   links { "GLFW" }

   files { 
       "%{wks.location}/project/%{prj.name}/src/**.h",
       "%{wks.location}/project/%{prj.name}/src/**.cpp" 
   }

   filter "configurations:Debug"
      defines { 
          "DEBUG" 
      }
      symbols "On"

   filter "configurations:Release"
      defines { 
          "NDEBUG" 
      }
      optimize "On"

project "Engine"
   kind "SharedLib"
   language "C++"
   targetdir "%{wks.location}/release/%{prj.name}/dll"
   location "project/Engine"
   postbuildcommands {
       "{COPYFILE} %{wks.location}/release/%{prj.name}/dll/Engine.dll %{wks.location}/release/Application/app/Engine.dll"
   }

   files { "**.h", "**.cpp" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

include "libs/glfw.lua"
