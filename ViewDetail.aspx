<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="ViewDetail.aspx.cs" Inherits="WebApplication1.ViewDetail" %>
<%@ Register Src="~/ProductList.ascx" TagName="ProductList" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Xem chi tiết
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
                        <li><a href="Home.aspx">home</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li>Xem chi tiết</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>

    <div class="product_details">
        <div class="row">
            <div class="col-lg-5 col-md-6">
                <div>

                    <div class="tab-content produc_tab_c">
                        <div class="tab-pane fade show active" id="p_tab1" role="tabpanel">
                            <div class="modal_img">
                                <a href="#">
                                    <asp:Image ID="image1" runat="server" ImageUrl="" />
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-7 col-md-6">
                <div class="product_d_right">
                    <h1>
                        <asp:Label ID="txtName" style="font-family:Arial; font-weight:500; text-transform:none" runat="server"></asp:Label></h1>
                    <div class="product_ratting mb-10">
                        <ul>
                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                            <li><a href="#">Write a review </a></li>
                        </ul>
                    </div>
                    <div class="product_desc">
                        <p>
                            <asp:Label ID="txtDescription" runat="server"></asp:Label></p>
                    </div>
                    <div class="product_desc">
                        <p>
                            <asp:Label ID="txtAuthor" runat="server"></asp:Label></p>
                    </div>
                    <div class="product_desc">
                        <p>
                            <asp:Label ID="txtPublish" runat="server"></asp:Label></p>
                    </div>
                    <div class="product_desc">
                        <p>
                            <asp:Label ID="txtYear" runat="server"></asp:Label></p>
                    </div>

                    <div class="content_price mb-15">
                        <span>
                            <asp:Label ID="txtPrice" runat="server"></asp:Label></span>

                    </div>
                    <div class="box_quantity mb-20">
           
                        <asp:LinkButton ID="addCart" OnClick="addCart_Click" ToolTip="Thêm vào giỏ hàng" OnClientClick="return confirm('Xác nhận thêm sản phẩm vào giỏ hàng')" runat="server"><i class="fa fa-shopping-cart"></i></asp:LinkButton>
                        <asp:LinkButton ID="addWish" OnClick="addWish_Click" ToolTip="Thêm vào yêu thích" OnClientClick="return confirm('Xác nhận thêm sản phẩm vào giỏ hàng')" runat="server"><i class="fa fa-heart" aria-hidden="true"></i></asp:LinkButton>
                    </div>


                    <div class="product_stock mb-20">
                        <p>
                            <asp:Label ID="txtStock" runat="server"></asp:Label></p>
                        <span>In stock </span>
                    </div>
                    <div class="wishlist-share">
                        <h4>Share on:</h4>
                        <ul>
                            <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                            <li><a href="#"><i class="fa fa-tumblr"></i></a></li>
                            <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <asp:Label ID="txtDmm" runat="server"></asp:Label>

    
    <div style="padding-left:200px" class="product_details">
        <h3>Sản phẩm liên quan</h3>
        <div class="block_title"></div>
        <uc:ProductList ID="ProductList1" runat="server" />
    </div>
    
</asp:Content>
