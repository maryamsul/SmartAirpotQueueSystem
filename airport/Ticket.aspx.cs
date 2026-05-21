using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace airport
{
    public partial class Ticket : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["SmartAirportQueueDB"].ConnectionString;

        private SqlConnection GetConnection()
        {
            return new SqlConnection(cs);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = "";
            if (!IsPostBack)
            {
                HandleTicketFlow();
            }
        }
        private void HandleTicketFlow()
        {
            //reads params from query in URL  
            string flightCode = Request.QueryString["flight"];
            string serviceType = Request.QueryString["service"];

            if (string.IsNullOrWhiteSpace(flightCode))
            {
                ShowError("No Flight Selected");
                return;
            }

            serviceType = NormalizeServiceType(serviceType);
            if (HasActiveTicket(flightCode))
            {
                LoadExistingTicket(flightCode);
                pnlActiveTicket.Visible = true;
                ShowError("You already have an active ticket for this flight.");
                return;
            }
            GenerateTicket(flightCode, serviceType);
        }

        private string NormalizeServiceType(string serviceType)
        {
            if (serviceType == "Check-in" || serviceType == "Security" || serviceType == "Boarding")
                return serviceType;

            return "Check-in";
        }

        private bool HasActiveTicket(string flightCode)
        {
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 TicketId FROM QueueTickets WHERE FlightCode = @FlightCode AND Status IN ('Waiting','Served')", conn);
                cmd.Parameters.AddWithValue("@FlightCode", flightCode);
                using (SqlDataReader r = cmd.ExecuteReader())
                {
                    return r.HasRows;
                }
            }
        }

        private string GetFlightNumber(string flightCode)
        {
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(" SELECT FlightNumber FROM Flights WHERE FlightCode = @FlightCode", conn);
                cmd.Parameters.AddWithValue("@FlightCode", flightCode);
                object result = cmd.ExecuteScalar();
                return result?.ToString();
            }
        }

        private void LoadExistingTicket(string flightCode)
        {
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(@"
                    SELECT TOP 1 *
                    FROM QueueTickets
                    WHERE FlightCode = @FlightCode
                    AND Status IN ('Waiting','Served')
                    ORDER BY TicketId DESC", conn);

                cmd.Parameters.AddWithValue("@FlightCode", flightCode);

                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read())
                    {
                        UpdateUI(rdr["QueueNumber"].ToString(),
                                 rdr["ServiceType"].ToString(),
                                 rdr["EstimatedTime"].ToString());

                        pnlActiveTicket.Visible = true;
                    }
                }
            }
        }

        private void GenerateTicket(string flightCode, string serviceType)
        {
            string flightNumber = GetFlightNumber(flightCode);

            if (string.IsNullOrEmpty(flightNumber))
            {
                ShowError("Invalid Flight Code");
                return;
            }

            using (SqlConnection conn = GetConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("CreateQueueTicket", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ServiceType", serviceType);
                cmd.Parameters.AddWithValue("@FlightCode", flightCode);
                cmd.Parameters.AddWithValue("@FlightNumber", flightNumber);

                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read())
                    {
                        string status = rdr["Status"].ToString();

                        if (status == "EXISTS")
                        {
                            LoadExistingTicket(flightCode);
                            ShowError("You already have an active ticket for this flight.");
                            return;
                        }

                        UpdateUI(rdr["QueueNumber"].ToString(),
                                 serviceType,
                                 rdr["EstimatedTime"].ToString());

                        pnlActiveTicket.Visible = true;
                    }
                }
            }
        }

        private void UpdateUI(string queueNumber, string serviceType, string estimatedTime)
        {
            lblTicket.Text = queueNumber;
            litService.Text = serviceType;
            litWait.Text = estimatedTime + " mins";

            lblActiveTicket.Text =
                "Active ticket:<br/>" + queueNumber + " (" + serviceType + ")";
        }

        protected void btnCancelTicket_Click(object sender, EventArgs e)
        {
            string ticket = lblTicket.Text;

            if (string.IsNullOrEmpty(ticket) || ticket == "---")
                return;

            using (SqlConnection conn = GetConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(@"
                    UPDATE QueueTickets
                    SET Status = 'Cancelled'
                    WHERE QueueNumber = @QueueNumber", conn);

                cmd.Parameters.AddWithValue("@QueueNumber", ticket);
                cmd.ExecuteNonQuery();
            }

            ResetUI();
        }

        private void ResetUI()
        {
            pnlActiveTicket.Visible = false;

            lblTicket.Text = "---";
            litService.Text = "";
            litWait.Text = "";

            btnAction.Text = "Take Another Ticket";
            btnAction.OnClientClick = "window.location='Default.aspx'; return false;";
        }

        protected void btnAction_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "print",
                "window.print();",
                true
            );
        }

        private void ShowError(string message)
        {
            lblError.Text = message;
        }
    }
}