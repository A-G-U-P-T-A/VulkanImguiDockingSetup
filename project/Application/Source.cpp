#include <iostream>
using namespace std;
namespace GameGenie {
	void print_test() {
		cout << "TEST Application";
	}
}

int main() {
	using namespace GameGenie;
	print_test();
	return 0;
}