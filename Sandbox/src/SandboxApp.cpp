#include <Goblin.h>

class Sandbox : public Goblin::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Goblin::Application* Goblin::CreateApplication()
{
	return new Sandbox();
}
