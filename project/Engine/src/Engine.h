//#define DllImport __declspec( dllimport )
//#define DllExport __declspec( dllexport )
#if defined(_BUILD_DLL) && defined(_WINDOWS)
	#define EngineAPI  __declspec(dllexport)   // export DLL information
#else
	#define EngineAPI  __declspec(dllimport)   // import DLL information
#endif 


namespace Engine{
	class EngineAPI Engine {
	public:
		static int add(int a, int b);
		void test_func_10();
	};
}
