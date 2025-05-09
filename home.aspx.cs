using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;


namespace WebApplication1.VESTASIM
{
    public partial class home : Page
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
