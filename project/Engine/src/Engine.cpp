#include "Engine.h"
#include <iostream>



namespace Engine {
	int Engine::add(int a, int b) {
		std::cout << (a + b) << std::endl;
		return a + b;
	}

	void Engine::test_func_10() {
		std::cout << "TEST" << std::endl;
	}
}