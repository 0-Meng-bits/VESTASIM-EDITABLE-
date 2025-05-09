using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace WebApplication1.VESTASIM
{
    public partial class buy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ClientID"] != null)
                {
                    loginPanel.Visible = false;
                    logoutPanel.Visible = true;
                }
                else
                {
                    loginPanel.Visible = true;
                    logoutPanel.Visible = false;
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();

            // Get the connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            StringBuilder resultsHtml = new StringBuilder(); // This will build the list of properties
            resultsHtml.Append("<label>Results:</label>");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Title FROM Properties WHERE Title LIKE @SearchQuery OR Description LIKE @SearchQuery";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string title = reader["Title"].ToString();
                    resultsHtml.AppendFormat("<div class='property-item'>{0}</div>", title); // Add each property as a div in the list
                }
            }

            // Set the inner HTML of the propertyResults div to display the search results
            propertyResults.InnerHtml = resultsHtml.ToString();
        }
    }
}
