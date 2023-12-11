#include <cstddef>
#include <Windows.h>

using BytesLauncher = int(*)();

std::byte rawBytes[] =
{
    std::byte { 0x9D }, //0x9D xor 0x0D == 0x90 (mnemonic: NOP)
    std::byte { 0x9D }, //0x9D xor 0x0D == 0x90 (mnemonic: NOP)
    std::byte { 0xCE }  //0xCE xor 0x0D == 0xC3 (mnemonic: RET)
};

int main()
{
    DWORD prev { 0x00 };

    for (auto &item : rawBytes)
    {
        item = item xor std::byte { 0x0D };
    }

    ::VirtualProtect(rawBytes, sizeof(rawBytes),
        PAGE_EXECUTE_READ, &prev);

    auto ExecutePayload = reinterpret_cast
        <BytesLauncher>(&rawBytes);

    ExecutePayload();

    return EXIT_SUCCESS;
}
