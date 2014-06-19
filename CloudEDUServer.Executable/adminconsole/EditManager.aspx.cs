using CloudEDUServer.Executable.adminconsole;
using ManagerPermATLComLib;
using System;
using System.Threading;

namespace CloudEDUServer.adminconsole
{
    public partial class EditManager : System.Web.UI.Page
    {
        PermCom objPermObj = null;
        int _totalPerms = 0;

        public EditManager()
        {
            objPermObj = new PermCom();
            objPermObj.TotalPermissions += objSimpleObj_TotalPerms;
        }

        void objSimpleObj_TotalPerms(int a_lTotalPerms)
        {
            PERMISSION[] allPermission = ManagerAccess.GetAllPermissions();
            for (int i = 0; i < allPermission.Length; ++i)
                allPermission[i].ID = 1 << _totalPerms;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            bool fireEvent = true;
            try
            {
                string account = Request.Params.Get("account");
                string password = Request.Params.Get("password");
                int permissionNum = int.Parse(Request.Params.Get("permission"));
                if (account == null || password == null)
                {
                    return;
                }

                MANAGER manager = ManagerAccess.GetManagerByName(account);
                if (manager == null)
                {
                    Response.Write("改用户不存在");
                    Response.End();
                    return;
                }

                try
                {
                    manager.NAME = account;
                    if (password != null && password != "")
                    {
                        manager.PASSWORD = password;
                    }

                    PERMISSION[] permission = ManagerAccess.GetPermissionsByManager(manager);
                    for (int i = 0; i < permission.Length; i++)
                    {
                        ManagerAccess.RevokePermissionFromManager(manager.ID, permission[i].ID);
                    }
                    PERMISSION[] allPermission = ManagerAccess.GetAllPermissions();
                    for (int i = 0; permissionNum != 0; i++)
                    {
                        if ((permissionNum & (1 << i)) != 0)
                        {
                            ManagerAccess.GrantPermissionToManager(manager.ID, allPermission[i].ID);
                            permissionNum -= (1 << i);
                        }
                        _totalPerms = objPermObj.PermCalculate(fireEvent);
                    }
                    manager.MNGR_TYPE = int.Parse(Request.Params.Get("type"));
                    ManagerAccess.UpdateManager(manager);
                }
                catch
                {
                    Response.Write("修改错误，请重试");
                    Response.End();
                }
                finally //成功
                {
                    ThreadStart logStarter = () => DBUpdateManagerLog(manager);
                    Thread logThread = new Thread(logStarter);
                    logThread.Start();

                    Response.Write("success");
                    Response.End();
                }
            }
            catch
            {
            }
        }

        private void DBUpdateManagerLog(MANAGER manager)
        {
            OPR_LOG newLog = new OPR_LOG();
            newLog.MSG = "于" + DateTime.Now.ToString("yyyy/MM/dd") + "更新管理员" + manager.NAME;
            ManagerAccess.AddDBLog(newLog);
            DiagnosticCarrier.Instance.LogForMessage(newLog.MSG);
        }
    }
}