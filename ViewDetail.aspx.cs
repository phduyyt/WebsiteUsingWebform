using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class ViewDetail : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                int m = (int)Session["viewId"];
                Product p = db.Product.Include(c => c.CategoryCategoNavigation).FirstOrDefault(a => a.ProductId == m);
                txtName.Text = p.ProductName;
                txtDescription.Text ="Mô tả: "+ p.Description;
                txtPrice.Text ="Giá: "+ string.Format("{0:N0} VNĐ", p.Price);
                txtPublish.Text ="Nhà sản xuất: "+ p.Publish;
                txtAuthor.Text ="Tác giả: "+ p.Author;
                txtYear.Text ="Ngày xuất bản: "+ $"{p.ProductDate:d/M/yyyy}";
                txtStock.Text = p.Stock.ToString();
                image1.ImageUrl = "~/Image/"+p.Image;
                int id = p.CategoryCategoNavigation.CategoryId;
                ProductList1.BindData(id);
            }
        }

        protected void addCart_Click(object sender, EventArgs e)
        {
            if (Session["login"] != null)
            {
                Customer cus = (Customer)Session["login"];
                int productId = (int)Session["viewId"];
                Cart check = db.Cart.Where(c => c.CustomerCustomerId == cus.CustomerId && c.ProductProductId == productId).FirstOrDefault();
                if (check == null)
                {
                    Cart c = new Cart();
                    c.CustomerCustomerId = cus.CustomerId;
                    c.Quantity = 1;
                    c.ProductProductId = productId;
                    db.Add(c);
                    db.SaveChanges();
                }
                else
                {
                    check.Quantity += 1;
                    db.SaveChanges();
                }
            }
            else
            {
                string script = "if(confirm('Bạn phải đăng nhập để thêm sản phẩm vào giỏ hàng. Bạn có muốn đăng nhập ngay không?')) { window.location='Login.aspx'; }";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);
            }
        }

        protected void addWish_Click(object sender, EventArgs e)
        {
            {
                if (Session["login"] != null)
                {
                    Customer cus = (Customer)Session["login"];
                    int productId = (int)Session["viewId"];
                    Wishlist wishlist = db.Wishlist.Where(w => w.CustomerCustomerId == cus.CustomerId && w.ProductProductId == productId).FirstOrDefault();
                    if (wishlist == null)
                    {
                        Wishlist w = new Wishlist();
                        w.CustomerCustomerId = cus.CustomerId;
                        w.ProductProductId = productId;
                        db.Add(w);
                        db.SaveChanges();
                    }
                }
                else
                {
                    string script = "if(confirm('Bạn phải đăng nhập để thêm sản phẩm vào danh sách yêu thích. Bạn có muốn đăng nhập ngay không?')) { window.location='Login.aspx'; }";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);
                }
            }
        }
    }
}