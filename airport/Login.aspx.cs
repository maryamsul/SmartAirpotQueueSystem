using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace airport
{
    public partial class Login : Page
    {

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;


            string connString = ConfigurationManager.ConnectionStrings["SmartAirportQueueDB"].ConnectionString; // read connection string from Web.config


            SqlConnection conn = new SqlConnection(connString); // create SQL connection


            string query = "SELECT UserId, Role FROM Users WHERE Email=@Email AND PasswordHash=@Password"; // query search Users table for matching email and password

            SqlCommand cmd = new SqlCommand(query, conn); // create SQL command (query + DB connection)

             
            cmd.Parameters.AddWithValue("@Email", email); // replace parameters to prevent SQL injection

            cmd.Parameters.AddWithValue("@Password", password);

            conn.Open(); // open connection (starts actual connection to SQL Server)

            SqlDataReader reader = cmd.ExecuteReader(); // execute query


            if (reader.Read()) // check if row exists
            {
                Session["UserId"] = reader["UserId"]; // if yes, create session

                Session["Role"] = reader["Role"];


                Response.Redirect("StaffDashboard.aspx"); // and redirect
            }

            else
            {
                lblError.Text = "Wrong credentials"; // if not, display error message
            }


            conn.Close(); // close connection
        }
    }
}