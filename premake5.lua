-- premake5.lua
workspace "GameGenie"
   configurations { "Debug", "Release" }
   platforms { "Win64" }
   startproject "Application"

project "Application"
   kind "ConsoleApp"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"
   location "project/Application"

   files { "**.h", "**.cpp" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

project "Engine"
   kind "SharedLib"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"
   location "project/Engine"

   files { "**.h", "**.cpp" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

