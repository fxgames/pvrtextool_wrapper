using System;
using System.IO;
using System.Diagnostics;
using System.Text.RegularExpressions;


namespace ProcessExitSample
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {

                var old_args = String.Join(" ", args);
                var new_args = old_args;

                if (old_args.Contains("-q etc"))
                {
                    new_args = new Regex("-q [A-Za-z]*").Replace(new_args,"-q etcfast");
                }
                else if (old_args.Contains("-q pvrtc"))
                {
                    new_args = new Regex("-q [A-Za-z]*").Replace(new_args,"-q pvrtcfastest");
                }

                //Console.WriteLine(new_args);
                Process firstProc = new Process();
                firstProc.StartInfo.FileName = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "PVRTexTool_orig.exe");
                firstProc.StartInfo.Arguments = new_args;
                firstProc.StartInfo.RedirectStandardOutput = true;
                firstProc.StartInfo.UseShellExecute = false;
                firstProc.EnableRaisingEvents = true;

                firstProc.Start();

                Console.WriteLine(firstProc.StandardOutput.ReadToEnd());

                firstProc.WaitForExit();

                //You may want to perform different actions depending on the exit code.
                Environment.Exit(firstProc.ExitCode);
       

            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred!!!: " + ex.Message);
            }
            finally
            {
                Environment.Exit(1);
            }
        }
    }
}