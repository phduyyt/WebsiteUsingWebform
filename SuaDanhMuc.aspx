<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="SuaDanhMuc.aspx.cs" Inherits="WebApplication1.SuaDanhMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Sửa danh mục
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
                        <li><a href="QuanLyDanhMuc.aspx">Quản lý danh mục</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li>Sửa thông tin danh mục</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <br />
    <h4>Sửa thông tin danh mục</h4>
            <table width="100%">
                <tr style="height:100px; vertical-align:top">
                    <td width="50%">Mã danh mục:<br />
                        <asp:TextBox ID="publishTextBox" runat="server" Enabled="false"/><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="publishTextBox" ErrorMessage="Mã danh mục không được để trống." ForeColor="Red" />
                    </td>
                    <td>Tên danh mục:<br />
                        <asp:TextBox ID="category_nameTextBox" runat="server"/><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="category_nameTextBox" ErrorMessage="Tên danh mục không được để trống." ForeColor="Red" />
                    </td>
                </tr>         
                <tr>
                    <td colspan="2" style="align-items: center; text-align: center">
                        <asp:LinkButton Height="30px" Width="60" CssClass="bg-dark text-white" ID="editButton" runat="server" CausesValidation="True" CommandName="Edit" Text="Sửa" OnCommand="editButton_Command" />&nbsp;
                        <asp:LinkButton Height="30px" Width="60" CssClass="bg-dark text-white" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Quay về" PostBackUrl="~/QuanLyDanhMuc.aspx" />
                    </td>
                </tr>
            </table>

    <asp:Label ID="erradddm" ForeColor="Red" runat="server" />
    <br />
    <br />
</asp:Content>
