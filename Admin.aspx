<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication1.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Admin
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        h2,h4{
            font-family:Arial;
        }
    </style>
    <div class="breadcrumbs_area">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="Admin.aspx">Admin</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="sidebar_widget catrgorie mb-35">
        <h2>Trang Admin</h2>
        <br />
        <ul>
            <li>
                <h4><a href="QuanLySanPham.aspx">Quản lý sản phẩm</a></h4>
            </li>
            <li>
                <h4><a href="QuanLyKhachHang.aspx">Quản lý khách hàng</a></h4>
            </li>
            <li>
                <h4><a href="QuanLyDanhMuc.aspx">Quản lý danh mục</a></h4>
            </li>
            <li>
                <h4><a href="QuanLyDonHang.aspx">Quản lý đơn hàng</a></h4>
            </li>
            <li>
                <h4><a href="KhachHangMuaNhieu.aspx">Thống kê, báo cáo</a></h4>
            </li>
        </ul>
    </div>
    <br />
    <br />
</asp:Content>
