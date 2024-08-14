using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class sub : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"]!=null)
                {
                    Customer c = (Customer)Session["Login"];
                    loginPanel.Visible = false;
                    logoutPanel.Visible = true;
                    if (c.Role == "admin")
                    {
                        admin.Visible = true;
                    }
                    else
                    {
                        admin.Visible = false;
                    }
                    hello.Text = "Xin chào " + c.Role + " " + c.Name;
                }
                else
                {
                    loginPanel.Visible = true;
                    logoutPanel.Visible = false;
                    admin.Visible = false;
                    hello.Text = "";
                }
            }
        }

        protected void logoutLink_Click(object sender, EventArgs e)
        {
            Session["Login"] = null;
            Response.Redirect("Home.aspx");
        }
    }
}