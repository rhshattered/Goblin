#pragma once

#ifdef GB_PLATFORM_WINDOWS

extern Goblin::Application* Goblin::CreateApplication();

int main(int argc, char** argv)
{
	Goblin::Log::Init();
	GB_CORE_INFO("Initialized Goblin Logging!");
	GB_INFO("Initialized Game Logging!");
	auto app = Goblin::CreateApplication();
	app->Run();
	delete app;
}
#else
#error Goblin only supports windows
#endif 
