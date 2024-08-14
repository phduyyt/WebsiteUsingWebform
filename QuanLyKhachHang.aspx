<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="QuanLyKhachHang.aspx.cs" Inherits="WebApplication1.QuanLyKhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Quản lý khách hàng
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
                        <li>Quản lý khách hàng</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <br />
    <a href="Register.aspx"><h4 style="color:seagreen">Thêm mới</h4></a>
    <h3>Danh sách khách hàng</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="customer_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField HeaderStyle-Width="50px" ItemStyle-HorizontalAlign="Center" DataField="customer_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="customer_id" />
            <asp:BoundField HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="name" HeaderText="Tên khách hàng" SortExpression="name" />
            <asp:BoundField HeaderStyle-Width="250px" ItemStyle-HorizontalAlign="Center" DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField HeaderStyle-Width="250px" ItemStyle-HorizontalAlign="Center" DataField="password" HeaderText="password" SortExpression="password" Visible="false"/>
            <asp:BoundField HeaderStyle-Width="250px" ItemStyle-HorizontalAlign="Center" DataField="address" HeaderText="Địa chỉ" SortExpression="address" />
            <asp:BoundField HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="phone_number" HeaderText="Số điện thoại" SortExpression="phone_number" />
            <asp:BoundField HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="role" HeaderText="role" SortExpression="role" />
            
           <asp:TemplateField HeaderText="Xóa">
               <ItemTemplate>
                   <asp:Button Style="cursor: pointer; color:#54b8a6; font-weight:bold" runat="server" ID="xoaKH" CommandName="xoaKH" CommandArgument='<%# Bind("customer_id") %>'
                       OnCommand="xoaKH_Command" Text="Xóa" BackColor="#e5e5e5" BorderStyle="None"
                       OnClientClick="return confirm('Bạn chắc chắn muốn xóa khách hàng này hay không?')"
                       />
               </ItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="Sửa">
               <ItemTemplate>
                   <asp:Button Style="cursor: pointer; color:#54b8a6; font-weight:bold" runat="server" ID="suaKH" CommandName="suaKH" CommandArgument='<%# Bind("customer_id") %>'
                       OnCommand="suaKH_Command" Text="Sửa" BackColor="#e5e5e5" BorderStyle="None"
                       />
               </ItemTemplate>
           </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center"/>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BaiTapLonConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
