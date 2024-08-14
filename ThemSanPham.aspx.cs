using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class ThemSanPham : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataSource = db.Category.ToList();
                DropDownList1.DataValueField = "CategoryId";
                DropDownList1.DataTextField = "Name";
                DataBind();
            }
        }



        protected void InsertButton_Command(object sender, CommandEventArgs e)
        {
            String path = Server.MapPath("~/Image/");
            FileUpLoad1.PostedFile.SaveAs(path + FileUpLoad1.FileName);
            try
            {
                Product p = new Product();
                p.ProductName = product_nameTextBox.Text;
                p.Description = descriptionTextBox.Text;
                p.Price = int.Parse(priceTextBox.Text);
                p.Stock = int.Parse(stockTextBox.Text);
                p.CategoryCatego = int.Parse(DropDownList1.SelectedValue);
                p.Publish = publishTextBox.Text;
                p.Author = authorTextBox.Text;
                p.ProductDate = DateTime.Parse(product_dateTextBox.Text);
                p.Image = FileUpLoad1.FileName;
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

    
