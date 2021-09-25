#include "gbpch.h"
#include "Window.h"
#include "Log.h"
#include "Render.h"
namespace Goblin {
	Window::Window(int w, int h, std::string name) : width{ w }, height{ h }, windowName{ name } 
	{
		initWindow();
		renderWindow();
	}

	Window::~Window()
	{
		glfwDestroyWindow(window);
		GB_CORE_INFO("Destroyed GLFWwindow");
		glfwTerminate();
		GB_CORE_INFO("GLFW Terminated");
		GB_CORE_INFO("Window Class Destructed");
	}



	void Window::initWindow()
	{
		if (!glfwInit())
		{
			GB_CORE_ERROR("Failed to initialize glfw library");
		}
		//glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
		glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);
		glfwWindowHint(GLFW_SAMPLES, 8);
		window = glfwCreateWindow(width, height, windowName.c_str(), nullptr, nullptr);
		if (window == 0)
		{
			GB_CORE_ERROR("Failed to create window");
		}
		else
		{
			GB_CORE_INFO("Window Created");
		}
		glfwMakeContextCurrent(window);
		if (!gladLoadGL()) {
			GB_CORE_ERROR("Glad failed to load OpenGL");
		}
		else
		{
			GB_CORE_INFO("Glad loaded OpenGL");
		}
		input.CreateListener(window);
		rnd.Prep();

	}

	void Window::renderWindow()
	{
		while (!glfwWindowShouldClose(window))
		{
			rnd.Draw();
			glfwSwapBuffers(window);
			// Take care of all GLFW events
			glfwPollEvents();
		}

	}
}