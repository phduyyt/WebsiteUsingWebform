<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="KhachHangMuaNhieu.aspx.cs" Inherits="WebApplication1.KhachHangMuaNhieu" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Thống kê
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <style>
        body, h3, h4, p, label, input, select, textarea, button, table, th, td, span {
            font-family: 'Times New Roman';
        }
        label, input, select, textarea, button, table, th, td, span {
            font-size:18px;
        }
    </style>
    <div id="t1" class="breadcrumbs_area">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">    
                    <ul>
                        <li><a href="Admin.aspx">Admin</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li>Thống kê, báo cáo</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <br />
    <h3>Thống kê doanh thu</h3>
    <h4>Theo ngày</h4>
    <asp:Label ID="sodonngay" runat="server"></asp:Label><br />
    <asp:Label ID="dongiaongay" runat="server"></asp:Label><br />
    <asp:Label ID="doanhthungay" runat="server"></asp:Label><br />
    <h4>Theo tháng</h4>
    <asp:Label ID="sodonthang" runat="server"></asp:Label><br />
    <asp:Label ID="dongiaothang" runat="server"></asp:Label><br />
    <asp:Label ID="doanhthuthang" runat="server"></asp:Label><br />
    <h4>Theo năm</h4>
    <asp:Label ID="sodonnnam" runat="server"></asp:Label><br />
    <asp:Label ID="dongiaonam" runat="server"></asp:Label><br />
    <asp:Label ID="doanhthunam" runat="server"></asp:Label><br />
    <br />
    <h4>Khách hàng mua nhiều nhất</h4>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField HeaderStyle-Width="50px" ItemStyle-HorizontalAlign="Center" DataField="Id" HeaderText="ID" />
            <asp:BoundField HeaderStyle-Width="150px" DataField="Name" HeaderText="Tên khách hàng" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField HeaderStyle-Width="150px" DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="Tổng số lượng mua" HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"
                        Text='<%# String.Format("{0:N0} Sản phẩm", Eval("TotalQuantity")) %>'
                        ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Width="200px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:TemplateField>
            <asp:BoundField HeaderStyle-Width="150px" DataField="Address" HeaderText="Địa chỉ" DataFormatString="{0:HH:mm:ss-dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" />
        </Columns>
        <HeaderStyle HorizontalAlign="Center" />
    </asp:GridView>
    <br />
    <h4>Sản Phẩm Bán Chạy Nhất</h4>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField HeaderStyle-Width="50px" ItemStyle-HorizontalAlign="Center" DataField="ProductId" HeaderText="ID" />
            <asp:BoundField HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="ProductName" HeaderText="Tên sách" />
            <asp:TemplateField HeaderText="Giá bán" HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server"
                        Text='<%# String.Format("{0:N0} VNĐ", Eval("Price")) %>'
                        ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Width="200px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:TemplateField>
            <asp:BoundField HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="Publish" HeaderText="Nhà xuất bản" />
            <asp:BoundField HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="Author" HeaderText="Tác giả" />
       <%--     <asp:TemplateField HeaderText="Hình ảnh" ItemStyle-Width="200px" ItemStyle-Height="120" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image ID="Image" runat="server" ImageUrl='<%# "~/Image/"+Eval("Image") %>' Width="119px" />
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Sản phẩm đã bán" HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server"
                        Text='<%# String.Format("{0:N0} Sản phẩm", Eval("TotalQuantity")) %>'
                        ItemStyle-HorizontalAlign="Center" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center" />
    </asp:GridView>
    <br />
    <h4>Sản phẩm không bán được</h4>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField HeaderStyle-Width="50px" ItemStyle-HorizontalAlign="Center" DataField="product_id" HeaderText="ID" />
            <asp:BoundField HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="product_name" HeaderText="Tên sách" />
            <asp:TemplateField HeaderText="Giá bán" HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server"
                        Text='<%# String.Format("{0:N0} VNĐ", Eval("price")) %>'
                        ItemStyle-HorizontalAlign="Center" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:TemplateField>
            <asp:BoundField HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="publish" HeaderText="Nhà xuất bản" />
            <asp:BoundField HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="author" HeaderText="Tác giả" />
           <%-- <asp:TemplateField HeaderText="Hình ảnh" ItemStyle-Width="200px" ItemStyle-Height="120" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# "~/Image/"+Eval("Image") %>' Width="119px" />
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Sản phẩm đã bán" HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server"
                        Text="0 Sản phẩm"
                        ItemStyle-HorizontalAlign="Center" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center" />
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BaiTapLonConnectionString %>"
        SelectCommand="SELECT p.product_id, p.product_name, p.description, p.price, p.stock, p.Category_catego, p.publish, p.author, p.product_date, p.image
        FROM Product p
        LEFT JOIN Order_Item oi ON p.product_id = oi.Product_produ
        WHERE oi.Product_produ IS NULL;"></asp:SqlDataSource>
    <asp:Button Width="80%" ID="xuatPDF" runat="server" Text="Xuất dữ liệu ra PDF" OnClick="ExportToPdf" />
    <br />
    <br />

</asp:Content>
