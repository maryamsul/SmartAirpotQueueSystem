using System;
using System.Web.UI;

namespace airport
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool loggedIn = Session["UserId"] != null;

                lnkLogin.Visible = !loggedIn;
                btnLogout.Visible = loggedIn;

                // Dashboard button only for logged-in users
                lnkDashboard.Visible = loggedIn;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}