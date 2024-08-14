<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="WebApplication1.MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    My Cart
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
                        <li>Giỏ hàng</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>

    <br />
    <div>
        <asp:Label ID="lblCustomer" runat="server" Text=""></asp:Label>
        <br />
        <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvProducts_RowDeleting">
            <Columns>
                <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Xóa
                    </HeaderTemplate>

                    <ItemTemplate>
                        <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" Width="50px" BorderStyle="None" BackColor="#e5e5e5"
                            CommandArgument='<%# Bind("CartId") %>' ImageUrl="~/assets/img/cart/deleteCart.jpg.png" OnCommand="DeleteButton_Command"
                            OnClientClick="return confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?')" />
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
                <asp:TemplateField HeaderText="Số lượng" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px">
                    <ItemTemplate>
                        <asp:Button Width="50px" CssClass="btn-outline-dark" ID="btnDecrease" runat="server" Text="-" CommandName="Decrease" CommandArgument='<%# Bind("CartId") %>' OnCommand="btnDecrease_Command" />
                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        <asp:Button Width="50px" CssClass="btn-outline-dark" ID="btnIncrease" runat="server" Text="+" CommandName="Increase" CommandArgument='<%# Bind("CartId") %>' OnCommand="btnIncrease_Command" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thành tiền">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server"
                            Text='<%# String.Format("{0:N0} VNĐ", Eval("Total")) %>'
                            ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="200px" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="200px" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    <br />
    <asp:Button ID="checkout" runat="server" Text="Đặt hàng" OnClick="checkout_Click" />
    <br />
    <br />
    <script type="text/javascript">

        window.addEventListener('scroll', function () {
            localStorage.setItem('scrollPosition', window.scrollY);
        });


        window.addEventListener('load', function () {
            var scrollPosition = localStorage.getItem('scrollPosition');
            if (scrollPosition !== null) {
                window.scrollTo(0, parseInt(scrollPosition, 10));
            }
        });
       
    </script>
</asp:Content>
