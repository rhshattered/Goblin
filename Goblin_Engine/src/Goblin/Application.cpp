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
		while (!window.shouldClose())
		{
			glfwSwapBuffers(window.GetWindow());
			glfwPollEvents();
		}
	}
}