<%@ Application Language="C#" %>

<script runat="server">


    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Check-in queue state
            Application["StartTime_Checkin"] = DateTime.Now;

            // Security queue state
            Application["StartTime_Security"] = DateTime.Now;

            // Boarding queue state
            Application["StartTime_Boarding"] = DateTime.Now;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Optional: per-user session logic (not required here)
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
        }

        protected void Application_End(object sender, EventArgs e)
        {
       }
}
    </script>