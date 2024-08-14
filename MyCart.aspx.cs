using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class MyCart : System.Web.UI.Page
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
                    string script = "if(confirm('Bạn phải đăng nhập để xem giỏ hàng. Bạn có muốn đăng nhập ngay không?')) { window.location='Login.aspx'; }";
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
                                        Products = c.Cart.Select(cart => new
                                        {
                                            cart.CartId,
                                            cart.ProductProduct.Image,
                                            ProductName = cart.ProductProduct.ProductName,
                                            Price = cart.ProductProduct.Price,
                                            cart.Quantity,
                                            Total=cart.Quantity*cart.ProductProduct.Price
                                        }).ToList()
                                    })
                                    .FirstOrDefault();

                if (result != null)
                {
                    lblCustomer.Text = $"Customer: {result.Customer.Name}";

                    gvProducts.DataSource = result.Products;
                    if (result.Products.Count == 0)
                    {
                    lblCustomer.Text = "Cart is empty";
                }
                    gvProducts.DataBind();
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
                Cart c = db.Cart.Where(a=>a.CartId==m).FirstOrDefault();
                db.Remove(c);
                db.SaveChanges();
            }
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            gvProducts.Rows[e.RowIndex].Visible = false;
        }
        protected void checkout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }

        protected void btnIncrease_Command(object sender, CommandEventArgs e)
        {
            Button btn = (Button)sender;
            Customer cus = (Customer)Session["login"];
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Label lblQuantity = (Label)row.FindControl("lblQuantity");

            if (e.CommandName== "Increase")
            {
                Cart c = db.Cart.Where(a=>a.CartId==Convert.ToInt32(e.CommandArgument)).FirstOrDefault();
                c.Quantity++;
                lblQuantity.Text = c.Quantity.ToString();
                db.SaveChanges();
                LoadCustomerData(cus.CustomerId);
            }
        }

        protected void btnDecrease_Command(object sender, CommandEventArgs e)
        {
            Button btn = (Button)sender;

            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Label lblQuantity = (Label)row.FindControl("lblQuantity");
            Customer cus = (Customer)Session["login"];
            if (e.CommandName == "Decrease")
            {
                Cart c = db.Cart.Where(a => a.CartId == Convert.ToInt32(e.CommandArgument)).FirstOrDefault();
                if (c.Quantity > 1)
                {
                    c.Quantity--;
                }
                
                lblQuantity.Text = c.Quantity.ToString();
                db.SaveChanges();
                LoadCustomerData(cus.CustomerId);
            }
        }

       
        
    }
}