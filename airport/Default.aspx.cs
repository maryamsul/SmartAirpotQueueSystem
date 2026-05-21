using System;
using System.Web.UI;

namespace airport
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheckin_Click(object sender, EventArgs e)
        {
            Response.Redirect("FlightCheck.aspx?service=Check-in");
        }

        protected void btnSecurity_Click(object sender, EventArgs e)
        {
            Response.Redirect("FlightCheck.aspx?service=Security");
        }

        protected void btnBoarding_Click(object sender, EventArgs e)
        {
            Response.Redirect("FlightCheck.aspx?service=Boarding");
        }
    }
    }