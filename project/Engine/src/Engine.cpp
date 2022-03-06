#include "Engine.h"

#include <stdexcept>

using namespace std;

namespace GameGenie
{
    double Engine::Add(double a, double b)
    {
        return a + b;
    }

    double Engine::Subtract(double a, double b)
    {
        return a - b;
    }

    double Engine::Multiply(double a, double b)
    {
        return a * b;
    }

    double Engine::Divide(double a, double b)
    {
        if (b == 0)
        {
            throw new invalid_argument("b cannot be zero!");
        }

        return a / b;
    }
}