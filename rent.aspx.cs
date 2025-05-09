using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;


namespace WebApplication1.VESTASIM
{
    public partial class Rent : Page
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


            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT * FROM Properties WHERE Name LIKE @SearchQuery OR Description LIKE @SearchQuery";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");

                SqlDataReader reader = cmd.ExecuteReader();

                // Bind the data to the GridView
                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
        }
    }
}


