<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebApplication1.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Đặt hàng
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
                        <li><a href="MyCart.aspx">My cart</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li>Đặt hàng</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <br />

    <h4>Đặt hàng</h4>
    <table width="80%" style="justify-content: center">
        <tr style="height: 100px; vertical-align: top">
            <td width="50%">Tên người nhận:<br />
                <asp:TextBox ID="txtname" runat="server" CssClass="form-control border-success" ReadOnly="true" />
            </td>
        </tr>
        <tr>
            <td>Số điện thoại:<br />
                <asp:TextBox ID="txtsdt" runat="server" CssClass="form-control border-success" ReadOnly="true" />
            </td>
        </tr>
        <tr style="height: 100px; vertical-align: top">
            <td width="80%">Địa chỉ giao hàng:<br />
                <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control border-success" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaddress" ErrorMessage="Địa chỉ không được để trống." ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td>Phương thức thanh toán:<br />
                <asp:DropDownList ID="phuongthuctt" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ProductName" HeaderText="Tên sách" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="300px" ReadOnly="True" />
                        <asp:BoundField DataField="Quantity" HeaderText="Số lượng" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="300px" ReadOnly="True" />

                        <asp:TemplateField HeaderText="Thành tiền">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"
                                    Text='<%# String.Format("{0:N0} VNĐ", Eval("Total")) %>'
                                    ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Width="300px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="300px" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="align-items: center; text-align: center;">
                <br />
                <asp:LinkButton Height="30px" Width="60" CssClass="bg-dark text-white" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Đặt hàng" />&nbsp;
                        <asp:LinkButton Height="30px" Width="60" CssClass="bg-dark text-white" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Quay về" PostBackUrl="~/MyCart.aspx" />
            </td>
        </tr>
    </table>

    <asp:Label ID="erraddsp" ForeColor="Red" runat="server" />
    <br />
    <br />
</asp:Content>
