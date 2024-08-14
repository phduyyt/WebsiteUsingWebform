using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var cus = db.Customer.FirstOrDefault(p => p.Email == txtEmail.Text && p.Password == txtPassword.Text);
            if (cus != null)
            {
                Session["login"] = cus;
                Response.Redirect("Home.aspx");
                msgLogin.Text = "";
            }
            else
            {
                msgLogin.Text = "Tên đăng nhập hoặc mật khẩu không đúng!!!";
            }
        }
    }
}