<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductList.ascx.cs" Inherits="WebApplication1.ProductList" %>


<asp:ListView ID="ListView1" runat="server" DataKeyNames="product_id" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound">
    <LayoutTemplate>
        <div class="row">
            <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
        </div>
        <div style="text-align:center; font-size:20px;">
    <asp:DataPager ID="DataPager1" runat="server" PageSize="8" PagedControlID="ListView1">
        <Fields>
            <asp:NumericPagerField ButtonType="Link" />
        </Fields>
    </asp:DataPager>
</div>

    </LayoutTemplate>

    <ItemTemplate>
        <div class="col-md-3">
            <div class="single_product">
                <div class="product_thumb">
                    <a>
                        <asp:Image ID="image1" runat="server" ImageUrl='<%# "~/Image/" + Eval("Image") %>' />
                    </a>
                    <div class="img_icone">
                        <asp:Image ID="span_sp" runat="server" ImageUrl="" />
                    </div>
                    <div class="product_action">
                        <asp:Button ID="addCart" CommandName="addCart" CommandArgument='<%# Bind("product_id") %>' Text="Thêm vào giỏ hàng"
                            OnCommand="addCart_Command" OnClientClick="return confirm('Xác nhận thêm sản phẩm vào giỏ hàng')"
                            onmouseover="changeColorOnHover(this, true)" onmouseout="changeColorOnHover(this, false)"
                            Style="cursor: pointer;" runat="server" />
                    </div>
                </div>
                <div class="product_content">
                    <span class="product_price">
                        <asp:Label ID="Label1" runat="server" Text='<%# String.Format("{0:N0} VNĐ", Eval("price")) %>' />
                    </span>
                    <h3 class="product_title">
                        <a>
                            <asp:Label ID="Label2" runat="server" style="font-family:Arial; font-weight:500; text-transform:none" Text='<%# Eval("product_name") %>' />
                        </a>
                    </h3>
                </div>
                <div class="product_info">
                    <ul style="display: inline-flex">
                        <asp:Button ID="addWishlist" runat="server" Text="Yêu thích"
                            CommandName="addWishlist" CommandArgument='<%# Bind("product_id") %>'
                            OnClientClick="return confirm('Xác nhận thêm sản phẩm vào danh sách yêu thích')"
                            OnCommand="addWishlist_Command"
                            onmouseover="changeColorOnHover(this, true)" onmouseout="changeColorOnHover(this, false)"
                            Style="cursor: pointer;" />
                        <asp:Button ID="viewDetail" CommandName="viewDetail" CommandArgument='<%# Bind("product_id") %>' Text="Xem chi tiết"
                            OnCommand="viewDetail_Command"
                            onmouseover="changeColorOnHover(this, true)" onmouseout="changeColorOnHover(this, false)"
                            Style="cursor: pointer;" runat="server" />
                    </ul>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:ListView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BaiTapLonConnectionString %>" SelectCommand="SELECT * FROM [Product]">
</asp:SqlDataSource>

<script type="text/javascript">
    function changeColorOnHover(element, hover) {
        if (hover) {
            element.style.backgroundColor = "#54b8a6"; 
            element.style.color = "white"; 
        } else {
            element.style.backgroundColor = "#ffffff";
            element.style.color = "black"; 
        }
    }
</script>
