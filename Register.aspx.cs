using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var cus = db.Customer.FirstOrDefault(p => p.Email == txtRegisterEmail.Text);
            if (cus == null)
            {
                Customer c = new Customer();
                c.Name = txtName.Text;
                c.Address = txtAddress.Text;
                c.PhoneNumber = txtPhoneNumber.Text;
                c.Email = txtRegisterEmail.Text;
                c.Password = txtRegisterPassword.Text;
                c.Role = "customer";
                db.Customer.Add(c);
                db.SaveChanges();
                msgRegister.Text = "Đăng ký thành công!!!";
            }
            else
            {
                msgRegister.Text = "Tài khoản đã tồn tại!!!";
            }
        }
    }
}