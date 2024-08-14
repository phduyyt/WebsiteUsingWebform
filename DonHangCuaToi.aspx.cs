using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class DonHangCuaToi : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["login"] != null)
                {
                    LoadData();
                }
                else
                {
                    string script = "if(confirm('Bạn phải đăng nhập để xem đơn hàng. Bạn có muốn đăng nhập ngay không?')) { window.location='Login.aspx'; }";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);
                }
               
            }
        }

        private void LoadData()
        {
            try
            {
                Customer cus = (Customer)Session["Login"];
                var result = db.Order
                .Select(order => new
                {
                    order.OrderId,
                    CustomerId=order.CustomerCustoNavigation.CustomerId,
                    CustomerName = order.CustomerCustoNavigation.Name,
                    PhoneNumber = order.CustomerCustoNavigation.PhoneNumber,
                    TotalPrice = order.TotalPrice,
                    State = order.ShipmentShipmNavigation.State,
                    Date = order.OrderDate
                }).OrderByDescending(p=>p.Date)
                .ToList();

                lblMessage.Text = $"Tìm thấy {result.Where(p => p.CustomerId == cus.CustomerId).ToList().Count()} đơn hàng.";
                GridView1.DataSource = result.Where(p=>p.CustomerId==cus.CustomerId).ToList();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ nếu có
                lblMessage.Text = $"Có lỗi xảy ra: {ex.Message}";
            }
        }

        protected void xemDH_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "xemDH")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Session["xemDH"] = m;
                Response.Redirect("ChiTietDonHang2.aspx");
            }
        }

        protected void huyDH_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "huyDH")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Order o = db.Order.Where(a => a.OrderId == m).FirstOrDefault();
                Shipment s = db.Shipment.Where(a => a.ShipmentId == o.ShipmentShipm).FirstOrDefault();
                if (s.State == "1")
                {
                    s.State = "4";
                    db.SaveChanges();
                    LoadData();
                }
                else if(s.State=="4")
                {
                    s.State = "1";
                    o.OrderDate = DateTime.Now;
                    db.SaveChanges();
                    LoadData();
                }
            }
        }

        protected string GetButtonText(object State)
        {


            if (State.ToString() == "1")
            {
                return "Hủy đơn";
            }
            else if(State.ToString()=="4")
            {
                return "Đặt lại";
            }
            else
            {
                return "Không thể hủy";
            }
        }

        protected string GetStatusText(object state)
        {
            switch (state.ToString())
            {
                case "1":
                    return "Chờ xử lý";
                case "2":
                    return "Đang giao hàng";
                case "3":
                    return "Đã giao hàng";
                default:
                    return "Hủy đơn";
            }
        }
    }
}