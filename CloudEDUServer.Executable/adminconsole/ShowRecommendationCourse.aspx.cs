﻿using System;

namespace CloudEDUServer.adminconsole
{
    public partial class ShowRecommendationCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string operate = Request.Params.Get("operate");

                if (operate == null || operate == "")
                {
                    return;
                }

                int courseId = int.Parse(Request.Params.Get("id"));
                int recId = int.Parse(Request.Params.Get("recId"));
                if (operate.Equals("yes"))
                {
                    CourseAccess.AddCourseToRecommendation(CourseAccess.GetCourseById(courseId), CourseAccess.GetRecommendationByID(recId));
                }
                else if (operate.Equals("no"))
                {
                    CourseAccess.RemoveCourseFromRecommendation(CourseAccess.GetCourseById(courseId), CourseAccess.GetRecommendationByID(recId));
                }
            }
            catch
            {
            }
        }
    }
}