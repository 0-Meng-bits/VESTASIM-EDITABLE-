using System;
using System.Data.SqlClient;
using System.Configuration;

namespace YourProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If the user is logged in, redirect to the home page
            if (Session["isLoggedIn"] != null && (bool)Session["isLoggedIn"] == true)
            {
                Response.Redirect("home.aspx");
            }
        }

        // Handle login button click
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim(); // Use hashed passwords in production

            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT ClientID FROM client WHERE clientNAME = @email AND Password = @password";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password); // Hash this in production

                conn.Open();
                object clientId = cmd.ExecuteScalar();

                if (clientId != null)
                {
                    // Set session variables upon successful login
                    Session["isLoggedIn"] = true;

                    Session["ClientID"] = clientId.ToString();
                    Session["ClientNAME"] = email;
                    // Redirect to home page
                    Response.Redirect("home.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }
            }
        }
    }
}
