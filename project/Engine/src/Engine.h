#pragma once
using namespace std;
namespace GameGenie
{
    class Engine
    {
    public:
        // Returns a + b 
        __declspec(dllexport) double Add(double a, double b);

        // Returns a - b 
        __declspec(dllexport) double Subtract(double a, double b);

        // Returns a * b 
        __declspec(dllexport) double Multiply(double a, double b);

        // Returns a / b 
        // Throws DivideByZeroException if b is 0 
        __declspec(dllexport) double Divide(double a, double b);
    };
}


