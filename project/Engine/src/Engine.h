#pragma once
#ifdef MAKEDLL
#  define EXPORT __declspec(dllexport)
#else
#  define EXPORT __declspec(dllimport)
#endif

class EXPORT Engine {
    public:
        int num1;
        int num2;
    public:
        int add(int a, int b);
};