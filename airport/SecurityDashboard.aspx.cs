using System; // for basic c# stuff like Convert.ToInt32()
using System.Data; // for database related objects like Datatable and CommandType.StoredProcedure
using System.Data.SqlClient; // for SQL Server
using System.Configuration; // for ConfigurationManager, to read Web.config
using System.Web.UI; // for Page

namespace airport
{
    public partial class SecurityDashboard : Page
    {
        string connString = ConfigurationManager.ConnectionStrings["SmartAirportQueueDB"].ConnectionString; // get db connection info from Web.config


        protected void Page_Load(object sender, EventArgs e) // runs whenever page loads
        {
            if (Session["UserId"] == null) // for auth; if user not logged in, redirect to login page
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack) // this section populates dashboard; runs only on first page load
            {
                LoadStats(); // calculates waiting, serving, completed tickets

                LoadNowServing(); // loads passenger served by current counter

                LoadQueue(); // loads GridView data
            }
        }



        void LoadStats()
        {
            SqlConnection conn = new SqlConnection(connString);

            conn.Open();


            // service-wide waiting count

            SqlCommand waiting = new SqlCommand("SELECT COUNT(*) FROM QueueTickets WHERE ServiceType=@ServiceType AND Status='Waiting'", conn);

            waiting.Parameters.AddWithValue("@ServiceType", Session["ServiceType"]);

            lblWaiting.Text = waiting.ExecuteScalar().ToString();



            // service-wide serving count

            SqlCommand serving = new SqlCommand("SELECT COUNT(*) FROM QueueTickets WHERE ServiceType=@ServiceType AND Status='Served'", conn);

            serving.Parameters.AddWithValue("@ServiceType", Session["ServiceType"]);

            lblServing.Text = serving.ExecuteScalar().ToString();



            // service-wide completed count

            SqlCommand completed = new SqlCommand("SELECT COUNT(*) FROM QueueTickets WHERE ServiceType=@ServiceType AND Status='Completed'", conn);

            completed.Parameters.AddWithValue("@ServiceType", Session["ServiceType"]);

            lblCompleted.Text = completed.ExecuteScalar().ToString();


            conn.Close();
        }




        void LoadNowServing()
        {
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand(
            "SELECT TOP 1 TicketId,QueueNumber FROM QueueTickets WHERE Status='Served' AND CounterId=@CounterId ORDER BY CreatedAt DESC",
            conn);

            cmd.Parameters.AddWithValue("@CounterId", Session["CounterId"]);

            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblCurrent.Text = reader["QueueNumber"].ToString();

                Session["CurrentTicketId"] = reader["TicketId"];

                btnNext.Enabled = false;
                btnComplete.Enabled = true;
            }

            else
            {
                lblCurrent.Text = "_";

                Session["CurrentTicketId"] = null;

                btnNext.Enabled = true;
                btnComplete.Enabled = false;
            }

            conn.Close();
        }




        void LoadQueue()
        {
            SqlConnection conn = new SqlConnection(connString);

            // queue shared across same service

            SqlCommand cmd = new SqlCommand("SELECT QueueNumber, Status, CreatedAt FROM QueueTickets WHERE ServiceType=@ServiceType", conn);

            cmd.Parameters.AddWithValue("@ServiceType", Session["ServiceType"]);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            sda.Fill(dt);

            GridView1.DataSource = dt;

            GridView1.DataBind();
        }





        protected void btnNext_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("CallNextPassenger", conn);

            cmd.CommandType = CommandType.StoredProcedure;


            // pass selected service + selected counter

            cmd.Parameters.AddWithValue("@ServiceType", Session["ServiceType"]);

            cmd.Parameters.AddWithValue("@CounterId", Session["CounterId"]);


            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();


            Response.Redirect(Request.RawUrl);
        }




        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Session["CurrentTicketId"] == null)
                return;


            int ticketId = Convert.ToInt32(Session["CurrentTicketId"]);

            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("CompleteService", conn);

            cmd.CommandType = CommandType.StoredProcedure;


            // complete currently served ticket

            cmd.Parameters.AddWithValue("@TicketId", ticketId);


            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();


            Response.Redirect(Request.RawUrl);
        }




        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            Response.Redirect("Login.aspx");
        }
    }
}