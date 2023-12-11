using System.Runtime.InteropServices;

internal class Program
{
    internal static uint MEM_COMMIT = 0x1000;
    internal static uint PAGE_EXECUTE_READWRITE = 0x40;

    [DllImport("kernel32.dll")]
    static extern unsafe IntPtr VirtualAlloc(
        IntPtr lpAddress, int dwSize, uint flAllocationType, uint flProtect);

    internal delegate int BytesLauncher();

    static void Main()
    {
        byte[] rawBytes = new byte[] { 
            0x9D, //0x9D xor 0x0D == 0x90 (mnemonic: NOP)
            0x9D, //0x9D xor 0x0D == 0x90 (mnemonic: NOP)
            0xCE  //0xCE xor 0x0D == 0xC3 (mnemonic: RET)
        };

        for(int i = 0; i < rawBytes.Length; i++)
            rawBytes[i] = (byte)(rawBytes[i] ^ 0x0D);

        var payload = VirtualAlloc(IntPtr.Zero, rawBytes.Length, MEM_COMMIT, PAGE_EXECUTE_READWRITE);

        Marshal.Copy(rawBytes, 0, payload, rawBytes.Length);

        if (Marshal.GetDelegateForFunctionPointer(
            payload, typeof(BytesLauncher)) is BytesLauncher ExecutePayload)
        {
            _ = ExecutePayload();
        }
    }
}