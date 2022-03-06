-- premake5.lua
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

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
       "Engine"
   }
   includedirs { 
       "project/Engine/src/**" 
   }

   files { 
       "project/%{prj.name}/src/**.h",
       "project/%{prj.name}/src/**.cpp" 
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

