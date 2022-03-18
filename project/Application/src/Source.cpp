#include <iostream>
#include "../../Engine/src/Engine.h"


using namespace std;
namespace GameGenie {
	void init_gamegenie() {
		cout << "TEST Application" << endl;
		Engine engine;
		cout << engine.Add(10, 11) << endl;
		system("pause");
	}
}

int main() {
	using namespace GameGenie;
	init_gamegenie();
	return 0;
}