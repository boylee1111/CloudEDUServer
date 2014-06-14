using System;

namespace CloudEDUServer.adminconsole
{
    public partial class UserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(Request.Params.Get("userId"));
                string stateStr = Request.Params.Get("userState");
                CUSTOMER user = CustomerAccess.GetCustomerByID(id);
                if (user == null) return;
                if (stateStr.Equals("YES"))
                {
                    user.ALLOW = true;

                }
                else if (stateStr.Equals("NO"))
                {
                    user.ALLOW = false;
                }

                CustomerAccess.UpdateCustomer(user);

            }
            catch
            {
            }
        }
    }
}