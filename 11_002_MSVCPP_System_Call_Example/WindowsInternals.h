#pragma once

#include <Windows.h>

#define FILE_CREATE 0x00000002
#define FILE_NON_DIRECTORY_FILE 0x00000040
#define OBJ_CASE_INSENSITIVE 0x00000040L

typedef struct _IO_STATUS_BLOCK {
    union {
        NTSTATUS Status;
        PVOID Pointer;
    } DUMMYUNIONNAME;

    ULONG_PTR Information;
} IO_STATUS_BLOCK, * PIO_STATUS_BLOCK;

typedef struct _UNICODE_STRING {
    USHORT Length;
    USHORT MaximumLength;
    PWSTR  Buffer;
} UNICODE_STRING, * PUNICODE_STRING;

typedef struct _OBJECT_ATTRIBUTES {
    ULONG           Length;
    HANDLE          RootDirectory;
    PUNICODE_STRING ObjectName;
    ULONG           Attributes;
    PVOID           SecurityDescriptor;
    PVOID           SecurityQualityOfService;
}  OBJECT_ATTRIBUTES, * POBJECT_ATTRIBUTES;

using _RtlInitUnicodeString = void(__stdcall*)(PUNICODE_STRING, PCWSTR);

using _NtClose = NTSTATUS(__stdcall*)(HANDLE);