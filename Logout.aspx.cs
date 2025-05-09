using System;

namespace YourProject
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear the session and redirect to home page
            Session.Clear();
            Session.Abandon();
            Response.Redirect("home.aspx");
        }
    }
}
