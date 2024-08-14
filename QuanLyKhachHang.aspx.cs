using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class QuanLyKhachHang : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void xoaKH_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "xoaKH")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Customer c = db.Customer.Where(cus => cus.CustomerId == m).FirstOrDefault();
                db.Customer.Remove(c);
                db.SaveChanges();
                GridView1.DataBind();
            }
        }

        protected void suaKH_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "suaKH")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Session["suaKH"] = m;
                Response.Redirect("SuaKhachHang.aspx");
            }
        }
    }
}