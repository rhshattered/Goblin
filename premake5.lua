
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

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
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
		"%{prj.name}/src/**.cpp"
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
		"opengl32", "glfw3_mt" --"legacy_stdio_definitions", "odbccp32", 
		--"kernel32", "winspool", "comdlg32.lib",
		--"advapi32","shell32", "ole32", "oleaut32.lib", "uuid.lib", "odbc32", "odbccp32"
		-- Commented out because these libs have been proven to be unneccasary
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