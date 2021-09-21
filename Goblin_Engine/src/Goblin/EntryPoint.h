#pragma once

#ifdef GB_PLATFORM_WINDOWS

extern Goblin::Application* Goblin::CreateApplication();

int main(int argc, char** argv)
{
	std::string cpu = Goblin::ComponentLogger::GetCpuDetails();
	float ram = Goblin::ComponentLogger::GetTotalSystemMemory();
	Goblin::Log::Init();
	GB_CORE_INFO("Initialized Goblin Logging!");
	GB_INFO("Initialized Game Logging!");
	GB_CORE_INFO("Cpu Name {:s}", cpu);
	GB_CORE_INFO("Total GB of ram is {:d}", static_cast<int>(ram));
	auto app = Goblin::CreateApplication();
	app->Run();
	delete app;
	GB_CORE_INFO("All libraries free'd see ya later!");
	std::this_thread::sleep_for(std::chrono::seconds(3));
	
}
#else
#error Goblin only supports windows
#endif 
