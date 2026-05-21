using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airport
{
    public partial class Display : Page
    {
        private readonly string connString =
            ConfigurationManager.ConnectionStrings["SmartAirportQueueDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefreshQueueDisplay();
            }
        }

        protected void TimerRefresh_Tick(object sender, EventArgs e)
        {
            RefreshQueueDisplay();
        }
        
        private void LoadQueue(string category, Label lblCurrent, Label lblNext, Label lblWait)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

               
                SqlCommand cmdCurrent = new SqlCommand(@" SELECT TOP 1 QueueNumber FROM QueueTickets WHERE ServiceType = @Category AND Status = 'Served'  ORDER BY CreatedAt DESC", conn);

                cmdCurrent.Parameters.AddWithValue("@Category", category);

                object current = cmdCurrent.ExecuteScalar();
                lblCurrent.Text = current != null ? current.ToString() : "None";

                
                SqlCommand cmdNext = new SqlCommand(@" SELECT TOP 1 QueueNumber FROM QueueTickets WHERE ServiceType = @Category AND Status = 'Waiting'  ORDER BY CreatedAt ASC", conn);

                cmdNext.Parameters.AddWithValue("@Category", category);

                object next = cmdNext.ExecuteScalar();
                lblNext.Text = next != null ? next.ToString() : "None";

               
                SqlCommand cmdCount = new SqlCommand("SELECT COUNT(*) FROM QueueTickets WHERE ServiceType = @Category  AND Status = 'Waiting' ", conn);

                cmdCount.Parameters.AddWithValue("@Category", category);

                int waitingCount = (int)cmdCount.ExecuteScalar();
                lblWait.Text = waitingCount + " waiting";
            }
        }
        private void RefreshQueueDisplay()
        {
            LoadQueue("Check-in", lblBaggageCurrent, lblBaggageNext, lblBaggageWait);
            LoadQueue("Security", lblSecurityCurrent, lblSecurityNext, lblSecurityWait);
            LoadQueue("Boarding", lblBoardingCurrent, lblBoardingNext, lblBoardingWait);
        }
    }
}