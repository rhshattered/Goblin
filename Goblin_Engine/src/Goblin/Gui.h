#pragma once
#include "Core.h"
namespace Goblin {
	class GOBLIN_API Gui
	{
	public:
		Gui(GLFWwindow* window);
		~Gui();
		void draw();

	private:

		ImGuiContext* ctx = nullptr;
		ImGuiStyle* style = nullptr;
	};
}


