﻿using CloudEDUServer.Executable.adminconsole;
using System;
using System.Threading;

namespace CloudEDUServer.adminconsole
{
    public partial class AddManager : System.Web.UI.Page
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
                if (manager != null)
                {
                    Response.Write("该账号已经存在");
                    Response.End();
                }

                MANAGER newManager = new MANAGER();
                newManager.NAME = account;
                newManager.PASSWORD = password;
                int permissionNum = int.Parse(Request.Params.Get("permission"));

                newManager.MNGR_TYPE = int.Parse(Request.Params.Get("type"));

                if (ManagerAccess.AddManager(newManager))
                {
                    try
                    {
                        newManager = ManagerAccess.GetManagerByName(account);
                        PERMISSION[] allPermission = ManagerAccess.GetAllPermissions();
                        for (int i = 0; permissionNum != 0; i++)
                        {
                            if ((permissionNum & (1 << i)) != 0)
                            {
                                ManagerAccess.GrantPermissionToManager(newManager.ID, allPermission[i].ID);
                                permissionNum -= (1 << i);
                            }
                        }
                    }
                    catch
                    {
                        Response.Write("权限添加失败");
                        Response.End();
                    }
                    ThreadStart logStarter = () => DBNewManagerLog(newManager);
                    Thread logThread = new Thread(logStarter);
                    logThread.Start();

                    Response.Write("success");
                    Response.End();
                }
                else
                {
                    Response.Write("新建管理员失败,请重试");
                    Response.End();
                }
            }
            catch
            {
            }
        }

        private void DBNewManagerLog(MANAGER newManager)
        {
            OPR_LOG newLog = new OPR_LOG();
            newLog.MSG = "于" + DateTime.Now.ToString("yyyy/MM/dd") + "添加管理员" + newManager.NAME;
            ManagerAccess.AddDBLog(newLog);
            DiagnosticCarrier.Instance.LogForMessage(newLog.MSG);
            DiagnosticCarrier.Instance.LogForMessageWithFile(newLog.MSG, "Manager");
        }
    }
}