using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace airport
{
    public partial class StaffDashboard : Page
    {
        string connString = ConfigurationManager.ConnectionStrings["SmartAirportQueueDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCounter.Items.Clear();

            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand(
                "SELECT CounterId, CounterName FROM Counters WHERE ServiceType=@ServiceType AND IsActive=1",
                conn);

            cmd.Parameters.AddWithValue("@ServiceType", ddlService.SelectedValue);

            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                ddlCounter.Items.Add(
                    new System.Web.UI.WebControls.ListItem(
                    reader["CounterName"].ToString(),
                    reader["CounterId"].ToString()));
            }

            conn.Close();
        }

        protected void btnOpen_Click(object sender, EventArgs e)
        {
            Session["CounterId"] = ddlCounter.SelectedValue;
            Session["ServiceType"] = ddlService.SelectedValue;

            string service = ddlService.SelectedValue;

            if (service == "Security")
            {
                Response.Redirect("SecurityDashboard.aspx");
            }
            else if (service == "Boarding")
            {
                Response.Redirect("BoardingDashboard.aspx");
            }
            else if (service == "Check-in")
            {
                Response.Redirect("BaggageDashboard.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}