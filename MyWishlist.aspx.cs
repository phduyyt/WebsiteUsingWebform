using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class MyWishlist : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["login"] != null)
                {
                    Customer cus = (Customer)Session["login"];
                    LoadCustomerData(cus.CustomerId);
                }
                else
                {
                    string script = "if(confirm('Bạn phải đăng nhập để xem danh sách yêu thích. Bạn có muốn đăng nhập ngay không?')) { window.location='Login.aspx'; }";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);

                }

            }
        }
        private void LoadCustomerData(int customerId)
        {

            var result = db.Customer
                                .Where(c => c.CustomerId == customerId)
                                .Select(c => new
                                {
                                    Customer = c,
                                    Products = c.Wishlist.Select(wish => new
                                    {
                                        wish.WishlistId,
                                        wish.ProductProduct.Image,
                                        ProductName = wish.ProductProduct.ProductName,
                                        Price = wish.ProductProduct.Price,
                                        Stock=wish.ProductProduct.Stock
                                    }).ToList()
                                })
                                .FirstOrDefault();

            if (result != null)
            {
                lblCustomer.Text = $"Customer: {result.Customer.Name}";

                gvWishlist.DataSource = result.Products;
                if (result.Products.Count == 0)
                {
                    lblCustomer.Text = "Wishlist is empty";
                }
                gvWishlist.DataBind();
            }
            else
            {
                lblCustomer.Text = "Customer not found.";
            }
        }

        protected void DeleteButton_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Wishlist w = db.Wishlist.Where(a => a.WishlistId == m).FirstOrDefault();
                db.Remove(w);
                db.SaveChanges();
            }
            Customer cus = (Customer)Session["login"];
            LoadCustomerData(cus.CustomerId);
        }

        protected void gvWishlist_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //gvWishlist.Rows[e.RowIndex].Visible = false;
        }

        protected void addCart_Command(object sender, CommandEventArgs e)
        {
            if (Session["login"] != null)
            {
                Customer cus = (Customer)Session["login"];
                Wishlist w = db.Wishlist.Where(a => a.WishlistId == Convert.ToInt32(e.CommandArgument)).FirstOrDefault();
                Product p = db.Product.Where(a => a.ProductId == w.ProductProductId).FirstOrDefault();
                Cart check = db.Cart.Where(c => c.CustomerCustomerId == cus.CustomerId && c.ProductProductId == p.ProductId).FirstOrDefault();
                if (check == null)
                {
                    Cart c = new Cart();
                    c.CustomerCustomerId = cus.CustomerId;
                    c.Quantity = 1;
                    c.ProductProductId = p.ProductId;
                    db.Add(c);
                    db.SaveChanges();
                }
                else
                {
                    check.Quantity += 1;
                    db.SaveChanges();
                }
                //db.Wishlist.Remove(w);
                db.SaveChanges();
            }
            else
            {
                string script = "if(confirm('Bạn phải đăng nhập để thêm sản phẩm vào giỏ hàng. Bạn có muốn đăng nhập ngay không?')) { window.location='Login.aspx'; }";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);
            }
        }
    }
}