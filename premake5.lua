workspace "Goblin_Engine"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist",
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Goblin_Engine"
	location "Goblin_Engine"
	kind "SharedLib"
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
		"%{prj.name}/vendor/spdlog/include"
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