#include <iostream>
#include "../../Engine/src/Engine.h"


using namespace std;
namespace GameGenie {
	void print_test() {
		cout << "TEST Application" << endl;
		cout << Engine::Add(10, 11);
	}
}

int main() {
	using namespace GameGenie;
	print_test();
	return 0;
}