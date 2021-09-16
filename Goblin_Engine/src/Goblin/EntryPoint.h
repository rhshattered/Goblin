#pragma once

#ifdef GB_PLATFORM_WINDOWS

extern Goblin::Application* Goblin::CreateApplication();

int main(int argc, char** argv)
{
	Goblin::Log::Init();
	Goblin::Log::GetCoreLogger()->warn("Initialized Log");
	Goblin::Log::GetClientLogger()->info("Hello !");
	auto app = Goblin::CreateApplication();
	app->Run();
	delete app;
}
#else
#error Goblin only supports windows
#endif 
