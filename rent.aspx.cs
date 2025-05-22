using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Collections.Generic;
using System.Web.Services;
using System.IO;
using System.Web.UI.WebControls;
using System.Web;

namespace WebApplication1.VESTASIM
{
    public partial class Rent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ClientID"] != null)
                {
                    loginPanel.Visible = false; logoutPanel.Visible = true; btnAddProperty.Visible = true;
                }
                else
                {
                    loginPanel.Visible = true; logoutPanel.Visible = false; btnAddProperty.Visible = false;
                }
                BindProperties();
            }
        }

        private void BindProperties()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = @"SELECT p.PropertyID, p.Title, p.Description, p.Price, p.PropertyType, p.Status, p.Location,
                                     (SELECT TOP 1 ImagePath FROM PropertyImages pi WHERE pi.PropertyID = p.PropertyID) AS ImagePath
                                     FROM Properties p WHERE p.PropertyType = 'Rent' AND p.Status = 'Available'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    rptProperties.DataSource = reader;
                    rptProperties.DataBind();
                    reader.Close();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading properties: " + ex.Message;
                    lblMessage.CssClass = "error-message";
                }
            }
        }

        public List<object> GetImages(int propertyId)
        {
            List<object> images = new List<object>();
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT ImagePath FROM PropertyImages WHERE PropertyID = @PropertyID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@PropertyID", propertyId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        images.Add(new { ImagePath = reader["ImagePath"].ToString() });
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading images: " + ex.Message;
                    lblMessage.CssClass = "error-message";
                }
            }
            return images;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            StringBuilder resultsHtml = new StringBuilder();
            resultsHtml.Append("<label>Results:</label>");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT PropertyID, Title FROM Properties WHERE PropertyType = @Type AND Status = 'Available' AND (Title LIKE @SearchQuery OR Description LIKE @SearchQuery)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Type", "Rent");
                    cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");

                    SqlDataReader reader = cmd.ExecuteReader();
                    bool hasResults = false;

                    while (reader.Read())
                    {
                        int propertyId = reader.GetInt32(0);
                        string title = reader.GetString(1);
                        string modalId = "modal" + propertyId;

                        resultsHtml.AppendFormat("<div class='property-item' onclick=\"openModal('{0}', event)\">{1}</div>", modalId, title);
                        hasResults = true;
                    }

                    reader.Close();

                    if (string.IsNullOrEmpty(searchQuery) || !hasResults)
                    {
                        propertyResults.InnerHtml = "<div class='no-results-message'>No results</div>";
                        propertyResults.Attributes["class"] = "property-results-box visible no-results";
                    }
                    else
                    {
                        propertyResults.InnerHtml = resultsHtml.ToString();
                        propertyResults.Attributes["class"] = "property-results-box visible";
                    }
                }
                catch (Exception ex)
                {
                    propertyResults.InnerHtml = "<div class='no-results-message'>Error fetching properties: " + ex.Message + "</div>";
                    propertyResults.Attributes["class"] = "property-results-box visible no-results";
                }
            }
        }

        [WebMethod]
        public static List<object> GetProperties(string searchQuery)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            List<object> properties = new List<object>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT PropertyID, Title FROM Properties WHERE PropertyType = @Type AND Status = 'Available' AND (Title LIKE @SearchQuery OR Description LIKE @SearchQuery)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Type", "Rent");
                    cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");

                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        int propertyId = reader.GetInt32(0);
                        string title = reader.GetString(1);
                        string modalId = "modal" + propertyId;

                        properties.Add(new
                        {
                            title = title,
                            modalId = modalId
                        });
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception("Error fetching properties: " + ex.Message);
                }
            }
            return properties;
        }

        protected void btnAddProperty_Click(object sender, EventArgs e)
        {
            if (Session["ClientID"] == null)
            {
                Response.Redirect("Loginn.aspx");
                return;
            }
            crud_section.Visible = true;
            lblFormTitle.Text = "Add New Property";
            hfPropertyID.Value = "";
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtPrice.Text = "";
            ddlPropertyType.SelectedValue = "Rent";
            ddlStatus.SelectedValue = "Available";
            txtLocation.Text = "";
            lblMessage.Text = "";
            buysell.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid || Session["ClientID"] == null)
            {
                lblMessage.Text = "Please log in and fill all required fields.";
                lblMessage.CssClass = "error-message";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    int propertyId;
                    string query;
                    SqlCommand cmd;

                    if (string.IsNullOrEmpty(hfPropertyID.Value))
                    {
                        query = @"INSERT INTO Properties (Title, Description, Price, PropertyType, Status, Location, DatePosted)
                                   OUTPUT INSERTED.PropertyID
                                   VALUES (@Title, @Description, @Price, @PropertyType, @Status, @Location, GETDATE())";
                        cmd = new SqlCommand(query, conn);
                    }
                    else
                    {
                        propertyId = int.Parse(hfPropertyID.Value);
                        query = @"UPDATE Properties SET Title = @Title, Description = @Description, Price = @Price,
                                   PropertyType = @PropertyType, Status = @Status, Location = @Location
                                   WHERE PropertyID = @PropertyID";
                        cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@PropertyID", propertyId);
                    }

                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Price", decimal.Parse(txtPrice.Text.Trim()));
                    cmd.Parameters.AddWithValue("@PropertyType", ddlPropertyType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text.Trim());

                    if (string.IsNullOrEmpty(hfPropertyID.Value))
                    {
                        propertyId = (int)cmd.ExecuteScalar();
                    }
                    else
                    {
                        cmd.ExecuteNonQuery();
                        propertyId = int.Parse(hfPropertyID.Value);
                    }

                    if (fuImages.HasFiles)
                    {
                        if (!string.IsNullOrEmpty(hfPropertyID.Value))
                        {
                            string deleteQuery = "DELETE FROM PropertyImages WHERE PropertyID = @PropertyID";
                            SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn);
                            deleteCmd.Parameters.AddWithValue("@PropertyID", propertyId);
                            deleteCmd.ExecuteNonQuery();
                        }

                        foreach (HttpPostedFile file in fuImages.PostedFiles)
                        {
                            if (file.ContentLength > 0)
                            {
                                string fileName = Path.GetFileName(file.FileName);
                                string filePath = "IMG/" + propertyId + fileName;
                                file.SaveAs(Server.MapPath(filePath));

                                string imageQuery = "INSERT INTO PropertyImages (PropertyID, ImagePath) VALUES (@PropertyID, @ImagePath)";
                                SqlCommand imageCmd = new SqlCommand(imageQuery, conn);
                                imageCmd.Parameters.AddWithValue("@PropertyID", propertyId);
                                imageCmd.Parameters.AddWithValue("@ImagePath", filePath);
                                imageCmd.ExecuteNonQuery();
                            }
                        }
                    }

                    lblMessage.Text = string.IsNullOrEmpty(hfPropertyID.Value) ? "Property added successfully!" : "Property updated successfully!";
                    lblMessage.CssClass = "success-message";
                    crud_section.Visible = false;
                    buysell.Visible = true;
                    BindProperties();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error saving property: " + ex.Message;
                    lblMessage.CssClass = "error-message";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            crud_section.Visible = false;
            buysell.Visible = true;
            lblMessage.Text = "";
        }

        protected void rptProperties_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["ClientID"] == null)
            {
                Response.Redirect("Loginn.aspx");
                return;
            }

            int propertyId = int.Parse(e.CommandArgument.ToString());
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            if (e.CommandName == "Edit")
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    try
                    {
                        conn.Open();
                        string query = "SELECT Title, Description, Price, PropertyType, Status, Location FROM Properties WHERE PropertyID = @PropertyID";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@PropertyID", propertyId);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            crud_section.Visible = true;
                            lblFormTitle.Text = "Edit Property";
                            hfPropertyID.Value = propertyId.ToString();
                            txtTitle.Text = reader["Title"].ToString();
                            txtDescription.Text = reader["Description"].ToString();
                            txtPrice.Text = reader["Price"].ToString();
                            ddlPropertyType.SelectedValue = reader["PropertyType"].ToString();
                            ddlStatus.SelectedValue = reader["Status"].ToString();
                            txtLocation.Text = reader["Location"].ToString();
                            buysell.Visible = false;
                            lblMessage.Text = "";
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error loading property: " + ex.Message;
                        lblMessage.CssClass = "error-message";
                    }
                }
            }
            else if (e.CommandName == "Delete")
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    try
                    {
                        conn.Open();
                        string query = "DELETE FROM PropertyImages WHERE PropertyID = @PropertyID";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@PropertyID", propertyId);
                        cmd.ExecuteNonQuery();

                        query = "DELETE FROM Properties WHERE PropertyID = @PropertyID";
                        cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@PropertyID", propertyId);
                        cmd.ExecuteNonQuery();

                        lblMessage.Text = "Property deleted successfully!";
                        lblMessage.CssClass = "success-message";
                        BindProperties();
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error deleting property: " + ex.Message;
                        lblMessage.CssClass = "error-message";
                    }
                }
            }
        }
    }
}
