using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace airport
{
    public partial class FlightCheck : System.Web.UI.Page
    {
        private string connStr =
            ConfigurationManager.ConnectionStrings["SmartAirportQueueDB"].ConnectionString;

        private string ServiceType
        {
            get
            {
                if (ViewState["ServiceType"] != null)
                    return ViewState["ServiceType"].ToString();

                return null;
            }
            set {ViewState["ServiceType"] = value;}
        }

        private bool IsFlightVerified
        {
            get
            {
                return ViewState["IsFlightVerified"] != null && (bool)ViewState["IsFlightVerified"];
            }
            set { ViewState["IsFlightVerified"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ServiceType = Request.QueryString["service"];
                pnlFlightCode.Visible = false;
                IsFlightVerified = false;
            }
            else
            {
                pnlFlightCode.Visible = IsFlightVerified;
            }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            string flightNumber = txtFlightNumber.Text.Trim();

            if (string.IsNullOrWhiteSpace(flightNumber))
            {
                lblMessage.Text = "Please enter Flight Number";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            if (IsValidFlightNumber(flightNumber))
            {
                lblMessage.Text = "Flight verified successfully!";
                lblMessage.ForeColor = Color.Green;

                pnlFlightCode.Visible = true;
                IsFlightVerified = true;
            }
            else
            {
                lblMessage.Text = "Invalid Flight Number!";
                lblMessage.ForeColor = Color.Red;

                pnlFlightCode.Visible = false;
                IsFlightVerified = false;
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string flightNumber = txtFlightNumber.Text.Trim();
            string flightCode = txtFlightCode.Text.Trim();

            if (string.IsNullOrWhiteSpace(flightCode))
            {
                lblMessage.Text = "Please enter Flight Code";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            if (!IsValidFlightNumber(flightNumber))
            {
                lblMessage.Text = "Invalid Flight Number!";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            if (!IsValidFlightMatch(flightNumber, flightCode))
            {
                lblMessage.Text = "INVALID!!";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            lblMessage.Text = "Flight verified successfully!";
            lblMessage.ForeColor = Color.Green;

            IsFlightVerified = false;

            Response.Redirect("Ticket.aspx?flight=" + flightCode + "&service=" + ServiceType);
        }

        private bool IsValidFlightNumber(string flightNumber)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Flights WHERE FlightNumber = @FlightNumber", conn))
                {
                    cmd.Parameters.AddWithValue("@FlightNumber", flightNumber);

                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
                }
            }
            catch
            {
                return false;
            }
        }

        // Check BOTH belong to same row
        private bool IsValidFlightMatch(string flightNumber, string flightCode)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Flights WHERE FlightNumber = @FlightNumber AND FlightCode = @FlightCode", conn))
                {
                    cmd.Parameters.AddWithValue("@FlightNumber", flightNumber);
                    cmd.Parameters.AddWithValue("@FlightCode", flightCode);

                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
                }
            }
            catch
            {
                return false;
            }
        }
    }
}