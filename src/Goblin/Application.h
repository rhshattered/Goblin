#pragma once
#include "Core.h"
namespace Goblin {
	class GOBLIN_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};
	// to be defined in client
	Application* CreateApplication();
}


