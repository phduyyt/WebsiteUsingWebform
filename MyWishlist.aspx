<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="MyWishlist.aspx.cs" Inherits="WebApplication1.MyWishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    My Wishlist
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
                        <li><a href="Home.aspx">Home</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li>Danh sách yêu thích</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>

    <br />
    <div>
        <asp:Label ID="lblCustomer" runat="server" Text=""></asp:Label>
        <br />
        <asp:GridView ID="gvWishlist" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvWishlist_RowDeleting">
            <Columns>
                <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Xóa
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" Width="50px" BorderStyle="None" BackColor="#e5e5e5"
                            CommandArgument='<%# Bind("WishlistId") %>' ImageUrl="~/assets/img/cart/deleteCart.jpg.png" OnCommand="DeleteButton_Command"
                            OnClientClick="return confirm('Bạn có chắc muốn xóa sản phẩm này khỏi danh sách yêu thích?')" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hình ảnh" ItemStyle-Width="200px" ItemStyle-Height="120" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# "~/Image/"+Eval("Image") %>' Width="119px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProductName" HeaderText="Tên sách" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" ItemStyle-Font-Bold="true" ReadOnly="True" />
                <asp:TemplateField HeaderText="Đơn giá">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"
                            Text='<%# String.Format("{0:N0} VNĐ", Eval("Price")) %>'
                            ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="200px" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="200px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Stock" HeaderText="Số lượng còn" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" ItemStyle-Font-Bold="true" ReadOnly="True" />
                <asp:TemplateField ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thêm vào giỏ hàng
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="addCart" runat="server" CommandName="Delete" Width="50px" BorderStyle="None" BackColor="#e5e5e5"
                            CommandArgument='<%# Bind("WishlistId") %>' ImageUrl="~/assets/img/cart/deleteWish.jpg.png" OnCommand="addCart_Command"
                            OnClientClick="return confirm('Bạn có chắc muốn thêm sản phẩm này vào giỏ hàng?')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    <br />
    <br />
</asp:Content>
