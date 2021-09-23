project "glad"
    kind "StaticLib"
    language "C"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    targetdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/glad/glad.h",
        "include/glad/glad.c",
        "include/KHR/khrplatform.h"
    }

    includedirs
    {
        "include"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "On"

    filter { "system:windows", "configurations:Release"}
        buildoptions "/MT"