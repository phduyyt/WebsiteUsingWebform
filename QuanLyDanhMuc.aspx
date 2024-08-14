<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="QuanLyDanhMuc.aspx.cs" Inherits="WebApplication1.QuanLyDanhMuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Quản lý danh mục
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
                        <li>Quản lý danh mục</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <br />
    <a href="ThemDanhMuc.aspx"><h4 style="color:seagreen">Thêm mới</h4></a>
    <h4>Danh sách danh mục</h4>
    
    <asp:GridView ID="GridViewDM" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="category_id" DataSourceID="SqlDataSource2" CssClass="custom-gridview">
        <Columns>
            <asp:BoundField DataField="category_id" HeaderText="Mã danh mục" ReadOnly="True" ItemStyle-HorizontalAlign="Center" SortExpression="category_id" />
            <asp:BoundField DataField="name" HeaderText="Tên danh mục" SortExpression="name" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="250px" />
            <asp:TemplateField HeaderText="Xóa">
               <ItemTemplate>
                   <asp:Button Style="cursor: pointer; color:#54b8a6; font-weight:bold" runat="server" ID="xoaDM" CommandName="xoaDM" CommandArgument='<%# Bind("category_id") %>'
                       OnCommand="xoaDM_Command" Text="Xóa" BackColor="#e5e5e5" BorderStyle="None"
                       OnClientClick="return confirm('Bạn chắc chắn muốn xóa không?')"
                       />
               </ItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="Sửa">
               <ItemTemplate>
                   <asp:Button Style="cursor: pointer; color:#54b8a6; font-weight:bold" runat="server" ID="suaDM" CommandName="suaDM" CommandArgument='<%# Bind("category_id") %>'
                       OnCommand="suaDM_Command" Text="Sửa" BackColor="#e5e5e5" BorderStyle="None"
                       />
               </ItemTemplate>
           </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center" />
        </asp:GridView>
    <br /><br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BaiTapLonConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [category_id] = @category_id" InsertCommand="INSERT INTO [Category] ([category_id], [name]) VALUES (@category_id, @name)" SelectCommand="SELECT * FROM [Category]" UpdateCommand="UPDATE [Category] SET [name] = @name WHERE [category_id] = @category_id">
        <DeleteParameters>
            <asp:Parameter Name="category_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="category_id" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="category_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br /><br />
    </asp:Content>
