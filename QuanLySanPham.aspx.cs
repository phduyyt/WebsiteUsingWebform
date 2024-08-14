using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{

    public partial class QuanLySanPham : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void xoaSP_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "xoaSP")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Product p = db.Product.Where(pr => pr.ProductId == m).FirstOrDefault();
                db.Product.Remove(p);
                db.SaveChanges();
                GridView1.DataBind();
            }
        }

        protected void suaSP_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "suaSP")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Session["suaSP"] = m;
                Response.Redirect("SuaSanPham.aspx");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand=($@"SELECT * 
                        FROM Product 
                        WHERE LOWER(product_name) LIKE N'%{txtSearch.Text.ToLower()}%';
                        ");
        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = (@"SELECT * 
                        FROM Product");
            txtSearch.Text = "";
        }
    }
}