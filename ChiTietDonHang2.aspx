<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="ChiTietDonHang2.aspx.cs" Inherits="WebApplication1.ChiTietDonHang2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Chi tiết đơn hàng
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
                        <li><a href="DonHangCuaToi.aspx">Đơn hàng của tôi</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li>Chi tiết đơn hàng</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <br />
    <h3>Danh sách sản phẩm</h3>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="order_item_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField HeaderText="#" ItemStyle-Width="50px">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
            <asp:BoundField DataField="order_item_id" HeaderStyle-Width="150px" HeaderText="Mã sản phẩm" InsertVisible="False" ReadOnly="True" ItemStyle-HorizontalAlign="Center" SortExpression="order_item_id" Visible="false" />
            <asp:BoundField DataField="product_name" HeaderText="Tên sản phẩm" HeaderStyle-Width="300px" SortExpression="Product_produ" ItemStyle-HorizontalAlign="Center"/>
            <asp:TemplateField HeaderText="Hình ảnh" ItemStyle-Width="200px" ItemStyle-Height="120" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Image ID="image" runat="server" ImageUrl='<%# "~/Image/"+Eval("Image") %>' Width="119px" />
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Đơn giá" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"
                        Text='<%# String.Format("{0:N0} VNĐ", Eval("price")) %>'
                        ItemStyle-HorizontalAlign="Center"/>
                </ItemTemplate>
            </asp:TemplateField> 
            <asp:BoundField DataField="quantity" HeaderText="Số lượng" HeaderStyle-Width="150px" SortExpression="quantity" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Order_order_i" HeaderText="Order_order_i" SortExpression="Order_order_i" Visible="false" />
            <asp:TemplateField HeaderText="Thành tiền" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server"
                        Text='<%# String.Format("{0:N0} VNĐ", Convert.ToInt32(Eval("quantity")) * Convert.ToInt32(Eval("price"))) %>'
                        ItemStyle-HorizontalAlign="Center" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BaiTapLonConnectionString %>" 
    SelectCommand="SELECT oi.order_item_id, oi.quantity, oi.price, oi.Product_produ, oi.Order_order_i, p.product_name, p.image 
                   FROM Order_Item oi 
                   INNER JOIN Product p ON oi.Product_produ = p.product_id 
                   WHERE oi.Order_order_i = @order_id">
    <SelectParameters>
        <asp:Parameter Name="order_id" DefaultValue="1" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
