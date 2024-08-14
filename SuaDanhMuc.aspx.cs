using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class SuaDanhMuc : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int m = (int)Session["suaDM"];
                Category p = db.Category.Where(a => a.CategoryId == m).FirstOrDefault();
                publishTextBox.Text = p.CategoryId.ToString();
                category_nameTextBox.Text = p.Name;
                DataBind();
            }
        }
        protected void editButton_Command(object sender, CommandEventArgs e)
        {

            try
            {
                int m = (int)Session["suaDM"];
                Category p = db.Category.Where(a => a.CategoryId == m).FirstOrDefault();
                p.Name = category_nameTextBox.Text;
                db.SaveChanges();
                erradddm.Text = "Sửa thành công";
            }
            catch (Exception ex)
            {

                erradddm.Text = "Có lỗi: " + ex.Message;
            }
        }
    }
}