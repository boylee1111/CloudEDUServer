using CloudEDUServer.Executable.adminconsole;
using System;
using System.Threading;

namespace CloudEDUServer.adminconsole
{
    public partial class CourseComment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string operate = Request.Params.Get("operate");
                if (operate != null && operate != "")
                {
                    int id = int.Parse(Request.Params.Get("id"));
                    COMMENT toDeleteComment = CourseAccess.GetCommentByID(id);
                    try
                    {
                        CourseAccess.RemoveComment(toDeleteComment);
                    }
                    catch
                    {
                        Response.Write("删除失败");
                        Response.End();
                    }
                    ThreadStart logStarter = () => DBDeleteCommentLog(toDeleteComment);
                    Thread logThread = new Thread(logStarter);
                    logThread.Start();

                    Response.Write("success");
                    Response.End();
                }

                string userId = Request.Params.Get("user");
                if (userId != null)
                {
                    Session["userComment"] = CustomerAccess.GetCustomerByID(int.Parse(userId));
                    Response.End();
                }
                string course = Request.Params.Get("course");
                if (course != null)
                {
                    Session["courseComment"] = CourseAccess.GetCourseById(int.Parse(course));
                    Response.End();
                }
            }
            catch
            {
            }
        }
        private void DBDeleteCommentLog(COMMENT toDeleteComment)
        {
            OPR_LOG newLog = new OPR_LOG();
            newLog.MSG = "于" + DateTime.Now.ToString("yyyy/MM/dd") + "删除评论" + toDeleteComment.CONTENT;
            ManagerAccess.AddDBLog(newLog);
            DiagnosticCarrier.Instance.LogForMessage(newLog.MSG);
        }
    }
}