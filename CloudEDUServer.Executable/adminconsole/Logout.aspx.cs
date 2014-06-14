using System;

namespace CloudEDUServer.adminconsole
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Manager"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}