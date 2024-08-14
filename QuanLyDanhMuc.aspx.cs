using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class QuanLyDanhMuc : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void xoaDM_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "xoaDM")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Category p = db.Category.Where(pr => pr.CategoryId == m).FirstOrDefault();
                db.Category.Remove(p);
                db.SaveChanges();
                GridViewDM.DataBind();
            }
        }

        protected void suaDM_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "suaDM")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Session["suaDM"] = m;
                Response.Redirect("SuaDanhMuc.aspx");
            }
        }
    }
}