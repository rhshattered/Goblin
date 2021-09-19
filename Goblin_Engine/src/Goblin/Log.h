#pragma once
#include "Core.h"
#include "spdlog/spdlog.h"
namespace Goblin {
	class GOBLIN_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
		
	protected:
		
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

//Core log macros
#define GB_CORE_TRACE(...)  ::Goblin::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define GB_CORE_INFO(...)   ::Goblin::Log::GetCoreLogger()->info(__VA_ARGS__)
#define GB_CORE_WARN(...)   ::Goblin::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define GB_CORE_ERROR(...)  ::Goblin::Log::GetCoreLogger()->error(__VA_ARGS__)
#define GB_CORE_FATAL(...)  ::Goblin::Log::GetCoreLogger()->fatal(__VA_ARGS__)

//Client og macros
#define GB_TRACE(...)       ::Goblin::Log::GetClientLogger()->trace(__VA_ARGS__)
#define GB_INFO(...)        ::Goblin::Log::GetClientLogger()->info(__VA_ARGS__)
#define GB_WARN(...)        ::Goblin::Log::GetClientLogger()->warn(__VA_ARGS__)
#define GB_ERROR(...)       ::Goblin::Log::GetClientLogger()->error(__VA_ARGS__)
#define GB_FATAL(...)       ::Goblin::Log::GetClientLogger()->fatal(__VA_ARGS__)