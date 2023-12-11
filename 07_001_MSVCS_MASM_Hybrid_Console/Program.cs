using System.Runtime.InteropServices;

namespace _07_001_MSVCS_MASM_Hybrid_Console
{
    internal class Program
    {
        [DllImport(@"..\..\..\..\x64\Debug\MASM_Library.dll")]
        unsafe extern static long my_procedure();

        static void Main(string[] args)
        {
            var r = my_procedure();

            Console.WriteLine($"Low level procedure has returned {r}.");
        }
    }
}