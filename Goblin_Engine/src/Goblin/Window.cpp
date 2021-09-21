#include "gbpch.h"
#include "Window.h"
#include "Log.h"
namespace Goblin {
	Window::Window(int w, int h, std::string name) : width{ w }, height{ h }, windowName{ name } 
	{
		initWindow();
	}

	Window::~Window()
	{
		glfwDestroyWindow(window);
		GB_CORE_INFO("Destroyed GLFWwindow");
		glfwTerminate();
		GB_CORE_INFO("GLFW Terminated");
	}

	void Window::initWindow()
	{
		if (!glfwInit())
		{
			GB_CORE_ERROR("Failed to initialize glfw library");
		}
		//glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
		glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

		window = glfwCreateWindow(width, height, windowName.c_str(), nullptr, nullptr);
		if (window == 0)
		{
			GB_CORE_ERROR("Failed to create window");
		}
		else
		{
			GB_CORE_INFO("Window Created");
		}
	}
}