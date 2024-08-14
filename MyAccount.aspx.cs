using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class MyAccount : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["login"] == null)
                {                   
                    string script = "if(confirm('Bạn phải đăng nhập để xem thông tin cá nhân. Bạn có muốn đăng nhập ngay không?')) { window.location='Login.aspx'; }";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);
                }
                else
                {
                    Customer c = (Customer)Session["login"];
                    txtName.Text = c.Name;
                    txtRegisterEmail.Text = c.Email;
                    txtRegisterPassword.Text = c.Password;
                    txtAddress.Text = c.Address;
                    txtPhoneNumber.Text = c.PhoneNumber;
                }
            }
        }

        protected void suaKH_Command(object sender, CommandEventArgs e)
        {
            try
            {
                Customer cus = (Customer)Session["login"];
                Customer c = db.Customer.Where(a => a.CustomerId ==cus.CustomerId).FirstOrDefault();
                c.Name = txtName.Text;
                c.Address = txtAddress.Text;
                c.PhoneNumber = txtPhoneNumber.Text;
                c.Email = txtRegisterEmail.Text;
                if (txtRegisterPassword.Text == "")
                {
                    errsuakh.Text = "Sửa thông tin thành công!!!";
                }
                else
                {
                    if (c.Password != txtRegisterPassword.Text)
                    {
                        errsuakh.Text = "Mật khẩu cũ không chính xác!!!";
                    }
                    else
                    {
                        c.Password = txtNewPass.Text;
                        errsuakh.Text = "Sửa thông tin thành công!!!";
                    }
                }
                
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                errsuakh.Text = "Có lỗi: " + ex.Message;

            }
        }
    }
}