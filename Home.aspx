<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<%@ Register Src="~/ProductList.ascx" TagName="ProductList" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Trang chủ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        *{
            font-family:Arial;
        }
    </style>
    <div>
        <p style="text-align: right">
            <asp:Button Width="50px" Height="25px" ID="filterButton" CssClass="btn-outline-dark" runat="server" Text="Lọc" OnClick="filterButton_Click" />
        </p>
        <asp:Panel ID="filterPanel" Style="position: absolute; top: 0px; right: 0px; background-color: white; z-index: 999; padding: 10px"
            runat="server" Visible="false">
            <div style="background-color: white">
                <asp:Label runat="server" Font-Size="20px" Text="Chọn khoảng giá:" />
                <asp:RadioButtonList CssClass="panel-default" ID="priceRadioButtonList" runat="server" OnSelectedIndexChanged="priceRadioButtonList_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="Dưới 100.000" Value="Under100"></asp:ListItem>
                    <asp:ListItem Text="100.000 -> 200.000" Value="100To200"></asp:ListItem>
                    <asp:ListItem Text="200.000 -> 300.000" Value="200To300"></asp:ListItem>
                    <asp:ListItem Text="Trên 300.000" Value="Over300"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:Label runat="server" Font-Size="20px" Text="Tự nhập khoảng giá:" />
                <br />
                <div style="display: inline-flex">
                    <asp:TextBox ID="minPrice" CssClass="form-control" Placeholder="Giá tối thiểu" style="margin:10px" runat="server" />
                    <asp:TextBox ID="maxPrice" CssClass="form-control" Placeholder="Giá tối đa" style="margin:10px" runat="server" />

                    <asp:Button Width="50px" ID="btnClearPrice" CssClass="btn-outline-dark" Style="margin: 10px" runat="server" Text="Xóa" OnClick="btnClearPrice_Click" />
                </div>
                <br />
            </div>
            <div style="display: inline-flex; justify-content: center; align-items: center; width: 100%;">
                <asp:Button Width="100px" Style="margin-right: 10px" ID="btnViewResults" CssClass="btn-outline-dark" runat="server" OnClick="btnViewResults_Click" Text="Xem kết quả" />
                <asp:Button Width="100px" Style="margin-left: 10px" ID="btnClose" CssClass="btn-outline-dark" runat="server" Text="Đóng" OnClick="btnClose_Click" />
            </div>
        </asp:Panel>
    </div>


    <asp:Panel ID="panelViewNew" runat="server">
        <h3>
            <asp:Label ID="Label1" runat="server">Sản phẩm mới</asp:Label>
        </h3>
        <div class="new_product_area">
            <div class="block_title"></div>
            <uc:ProductList ID="ProductList2" runat="server" />
        </div>
    </asp:Panel>

    <asp:Panel ID="panelViewHot" runat="server">
        <h3>
            <asp:Label ID="Label2" runat="server">Sản phẩm bán chạy</asp:Label>
        </h3>
        <div class="new_product_area">
            <div class="block_title"></div>
            <uc:ProductList ID="ProductList3" runat="server" />
        </div>
    </asp:Panel>

    <asp:Panel ID="panelViewAll" runat="server">
        <h3>
            <asp:Label ID="home" runat="server">Tất cả sản phẩm</asp:Label>
        </h3>
        <div class="new_product_eara">
            <div class="block_title"></div>
            <uc:ProductList ID="ProductList1" runat="server" /></div>
    </asp:Panel>


    <asp:Panel ID="panelSearch" Visible="false" runat="server">
        <h3>
            <asp:Label ID="Label3" runat="server">Sản phẩm phù hợp</asp:Label>
        </h3>
        <div class="new_product_area">
            <div class="block_title"></div>
            <uc:ProductList ID="ProductList4" runat="server" />
        </div>
    </asp:Panel>
    <asp:Label ID="test" runat="server"></asp:Label>
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
