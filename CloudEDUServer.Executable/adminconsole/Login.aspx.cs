using CloudEDUServer;
using CloudEDUServer.Executable.adminconsole;
using System;
using System.Threading;

namespace cloudEdu
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string account = Request.Params.Get("account");
                string password = Request.Params.Get("password");

                if (account == null || password == null)
                {
                    return;
                }
                else
                {
                    MANAGER manager;
                    try
                    {
                        manager = ManagerAccess.GetManagerByName(account);
                    }
                    catch
                    {
                        Response.Write("连接错误，请重新试");
                        Response.End();
                        return;
                    }
                    if (manager == null)
                    {
                        Response.Write("用户不存在");
                        Response.End();
                    }
                    else if (manager.PASSWORD.Equals(password))
                    {
                        ThreadStart logStarter = () => DBManagerLoginLog(manager);
                        Thread logThread = new Thread(logStarter);
                        logThread.Start();

                        Session["manager"] = manager;
                        Response.Write("success");
                        Response.End();
                    }
                    else
                    {
                        Response.Write("密码错误");
                        Response.End();
                    }
                }
            }
            catch
            {
            }
        }

        private void DBManagerLoginLog(MANAGER manager)
        {
            OPR_LOG newLog = new OPR_LOG();
            newLog.MSG = "于" + DateTime.Now.ToString("yyyy/MM/dd") + "管理员" + manager.NAME + "登录";
            ManagerAccess.AddDBLog(newLog);
            DiagnosticCarrier.Instance.LogForMessage(newLog.MSG);
            DiagnosticCarrier.Instance.LogForMessageWithFile(newLog.MSG, "Manager");
        }
    }
}