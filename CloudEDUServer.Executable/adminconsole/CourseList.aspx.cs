using CloudEDUServer.Executable.adminconsole;
using System;
using System.Threading;

namespace CloudEDUServer.adminconsole
{
    public partial class CourseList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string operate = Request.Params.Get("operate");
                string value = Request.Params.Get("value");
                if (operate != null && operate.Equals("select"))
                {
                    Session["CourseListSelect"] = value;
                }
                else if (operate != null && operate.Equals("edit"))
                {
                    COURSE course = CourseAccess.GetCourseById(int.Parse(Request.Params.Get("courseId")));
                    try
                    {
                        Session["editCourse"] = course;
                    }
                    catch
                    {
                        Response.Write("编辑错误");
                        Response.End();
                    }
                    ThreadStart logStarter = () => DBEditCourseLog(course);
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

        private void DBEditCourseLog(COURSE course)
        {
            OPR_LOG newLog = new OPR_LOG();
            newLog.MSG = "于" + DateTime.Now.ToString("yyyy/MM/dd") + "编辑课程" + course.TITLE;
            ManagerAccess.AddDBLog(newLog);
            DiagnosticCarrier.Instance.LogForMessage(newLog.MSG);
        }
    }
}