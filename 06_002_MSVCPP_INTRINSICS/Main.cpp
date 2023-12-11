#include <iostream>
#include <iomanip>
#include <chrono>
#include <immintrin.h>

void print__m256i(const __m256i& data)
{
    auto bytes = reinterpret_cast<const unsigned*>(&data);
    for (int i = 0; i < 8; i++)
    {
        std::cout << std::hex << std::setw(8)
            << std::setfill('0') << std::uppercase
            << bytes[i] << " ";
    }
}

int main()
{
    ::setlocale(LC_ALL, "");

    __m256i a = _mm256_set_epi32(0xDEADBEEF, 0xDEADC0DE,
        0xBAAAAAAD, 0xDEADBEEF, 0xDEADBEEF, 0xDEADBEEF,
        0xDEADBEEF, 0xDEADBEEF);
    __m256i b = _mm256_set_epi32(0xC0FFEEEE, 0xADD1C7ED,
        0xC0FFEEEE, 0xADD1C7ED, 0xC0FFEEEE, 0xADD1C7ED,
        0xC0FFEEEE, 0xADD1C7ED);

    const auto& start = std::chrono::high_resolution_clock::now();

    __m256i c = _mm256_xor_si256(a, b);

    const auto& stop = std::chrono::high_resolution_clock::now();

    auto time1 = stop - start;

    std::cout << "     ";
    print__m256i(a);
    std::cout << std::endl;
    std::cout << " xor ";
    print__m256i(b);
    std::cout << std::endl << std::endl;
    std::cout << "     ";
    print__m256i(c);
    std::cout << std::endl << std::endl << std::dec;
    std::cout << "The XOR operation has taken " << time1.count() <<
        " nanoseconds." << std::endl;

    return EXIT_SUCCESS;
}
