using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class ChiTietDonHang : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Items.Add(new ListItem("Chờ xử lý","1"));
                DropDownList1.Items.Add(new ListItem("Đang giao hàng","2"));
                DropDownList1.Items.Add(new ListItem("Đã giao hàng","3"));
                DropDownList1.Items.Add(new ListItem("Hủy đơn","4"));
                int m = (int)Session["xemDH"];
                var result = db.Order
                               .Where(order => order.OrderId == m)
                               .Select(order => new
                               {
                                   OrderId = order.OrderId,
                                   CustomerName = order.CustomerCustoNavigation.Name,
                                   PhoneNumber = order.CustomerCustoNavigation.PhoneNumber,
                                   ShipmentAddress = order.ShipmentShipmNavigation.Address,
                                   order.TotalPrice,
                                   State = order.ShipmentShipmNavigation.State,
                               })
                               .FirstOrDefault();
                txtOrderId.Text = result.OrderId.ToString();
                txtCusName.Text = result.CustomerName;
                txtAddress.Text = result.ShipmentAddress;
                txtTotalPrice.Text = string.Format("{0:N0} VNĐ", result.TotalPrice);
                DropDownList1.SelectedValue = result.State;
                txtPhoneNumber.Text = result.PhoneNumber;
                SqlDataSource1.SelectParameters["order_id"].DefaultValue = m.ToString();
            }
        }

        protected void suaDH_Command(object sender, CommandEventArgs e)
        {
                int m = (int)Session["xemDH"];
                Order o = db.Order.Where(p => p.OrderId == m).FirstOrDefault();
                Shipment s = db.Shipment.Where(p => p.ShipmentId == o.ShipmentShipm).FirstOrDefault();
                s.State=DropDownList1.SelectedValue;
                db.SaveChanges();
        }
    }

}