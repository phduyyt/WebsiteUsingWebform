<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="QuanLySanPham.aspx.cs" Inherits="WebApplication1.QuanLySanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Quản lý sản phẩm
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="font-family:Arial">
        <div class="breadcrumbs_area">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="Admin.aspx">Admin</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li><a>Quản lý sản phẩm</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <br />
    <a href="ThemSanPham.aspx"><h4 style="color:seagreen">Thêm mới</h4></a>
    <div style="display: flex; align-items: center;">
        <asp:TextBox CssClass="form-control" runat="server" Placeholder="Nhập tên sản phẩm cần tìm" ID="txtSearch"></asp:TextBox>
        <asp:Button runat="server" ForeColor="White" BackColor="#54b8a6" style="margin-left:10px" Width="100px" OnClick="btnSearch_Click"  ID="btnSearch" Text="Tìm kiếm"></asp:Button>
        <asp:Button runat="server" ForeColor="White" BackColor="#54b8a6" Width="100px" style="margin-left:10px" OnClick="btnViewAll_Click"  ID="btnViewAll" Text="Tất cả"></asp:Button>
    </div>
    <br />
    <h4>Danh sách sản phẩm</h4>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="product_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="product_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
            <asp:BoundField DataField="product_name" HeaderText="Tên sách" SortExpression="product_name" />
            <asp:BoundField DataField="description" HeaderText="Mô tả" SortExpression="description" />
            <asp:TemplateField HeaderText="Giá">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"
                        Text='<%# String.Format("{0:N0} VNĐ", Eval("Price")) %>'
                        ItemStyle-HorizontalAlign="Center" />
                </ItemTemplate>               
                </asp:TemplateField>
            <asp:BoundField DataField="stock" HeaderText="Số lượng" SortExpression="stock" />
            <asp:BoundField DataField="Category_catego" HeaderText="Danh mục" SortExpression="Category_catego" />
            <asp:BoundField DataField="publish" HeaderText="Nhà xuất bản" SortExpression="publish" />
            <asp:BoundField DataField="author" HeaderText="Tác giả" SortExpression="author" />
            <asp:BoundField DataField="product_date" HeaderText="Ngày xuất bản" SortExpression="product_date" DataFormatString="{0:d/M/yyyy}" HtmlEncode="False" />
            <asp:TemplateField HeaderText="Hình ảnh" ItemStyle-Width="200px" ItemStyle-Height="120" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# "~/Image/"+Eval("Image") %>' Width="119px" />
                    </ItemTemplate>
                </asp:TemplateField>
           <asp:TemplateField HeaderText="Xóa">
               <ItemTemplate>
                   <asp:Button Style="cursor: pointer; color:#54b8a6; font-weight:bold" runat="server" ID="xoaSP" CommandName="xoaSP" CommandArgument='<%# Bind("product_id") %>'
                       OnCommand="xoaSP_Command" Text="Xóa" BackColor="#e5e5e5" BorderStyle="None"
                       OnClientClick="return confirm('Bạn chắc chắn muốn xóa không?')"
                       />
               </ItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField  HeaderText="Sửa">
               <ItemTemplate>
                   <asp:Button Style="cursor: pointer; color:#54b8a6; font-weight:bold" runat="server" ID="suaSP" CommandName="suaSP" CommandArgument='<%# Bind("product_id") %>'
                       OnCommand="suaSP_Command" Text="Sửa" BackColor="#e5e5e5" BorderStyle="None"
                       />
               </ItemTemplate>
           </asp:TemplateField>

        </Columns>
        <HeaderStyle HorizontalAlign="Center" />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BaiTapLonConnectionString %>" 
        SelectCommand="SELECT * FROM [Product]" 
        >
    </asp:SqlDataSource>
    <br />
    <br />
    <script type="text/javascript">
        // Lưu vị trí cuộn khi người dùng cuộn trang
        window.addEventListener('scroll', function () {
            localStorage.setItem('scrollPosition', window.scrollY);
        });

        // Khôi phục vị trí cuộn khi trang được tải lại
        window.addEventListener('load', function () {
            var scrollPosition = localStorage.getItem('scrollPosition');
            if (scrollPosition !== null) {
                window.scrollTo(0, parseInt(scrollPosition, 10));
            }
        });
    </script>
</asp:Content>
