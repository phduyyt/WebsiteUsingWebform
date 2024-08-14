using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class Checkout : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Customer cus = (Customer)Session["login"];
                txtname.Text = cus.Name;
                txtsdt.Text = cus.PhoneNumber;
                phuongthuctt.Items.Add("Thanh toán khi nhận hàng");
                phuongthuctt.Items.Add("Thanh toán qua ngân hàng");
                var result = db.Customer
                                   .Where(c => c.CustomerId == cus.CustomerId)
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
                                           Total = cart.Quantity * cart.ProductProduct.Price
                                       }).ToList()
                                   })
                                   .FirstOrDefault();
                gvProducts.DataSource = result.Products;
                gvProducts.DataBind();
            }
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            Customer cus = (Customer)Session["login"];
            var result = db.Customer
                                   .Where(c => c.CustomerId == cus.CustomerId)
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
                                           Total = cart.Quantity * cart.ProductProduct.Price
                                       }).ToList()
                                   })
                                   .FirstOrDefault();

            Shipment s = new Shipment();
            s.State = "1";
            s.Address = txtaddress.Text;
            s.CustomerCustom = cus.CustomerId;
            db.Add(s);
            db.SaveChanges();

            Payment pay = new Payment();
            pay.PaymentDate = DateTime.Now;
            pay.PaymentMethod = phuongthuctt.SelectedValue;
            pay.Amount = result.Products.Sum(p => p.Total);
            pay.CustomerCustome = cus.CustomerId;
            db.Add(pay);
            db.SaveChanges();

            Order o = new Order();
            o.OrderDate = DateTime.Now;
            o.TotalPrice = result.Products.Sum(p => p.Total);
            o.CustomerCusto = cus.CustomerId;
            o.ShipmentShipm = s.ShipmentId;
            o.PaymentPayme = pay.PaymentId;
            db.Add(o);
            db.SaveChanges();

            var cartItems = db.Cart.Where(c => c.CustomerCustomerId == cus.CustomerId).ToList();
            foreach (var item in cartItems)
            {
                OrderItem oi = new OrderItem();
                oi.Quantity = item.Quantity;
                oi.ProductProdu = item.ProductProductId;
                oi.OrderOrderI = o.OrderId;
                Product p = db.Product.Where(a => a.ProductId == item.ProductProductId).FirstOrDefault();
                p.Stock -= item.Quantity;
                oi.Price = p.Price;
                db.Add(oi);
                db.SaveChanges();

            }
            db.Cart.RemoveRange(cartItems);
            db.SaveChanges();

            erraddsp.Text = "Đặt hàng thành công";
        }

    }
}

