#pragma once
#include "gbpch.h"
#include "Core.h"
//#define GLFW_INCLUDE_VULKAN
namespace Goblin {
	class GOBLIN_API Window
	{
	public:
		Window(int w, int h, std::string name);
		~Window();
		
		bool shouldClose() { return glfwWindowShouldClose(window); }
		GLFWwindow* GetWindow() { return window; }
	private:
		void initWindow();

		const int width;
		const int height;
		GLFWwindow* window;
		std::string windowName;
	};
}


