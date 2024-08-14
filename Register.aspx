<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

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
                        <li>Đăng ký</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>

    <div class="customer_login">
        <div class="row">

            <div class="col-lg-6 col-md-6">
                <div class="account_form register">
                    <h2>Đăng ký tài khoản</h2>
                    <p>
                        <label>Họ tên <span>*</span></label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control border-success"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Vui lòng nhập tên." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <label>Địa chỉ <span>*</span></label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control border-success"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Vui lòng nhập địa chỉ." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <label>Số điện thoại <span>*</span></label>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control border-success"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Vui lòng nhập số điện thoại." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ValidationExpression="^0\d{9}$" ErrorMessage="Số điện thoại phải có 10 chữ số và bắt đầu bằng số 0." Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <label>Email <span>*</span></label>
                        <asp:TextBox ID="txtRegisterEmail" runat="server" CssClass="form-control border-success"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRegisterEmail" runat="server" ControlToValidate="txtRegisterEmail" ErrorMessage="Vui lòng nhập địa chỉ email." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revRegisterEmail" runat="server" ControlToValidate="txtRegisterEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Địa chỉ email không hợp lệ." Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <label>Mật khẩu <span>*</span></label>
                        <asp:TextBox ID="txtRegisterPassword" runat="server" CssClass="form-control border-success" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtRegisterPassword" ErrorMessage="Vui lòng nhập mật khẩu." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtRegisterPassword" ValidationExpression="^\S{6,}$" ErrorMessage="Mật khẩu phải có ít nhất 6 ký tự và không chứa khoảng trắng." Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <label>Nhập lại mật khẩu <span>*</span></label>
                        <asp:TextBox ID="txtReRegisterPassword" runat="server" CssClass="form-control border-success" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRePassword" runat="server" ControlToValidate="txtReRegisterPassword" ErrorMessage="Vui lòng nhập lại mật khẩu." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPasswordMatch" runat="server" ControlToValidate="txtReRegisterPassword" ControlToCompare="txtRegisterPassword" ErrorMessage="Mật khẩu nhập lại không khớp." Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
                    </p>

                    <p>
                        <asp:Button ID="btnRegister" runat="server" Text="Đăng ký" CssClass="bg-dark text-white" OnClick="btnRegister_Click" />
                    </p>
                    <p>Đã có tài khoản  <a href="Login.aspx" style="color: darkcyan">Đăng nhập</a></p>
                    <asp:Label ID="msgRegister" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
