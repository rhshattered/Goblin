#pragma once
#include "gbpch.h"
#include "Core.h"
#include "Window.h"
#include "Log.h"

void static key_callback(GLFWwindow* window, int key, int scancode, int action, int mods)
{
	if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
		GB_CORE_CRITICAL("Escape Pressed");

	if (key == GLFW_KEY_W && action == GLFW_PRESS)
		GB_CORE_INFO("W Pressed");
}
namespace Goblin {

	class GOBLIN_API Input
	{
	public:
		//Uses a callback method to process input
		//Reccomended for newbies
		void CreateListener(GLFWwindow* window)
		{
			glfwSetKeyCallback(window, key_callback);
		}

		/*
		Runs inside main window loop to process input
		Potentially More performant than CreateListener()
		This is useful for key down/key up checks and is not
		yet functional with pressed functionality
		*/
		void Listen(GLFWwindow* window)
		{
			//To do
		}
	private:
	};
};
