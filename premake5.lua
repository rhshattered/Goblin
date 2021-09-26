
term.setTextColor(term.green)
print("GoblinProjectGenerator\n")
term.setTextColor(term.white)
print("Using premake: " , _PREMAKE_VERSION , '\n')

print("Premake Location: ", _PREMAKE_COMMAND , '\n')

print("Working Location: ", _WORKING_DIR , '\n')

print("Performing Action: ", _ACTION , '\n')

local ver = os.getversion()
print("Operating System Detected: ", os.target(), string.format(" %d.%d.%d (%s)",
ver.majorversion, ver.minorversion, ver.revision,
ver.description), '\n')
if os.is64bit() then
	term.setTextColor(term.white)
	print("Architecture: x64")
else 
	term.setTextColor(term.red)
	print("Architecture: x86")
end

workspace "Goblin_Engine"
	architecture "x64"
	configurations
	{
		"Debug",
		"Release",
		"Dist",
	}

	flags
	{
		"MultiProcessorCompile"
	}

	startproject "Sandbox"
	characterset ("MBCS")


outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "Goblin_Engine/vendor/glad"

project "glfw"
	kind "StaticLib"
	language "C"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"Goblin_Engine/vendor/glfw/GLFW/glfw3.h",
		"Goblin_Engine/vendor/glfw/include/GLFW/glfw3native.h",
		"Goblin_Engine/vendor/glfw/src/glfw_config.h",
		"Goblin_Engine/vendor/glfw/src/context.c",
		"Goblin_Engine/vendor/glfw/src/init.c",
		"Goblin_Engine/vendor/glfw/src/input.c",
		"Goblin_Engine/vendor/glfw/src/monitor.c",
		"Goblin_Engine/vendor/glfw/src/vulkan.c",
		"Goblin_Engine/vendor/glfw/src/window.c"
	}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"Goblin_Engine/vendor/glfw/src/win32_init.c",
			"Goblin_Engine/vendor/glfw/src/win32_joystick.c",
			"Goblin_Engine/vendor/glfw/src/win32_monitor.c",
			"Goblin_Engine/vendor/glfw/src/win32_time.c",
			"Goblin_Engine/vendor/glfw/src/win32_thread.c",
			"Goblin_Engine/vendor/glfw/src/win32_window.c",
			"Goblin_Engine/vendor/glfw/src/wgl_context.c",
			"Goblin_Engine/vendor/glfw/src/egl_context.c",
			"Goblin_Engine/vendor/glfw/src/osmesa_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}


	filter "system:linux"
		pic "On"

		systemversion "latest"
		
		files
		{
			"Goblin_Engine/vendor/glfw/src/x11_init.c",
			"Goblin_Engine/vendor/glfw/src/x11_monitor.c",
			"Goblin_Engine/vendor/glfw/src/x11_window.c",
			"Goblin_Engine/vendor/glfw/src/xkb_unicode.c",
			"Goblin_Engine/vendor/glfw/src/posix_time.c",
			"Goblin_Engine/vendor/glfw/src/posix_thread.c",
			"Goblin_Engine/vendor/glfw/src/glx_context.c",
			"Goblin_Engine/vendor/glfw/src/egl_context.c",
			"Goblin_Engine/vendor/glfw/src/osmesa_context.c",
			"Goblin_Engine/vendor/glfw/src/linux_joystick.c"
		}

		defines
		{
			"_GLFW_X11"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/src/**.c"
	}

	includedirs
	{
		"Goblin_Engine/vendor/spdlog/include",
		"Goblin_Engine/vendor/glfw/include",
		"Goblin_Engine/vendor/glad/include",
		"Goblin_Engine/src"
	}

	links
	{
		"Goblin_Engine"
	}

	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"GB_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "GB_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "GB_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "GB_DIST"
		optimize "On"

project "Goblin_Engine"
	location "Goblin_Engine"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "gbpch.h"
	pchsource "%{prj.name}/src/gbpch.cpp"

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/src/**.c"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include",
		"%{prj.name}/vendor/glfw/include",
		"%{prj.name}/vendor/glad/include",
		"%{prj.name}/src"
	}
	ignoredefaultlibraries { "MSVCRT", "LIBCMT" }
	
	libdirs {"%{prj.name}/vendor/glfw/lib"}
	-- Our static lib should not link against GLFW
	links {
		"opengl32", "glfw",
		"glad"
	}


	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"GB_PLATFORM_WINDOWS",
			"GB_BUILD_DLL"
		}


		postbuildcommands
		{
			"{COPY} %{cfg.buildtarget.relpath}  ../bin/" .. outputdir .. "/Sandbox"
		}

	filter "configurations:Debug"
		defines "GB_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "GB_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "GB_DIST"
		optimize "On"