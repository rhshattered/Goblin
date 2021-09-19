#include "gbpch.h"
#include "Application.h"
#include "EventHandler.h"

namespace Goblin {
	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		while (true)
		{
			Goblin::EventHandler::EventHandler();
			std::this_thread::sleep_for(std::chrono::milliseconds(14));
		}
	}
}