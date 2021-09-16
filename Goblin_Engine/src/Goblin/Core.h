#pragma once

#ifdef GB_PLATFORM_WINDOWS
	#ifdef GB_BUILD_DLL
		#define GOBLIN_API __declspec(dllexport)
	#else // DEBUG
		#define GOBLIN_API __declspec(dllimport)
	#endif
#else
	#error Goblin only supports windows
#endif 
