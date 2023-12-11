#include <iostream>

extern "C" int64_t my_procedure();

int main()
{
    auto r = my_procedure();

    std::cout << "Low level procedure has returned " 
        << r 
        << "." 
        << std::endl;

    return EXIT_SUCCESS;
}