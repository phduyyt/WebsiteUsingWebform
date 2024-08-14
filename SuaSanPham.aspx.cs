using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class SuaSanPham : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int m = (int)Session["suaSP"];
                Product p=db.Product.Where(a => a.ProductId == m).FirstOrDefault();
                product_nameTextBox.Text = p.ProductName;
                descriptionTextBox.Text = p.Description;
                priceTextBox.Text = p.Price.ToString();
                stockTextBox.Text = p.Stock.ToString();
                publishTextBox.Text = p.Publish;
                authorTextBox.Text = p.Author;
                product_dateTextBox.Text = $"{p.ProductDate:d/M/yyyy}";
                DropDownList1.DataSource = db.Category.ToList();
                DropDownList1.DataValueField = "CategoryId";
                DropDownList1.DataTextField = "Name";
                DataBind();
                DropDownList1.SelectedValue = p.CategoryCatego.ToString();

            }
        }
        protected void editButton_Command(object sender, CommandEventArgs e)
        {
            
            try
            {
                int m = (int)Session["suaSP"];
                Product p = db.Product.Where(a => a.ProductId == m).FirstOrDefault();
                p.ProductName = product_nameTextBox.Text;
                p.Description = descriptionTextBox.Text;
                p.Price = int.Parse(priceTextBox.Text);
                p.Stock = int.Parse(stockTextBox.Text);
                p.CategoryCatego = int.Parse(DropDownList1.SelectedValue);
                p.Publish = publishTextBox.Text;
                p.Author = authorTextBox.Text;
                p.ProductDate = DateTime.Parse(product_dateTextBox.Text);
                if (FileUpLoad1.FileName !="")
                {
                    String path = Server.MapPath("~/Image/");
                    FileUpLoad1.PostedFile.SaveAs(path + FileUpLoad1.FileName);
                    p.Image = FileUpLoad1.FileName;
                }
                db.SaveChanges();
                errsuasp.Text = "Sửa thành công";
            }
            catch (Exception ex)
            {

                errsuasp.Text = "Có lỗi: " + ex.Message;
            }
        }
    }

}