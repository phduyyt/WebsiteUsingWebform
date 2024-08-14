using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class ThemDanhMuc : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void InsertButton_Command(object sender, CommandEventArgs e)
        {
            
            try
            {
                Category p = new Category();
                p.CategoryId = int.Parse(category_idTextBox.Text);
                p.Name = category_nameTextBox.Text;              
                db.Add(p);
                db.SaveChanges();
                erraddsp.Text = "Thêm thành công";
            }
            catch (Exception ex)
            {
                erraddsp.Text = "Có lỗi: " + ex.Message;
            }
        }
    }
}