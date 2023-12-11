
// © ethical.blue Magazine // Cybersecurity clarified.

using System;
using System.Runtime.InteropServices;
using System.Threading;
using System.Windows;
using System.Windows.Controls;

namespace _08_001_AVX_Calc_WPF
{
    public partial class MainWindow : Window
    {
        public static float[] array1 = new float[8];
        public static float[] array2 = new float[8];
        public static float[] array3 = new float[8];

        private const string LibraryPath = @"..\..\..\..\x64\Debug\AVX_Calc_MASM_Library.dll";

        [DllImport(LibraryPath)]
        unsafe extern static void AddProc(float* arg1, float* arg2, float* arg3);
        [DllImport(LibraryPath)]
        unsafe extern static void SubProc(float* arg1, float* arg2, float* arg3);
        [DllImport(LibraryPath)]
        unsafe extern static void MulProc(float* arg1, float* arg2, float* arg3);
        [DllImport(LibraryPath)]
        unsafe extern static void DivProc(float* arg1, float* arg2, float* arg3);
        [DllImport(LibraryPath)]
        unsafe extern static void AndProc(float* arg1, float* arg2, float* arg3);
        [DllImport(LibraryPath)]
        unsafe extern static void AndNProc(float* arg1, float* arg2, float* arg3);
        [DllImport(LibraryPath)]
        unsafe extern static void OrProc(float* arg1, float* arg2, float* arg3);
        [DllImport(LibraryPath)]
        unsafe extern static void XorProc(float* arg1, float* arg2, float* arg3);

        public MainWindow()
        {
            InitializeComponent();

            var separator = Thread.CurrentThread.CurrentCulture.NumberFormat.NumberDecimalSeparator;

            Random r = new();

            txtOperand1a.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand1b.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand1c.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand1d.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand1e.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand1f.Text = "-2" + separator + "99999";
            txtOperand1g.Text = "0" + separator + "00001";
            txtOperand1h.Text = "0" + separator + "0";

            txtOperand2a.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand2b.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand2c.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand2d.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand2e.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand2f.Text = r.Next(0, 99).ToString() + separator + r.Next(0, 99).ToString();
            txtOperand2g.Text = "-2" + separator + r.Next(0, 99).ToString();
            txtOperand2h.Text = "1" + separator + "001";
        }

        private void cbxInstruction_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selected = ((ComboBoxItem)cbxInstruction.SelectedItem).Content?.ToString();

            if (string.IsNullOrWhiteSpace(selected))
                btnProceed.Content = "VADDPS";
            else
                btnProceed.Content = selected;
        }

        private void btnProceed_Click(object sender, RoutedEventArgs e)
        {
            if (ParseFloatOperands() == false)
                return;

            unsafe
            {
                fixed (float* ptr1 = array1, ptr2 = array2, ptr3 = array3)
                {
                    if (btnProceed.Content.Equals("VADDPS"))
                        AddProc(ptr1, ptr2, ptr3);
                    else if (btnProceed.Content.Equals("VSUBPS"))
                        SubProc(ptr1, ptr2, ptr3);
                    else if (btnProceed.Content.Equals("VMULPS"))
                        MulProc(ptr1, ptr2, ptr3);
                    else if (btnProceed.Content.Equals("VDIVPS"))
                        DivProc(ptr1, ptr2, ptr3);
                    else if (btnProceed.Content.Equals("VANDPS"))
                        AndProc(ptr1, ptr2, ptr3);
                    else if (btnProceed.Content.Equals("VANDNPS"))
                        AndNProc(ptr1, ptr2, ptr3);
                    else if (btnProceed.Content.Equals("VORPS"))
                        OrProc(ptr1, ptr2, ptr3);
                    else if (btnProceed.Content.Equals("VXORPS"))
                        XorProc(ptr1, ptr2, ptr3);
                    ShowFloatResults();
                }
            }
        }

        private bool ParseFloatOperands()
        {
            try
            {
                array1[0] = float.Parse(txtOperand1a.Text);
                array1[1] = float.Parse(txtOperand1b.Text);
                array1[2] = float.Parse(txtOperand1c.Text);
                array1[3] = float.Parse(txtOperand1d.Text);
                array1[4] = float.Parse(txtOperand1e.Text);
                array1[5] = float.Parse(txtOperand1f.Text);
                array1[6] = float.Parse(txtOperand1g.Text);
                array1[7] = float.Parse(txtOperand1h.Text);

                array2[0] = float.Parse(txtOperand2a.Text);
                array2[1] = float.Parse(txtOperand2b.Text);
                array2[2] = float.Parse(txtOperand2c.Text);
                array2[3] = float.Parse(txtOperand2d.Text);
                array2[4] = float.Parse(txtOperand2e.Text);
                array2[5] = float.Parse(txtOperand2f.Text);
                array2[6] = float.Parse(txtOperand2g.Text);
                array2[7] = float.Parse(txtOperand2h.Text);
            }
            catch (System.Exception)
            {
                MessageBox.Show("Entered value is not a valid float number.", 
                    "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            return true;
        }

        private void ShowFloatResults()
        {
            txtResult1.Text = array3[0].ToString();
            txtResult2.Text = array3[1].ToString();
            txtResult3.Text = array3[2].ToString();
            txtResult4.Text = array3[3].ToString();
            txtResult5.Text = array3[4].ToString();
            txtResult6.Text = array3[5].ToString();
            txtResult7.Text = array3[6].ToString();
            txtResult8.Text = array3[7].ToString();
        }
    }
}
