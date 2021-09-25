#pragma once
#include "gbpch.h"
#include "Core.h"
#include "Render.h"
#include "Input.h"
//#define GLFW_INCLUDE_VULKAN
namespace Goblin {
	class GOBLIN_API Window
	{
	public:
		Window(int w, int h, std::string name);
		~Window();
		
		bool shouldClose() { return glfwWindowShouldClose(window); }
		GLFWwindow* GetWindow() { return window; }
		Render::GL rnd;
		Input input;
	private:
		void initWindow();
		void renderWindow();


		const int width;
		const int height;
		GLFWwindow* window;
		std::string windowName;

		GLuint shaderProgram;

		GLuint VAO, VBO;

	};
}


