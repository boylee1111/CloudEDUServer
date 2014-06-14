﻿using System;

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
                    try
                    {
                        int id = int.Parse(Request.Params.Get("id"));
                        CourseAccess.RemoveComment(CourseAccess.GetCommentByID(id));
                    }
                    catch
                    {
                        Response.Write("删除失败");
                        Response.End();
                    }
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
    }
}