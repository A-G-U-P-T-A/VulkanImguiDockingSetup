#pragma once
#define DllImport __declspec( dllimport )
#define DllExport __declspec( dllexport )

class DllExport Engine {
	public:
		static int add(int a, int b);
};