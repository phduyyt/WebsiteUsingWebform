<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Đăng nhập
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        *{
            font-family:Arial;
        }
    </style>

    <div class="breadcrumbs_area">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="Home.aspx">home</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li>Đăng nhập</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>

    <div class="customer_login">
        <div class="row">


            <div class="col-lg-6 col-md-6">
                <div class="account_form">
                    <h2>Đăng nhập</h2>
                    <p>
                        <label>Email <span>*</span></label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-success"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Vui lòng nhập địa chỉ email." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Địa chỉ email không hợp lệ." Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <label>Mật khẩu <span>*</span></label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control border-success" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Vui lòng nhập mật khẩu." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" CssClass="bg-dark text-white" OnClick="btnLogin_Click" />
                    </p>
                    <div class="login_submit">

                        <label for="remember">
                            <input type="checkbox" id="ckpass" onchange="togglePasswordVisibility(this, '<%= txtPassword.ClientID %>')" />
                            Hiển thị mật khẩu
                        </label>
                        <a href="#">Quên mật khẩu?</a>
                    </div>
                    <p>Chưa có tài khoản  <a href="Register.aspx" style="color: darkcyan">Đăng ký</a></p>
                </div>
                <asp:Label ID="msgLogin" runat="server" ForeColor="Red"></asp:Label>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        function togglePasswordVisibility(checkbox, textboxId) {
            var textbox = document.getElementById(textboxId);
            if (checkbox.checked) {
                textbox.type = "text"; 
            } else {
                textbox.type = "password"; 
            }
        }
    </script>
</asp:Content>
