using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class QuanLyDonHang : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                quanLyDonHang.Items.Add(new ListItem("Tất cả đơn hàng","1"));
                quanLyDonHang.Items.Add(new ListItem("Đơn hàng hôm nay","2"));
                quanLyDonHang.Items.Add(new ListItem("Đơn hàng tháng này","3"));
                quanLyDonHang.Items.Add(new ListItem("Đơn hàng trong năm","4"));
            }
                
        }

        private void LoadData()
        {
            try
            {
                var result = db.Order
                .Select(order => new
                {
                    order.OrderId,
                    CustomerName = order.CustomerCustoNavigation.Name,
                    PhoneNumber = order.CustomerCustoNavigation.PhoneNumber,
                    TotalPrice = order.TotalPrice,
                    State = order.ShipmentShipmNavigation.State,
                    Date=order.OrderDate
                }).OrderByDescending(order => order.Date)
                .ToList();

                lblMessage.Text = $"Tìm thấy {result.ToList().Count()} đơn hàng.";

                GridView1.DataSource = result.ToList();
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
                Response.Redirect("ChiTietDonHang.aspx");
            }
        }

        protected void quanLyDonHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            var result = db.Order
                .Select(order => new
                {
                    order.OrderId,
                    CustomerName = order.CustomerCustoNavigation.Name,
                    PhoneNumber = order.CustomerCustoNavigation.PhoneNumber,
                    TotalPrice = order.TotalPrice,
                    State = order.ShipmentShipmNavigation.State,
                    Date = order.OrderDate,
                }).OrderByDescending(order => order.Date)
                .ToList();
            if (quanLyDonHang.SelectedValue == "1")
            {
                GridView1.DataSource = result.ToList();
                GridView1.DataBind();
                lblMessage.Text = $"Tìm thấy {result.ToList().Count()} đơn hàng.";
            }
            else if (quanLyDonHang.SelectedValue == "2")
            {
                string date = $"{ DateTime.Now:d/M/yyyy}";

                GridView1.DataSource = result.Where(p => $"{ p.Date:d/M/yyyy}".Contains(date)).ToList();
                GridView1.DataBind();
                lblMessage.Text = $"Tìm thấy {result.Where(p => $"{ p.Date:d/M/yyyy}".Contains(date)).ToList().Count()} đơn hàng.";
            }
            else if (quanLyDonHang.SelectedValue == "3")
            {
                string date = $"{ DateTime.Now:M/yyyy}";
                GridView1.DataSource = result.Where(p => $"{ p.Date:d/M/yyyy}".Contains(date)).ToList();
                GridView1.DataBind();
                lblMessage.Text = $"Tìm thấy {result.Where(p => $"{ p.Date:d/M/yyyy}".Contains(date)).ToList().Count()} đơn hàng.";
            }
            else
            {
                string date = $"{ DateTime.Now:yyyy}";
                GridView1.DataSource = result.Where(p => $"{ p.Date:d/M/yyyy}".Contains(date)).ToList();
                GridView1.DataBind();
                lblMessage.Text = $"Tìm thấy {result.Where(p => $"{ p.Date:d/M/yyyy}".Contains(date)).ToList().Count()} đơn hàng.";
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
                case "4":
                    return "Hủy đơn";
                default:
                    return "Chờ xử lý";
            }
        }
    }
}
