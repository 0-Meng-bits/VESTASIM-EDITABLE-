using System;
using System.Data.SqlClient;
using System.Configuration;

namespace YourProject
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void btnSignup_Click(object sender, EventArgs e)
        {

            if (!chkPolicy.Checked)
            {
                lblMessage.Text = "You must agree to the Terms & Conditions to sign up.";
                return;
            }


            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim(); // Optional: hash this in production

            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Check if email already exists
                string checkQuery = "SELECT COUNT(*) FROM client WHERE clientNAME = @email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@email", email);
                int exists = (int)checkCmd.ExecuteScalar();

                if (exists > 0)
                {
                    lblMessage.Text = "Email already registered.";
                    return;
                }

                // Insert new record
                string insertQuery = "INSERT INTO client (clientNAME, Password) VALUES (@email, @password)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                insertCmd.Parameters.AddWithValue("@email", email);
                insertCmd.Parameters.AddWithValue("@password", password);

                int result = insertCmd.ExecuteNonQuery();
                if (result > 0)
                {
                    
                    Response.Redirect("Loginn.aspx");
                }
                else
                {
                    lblMessage.Text = "Something went wrong. Please try again.";
                }
            }
        }
    }
}
