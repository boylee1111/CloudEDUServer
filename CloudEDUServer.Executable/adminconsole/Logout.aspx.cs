using CloudEDUServer.Executable.adminconsole;
using System;
using System.Threading;

namespace CloudEDUServer.adminconsole
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ThreadStart logStarter = () => DBNewManagerLogout(Session["Manager"] as MANAGER);
            Thread logThread = new Thread(logStarter);
            logThread.Start();

            Session["Manager"] = null;
            Response.Redirect("Login.aspx");
        }

        private void DBNewManagerLogout(MANAGER manager)
        {
            OPR_LOG newLog = new OPR_LOG();
            newLog.MSG = "于" + DateTime.Now.ToString("yyyy/MM/dd") + "管理员" + manager.NAME + "登出";
            ManagerAccess.AddDBLog(newLog);
            DiagnosticCarrier.Instance.LogForMessage(newLog.MSG);
            DiagnosticCarrier.Instance.LogForMessageWithFile(newLog.MSG, "Manager");
        }
    }
}