#define MAKE_DLL

#include "Engine.h"
#include <iostream>
using namespace std;

int Engine::add(int a, int b) {
	cout << (a + b) << endl;
	return a + b;
}