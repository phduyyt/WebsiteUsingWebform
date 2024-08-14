<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="QuanLyDonHang.aspx.cs" Inherits="WebApplication1.QuanLyDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Quản lý đơn hàng
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
                        <li>Quản lý đơn hàng</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <br />
    <h4>Danh sách đơn hàng</h4>
    <asp:DropDownList ID="quanLyDonHang" AutoPostBack="true" OnSelectedIndexChanged="quanLyDonHang_SelectedIndexChanged" runat="server"></asp:DropDownList>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField HeaderStyle-Width="50px" DataField="OrderId" HeaderText="Mã đơn hàng" ReadOnly="True" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField HeaderStyle-Width="150px" DataField="CustomerName" HeaderText="Tên khách hàng" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField HeaderStyle-Width="150px" DataField="PhoneNumber" HeaderText="Số điện thoại" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="Tổng tiền" HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"
                        Text='<%# String.Format("{0:N0} VNĐ", Eval("TotalPrice")) %>'
                        ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Width="200px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:TemplateField>
            <asp:BoundField HeaderStyle-Width="150px" DataField="Date" HeaderText="Ngày đặt hàng" DataFormatString="{0:HH:mm:ss-dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="Trạng thái" HeaderStyle-Width="150px">
            <ItemTemplate>
                <%# GetStatusText(Eval("State")) %>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Xem chi tiết">
                <ItemTemplate>
                    <asp:Button Style="cursor: pointer; color:#54b8a6; font-weight:bold" runat="server" ID="xemDH" CommandName="xemDH" CommandArgument='<%# Bind("OrderId") %>'
                        OnCommand="xemDH_Command" Text="Xem" BackColor="#e5e5e5" BorderStyle="None" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label><br />
    <br />
    <br />
</asp:Content>
