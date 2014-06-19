using CloudEDUServer.Executable.adminconsole;
using System;
using System.Threading;
using System.Web.UI;

namespace CloudEDUServer.adminconsole
{
    public partial class CourseCensorship : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(Request.Params.Get("courseId"));
                string stateStr = Request.Params.Get("courseState");
                if (stateStr.Equals("OK"))
                {
                    CourseAccess.UpdateCourseStatus(id, CourseStatus.OK);
                }
                else if (stateStr.Equals("Pending"))
                {
                    CourseAccess.UpdateCourseStatus(id, CourseStatus.PENDING);
                }
                else if (stateStr.Equals("Cancel"))
                {
                    CourseAccess.UpdateCourseStatus(id, CourseStatus.CANCEL);
                }

                ThreadStart logStarter = () => DBUpdateCourseStateLog(id);
                Thread logThread = new Thread(logStarter);
                logThread.Start();
            }
            catch
            {
            }
        }

        private void DBUpdateCourseStateLog(int courseId)
        {
            COURSE updatedCourse = CourseAccess.GetCourseById(courseId);
            OPR_LOG newLog = new OPR_LOG();
            newLog.MSG = "于" + DateTime.Now.ToString("yyyy/MM/dd") + "更改课程" + updatedCourse.TITLE + "状态为" + updatedCourse.COURSE_STATUS;
            ManagerAccess.AddDBLog(newLog);
            DiagnosticCarrier.Instance.LogForMessage(newLog.MSG);
        }
    }
}