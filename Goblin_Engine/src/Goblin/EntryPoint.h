#pragma once

#ifdef GB_PLATFORM_WINDOWS

extern Goblin::Application* Goblin::CreateApplication();

int main(int argc, char** argv)
{
	Goblin::Log::Init();
	GB_CORE_WARN("Initialized Log!");
	int a = 5;
	GB_INFO("Hello! Var={0}", a);
	auto app = Goblin::CreateApplication();
	app->Run();
	delete app;
}
#else
#error Goblin only supports windows
#endif 
