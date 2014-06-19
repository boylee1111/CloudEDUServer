using System.Runtime.InteropServices;

namespace CloudEDUServer.Executable.adminconsole
{
    public class DiagnosticCarrier
    {
        [DllImport("ServerToolKit.dll")]
        private static extern void DiagnosticLog(char[] msg);
        [DllImport("ServerToolKit.dll")]
        private static extern void DiagnosticLogToFile(char[] msg, char[] fileName);


        private static DiagnosticCarrier instance;
        private DiagnosticCarrier() { }
        public static DiagnosticCarrier Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DiagnosticCarrier();
                }
                return instance;
            }
        }

        public void LogForMessage(string msg)
        {
            DiagnosticLog(msg.ToCharArray());
        }

        public void LogForMessageWithFile(string msg, string fileName)
        {
            DiagnosticLogToFile(msg.ToCharArray(), fileName.ToCharArray());
        }
    }
}