using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class ChiTietDonHang2 : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["login"] == null)
                {     
                    string script = "if(confirm('Bạn phải đăng nhập để xem đơn hàng. Bạn có muốn đăng nhập ngay không?')) { window.location='Login.aspx'; }";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);

                }
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
                SqlDataSource1.SelectParameters["order_id"].DefaultValue = m.ToString();
            }
        }
    }
}