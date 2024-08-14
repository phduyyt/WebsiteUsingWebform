<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="SuaKhachHang.aspx.cs" Inherits="WebApplication1.SuaKhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Sửa thông tin khách hàng
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
                        <li><a href="Admin.aspx">Admin</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li><a href="QuanLyKhachHang.aspx">Quản lý khách hàng</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li>Sửa thông tin</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <br />
    <h4>Sửa thông tin khách hàng</h4>
        <table width="100%">
        <tr style="height: 100px; vertical-align: top">
            <td width="50%">Tên khách hàng:<br />
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control border-success"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Vui lòng nhập tên." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </td>
            <td>Số điện thoại:<br />
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control border-success"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Vui lòng nhập số điện thoại." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ValidationExpression="^0\d{9}$" ErrorMessage="Số điện thoại phải có 10 chữ số và bắt đầu bằng số 0." Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr style="height: 100px; vertical-align: top">
            <td>Email:<br />
                 <asp:TextBox ID="txtRegisterEmail" runat="server" CssClass="form-control border-success"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRegisterEmail" runat="server" ControlToValidate="txtRegisterEmail" ErrorMessage="Vui lòng nhập địa chỉ email." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revRegisterEmail" runat="server" ControlToValidate="txtRegisterEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Địa chỉ email không hợp lệ." Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
            </td>
            <td>Địa chỉ: <br />
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control border-success"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Vui lòng nhập địa chỉ." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="height: 100px; vertical-align: top">
            <td>Mật khẩu:<br />
                 <asp:TextBox ID="txtRegisterPassword" runat="server" CssClass="form-control border-success"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtRegisterPassword" ErrorMessage="Vui lòng nhập mật khẩu." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtRegisterPassword" ValidationExpression="^\S{6,}$" ErrorMessage="Mật khẩu phải có ít nhất 6 ký tự và không chứa khoảng trắng." Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
            </td>
            <td>Chức vụ:<br />
                 <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
           
        <tr>
            <td colspan="2" style="align-items: center; text-align: center">
                <asp:LinkButton Height="30px" Width="60" CssClass="bg-dark text-white" ID="suaKH" runat="server" CausesValidation="True" CommandName="suaKH" OnCommand="suaKH_Command" Text="Sửa"  />&nbsp;
                 <asp:LinkButton Height="30px" Width="60" CssClass="bg-dark text-white" ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Quay về" PostBackUrl="~/QuanLyKhachHang.aspx" />
            </td>
        </tr>
    </table>
    <asp:Label ID="errsuakh" ForeColor="Red" runat="server" />
    <br />
    <br />
</asp:Content>
