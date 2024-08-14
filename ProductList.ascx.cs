using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class ProductList : System.Web.UI.UserControl
    {
        BaiTapLonContext db = new BaiTapLonContext();
        private string _img;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addCart_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "addCart")
            {
                if (Session["login"] != null)
                {
                    Customer cus = (Customer)Session["login"];
                    int productId = Convert.ToInt32(e.CommandArgument);
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
        }

        protected void viewDetail_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "viewDetail")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Session["viewId"] = m;
                Response.Redirect("ViewDetail.aspx");
            }
        }

        protected void addWishlist_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "addWishlist")
            {
                if (Session["login"] != null)
                {
                    Customer cus = (Customer)Session["login"];
                    int productId = Convert.ToInt32(e.CommandArgument);
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

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Image spanSpImage = (Image)e.Item.FindControl("span_sp");
                if (spanSpImage != null)
                {
                    spanSpImage.ImageUrl = _img;
                }
            }
        }

        public void SetImage(string img)
        {
            _img = img;
        }

        public void BindData(int categoryId)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [Product] WHERE [Category_catego] = " + categoryId;
        }

        public void BindData(string sql)
        {
            SqlDataSource1.SelectCommand = sql;
        }

        public void RemovePager()
        {
            DataPager pager = (DataPager)ListView1.FindControl("DataPager1");
           
            // Kiểm tra xem tham chiếu có hợp lệ không
            if (pager != null)
            {
                pager.PageSize = 100;
            }
        }
    }
}
