#pragma once
#include "Core.h"
#include "Window.h"
namespace Goblin {
	class GOBLIN_API Application
	{
	public:
		static constexpr int WIDTH = 800;
		static constexpr int HEIGHT = 600;
		Application();
		virtual ~Application();

		void Run();
	private:
		Window window{WIDTH, HEIGHT, "Goblin Engine"};
		
	};
	// to be defined in client
	Application* CreateApplication();
}


