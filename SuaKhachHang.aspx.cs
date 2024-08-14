using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class SuaKhachHang : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Items.Add(new ListItem("Customer", "customer"));
                DropDownList1.Items.Add(new ListItem("Admin", "admin"));
                int m = (int)Session["suaKH"];
                Customer c = db.Customer.Where(a => a.CustomerId == m).FirstOrDefault();
                txtName.Text = c.Name;
                txtRegisterEmail.Text = c.Email;
                txtRegisterPassword.Text = c.Password;
                txtAddress.Text = c.Address;
                txtPhoneNumber.Text = c.PhoneNumber;
                DropDownList1.SelectedValue = c.Role;

            }
        }

        protected void suaKH_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int m = (int)Session["suaKH"];
                Customer c = db.Customer.Where(a=>a.CustomerId==m).FirstOrDefault();
                c.Name = txtName.Text;
                c.Address = txtAddress.Text;
                c.PhoneNumber = txtPhoneNumber.Text;
                c.Email = txtRegisterEmail.Text;
                c.Password = txtRegisterPassword.Text;
                c.Role = DropDownList1.SelectedValue;
                db.SaveChanges();
                errsuakh.Text = "Sửa thông tin thành công!!!";
            }
            catch (Exception ex)
            {
                errsuakh.Text = "Có lỗi: " + ex.Message;

            }
        }
    }
}