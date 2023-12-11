
// © ethical.blue Magazine // Cybersecurity clarified.

#include "WindowsInternals.h"

int main()
{
    auto hNTDLL = LoadLibrary(L"ntdll.dll");

    if (hNTDLL == NULL)
        return EXIT_FAILURE;

    auto NtCreateFile = reinterpret_cast<_NtCreateFile>(
        GetProcAddress(hNTDLL, "NtCreateFile"));

    if (NtCreateFile == NULL)
        return EXIT_FAILURE;

    auto RtlInitUnicodeString = reinterpret_cast<_RtlInitUnicodeString>(
        GetProcAddress(hNTDLL, "RtlInitUnicodeString"));

    if (RtlInitUnicodeString == NULL)
        return EXIT_FAILURE;

    auto NtClose = reinterpret_cast<_NtClose>(GetProcAddress(hNTDLL, "NtClose"));

    if (NtClose == NULL)
        return EXIT_FAILURE;

    HANDLE hFile{ NULL };
    OBJECT_ATTRIBUTES objectAttributes = { NULL };

    PCWSTR filePath = L"\\??\\C:\\Users\\iamda\\Desktop\\NTCreateFile.ethical.blue.was.here";
    UNICODE_STRING unicodeString;
    RtlInitUnicodeString(&unicodeString, filePath);

    objectAttributes.Attributes = OBJ_CASE_INSENSITIVE;
    objectAttributes.Length = sizeof OBJECT_ATTRIBUTES;
    objectAttributes.ObjectName = &unicodeString;
    objectAttributes.RootDirectory = NULL;
    objectAttributes.SecurityDescriptor = NULL;
    objectAttributes.SecurityQualityOfService = NULL;

    constexpr int allocSize = 2048;
    LARGE_INTEGER largeInteger { NULL };
    largeInteger.QuadPart = allocSize;
    IO_STATUS_BLOCK ioStatusBlock = { 0 };

    NtCreateFile(&hFile, STANDARD_RIGHTS_ALL, &objectAttributes, &ioStatusBlock,
        &largeInteger, FILE_ATTRIBUTE_NORMAL, FILE_SHARE_READ, FILE_CREATE,
        FILE_NON_DIRECTORY_FILE, NULL, NULL);

    if (hFile == NULL)
        return EXIT_FAILURE;

    NtClose(hFile);

    return EXIT_SUCCESS;
}