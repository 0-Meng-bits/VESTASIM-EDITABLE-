using System;
using System.Web.UI;

namespace VestaSim
{
    public partial class team : Page
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
    }
}
