#pragma once

#ifdef GB_PLATFORM_WINDOWS

extern Goblin::Application* Goblin::CreateApplication();

int main(int argc, char** argv)
{
	printf("Welcome to goblin");
	auto app = Goblin::CreateApplication();
	app->Run();
	delete app;
}
#else
#error Goblin only supports windows
#endif 
