<%@ Page Title="" Language="C#" MasterPageFile="~/sub.Master" AutoEventWireup="true" CodeBehind="SuaSanPham.aspx.cs" Inherits="WebApplication1.SuaSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Sửa sản phẩm
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
                        <li><a href="QuanLySanPham.aspx">Quản lý sản phẩm</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li>Sửa thông tin sản phẩm</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <br />
    <h4>Sửa thông tin sản phẩm</h4>
    <table width="100%">
        <tr style="height: 100px; vertical-align: top">
            <td width="50%">Tên sách:<br />
                <asp:TextBox ID="product_nameTextBox" runat="server" CssClass="form-control border-success" /><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="product_nameTextBox" ErrorMessage="Tên sách không được để trống." ForeColor="Red" />
            </td>
            <td>Nhà xuất bản:<br />
                <asp:TextBox ID="publishTextBox" runat="server" CssClass="form-control border-success"/><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="publishTextBox" ErrorMessage="Nhà xuất bản không được để trống." ForeColor="Red" />
            </td>
        </tr>
        <tr style="height: 100px; vertical-align: top">
            <td>Tác giả:<br />
                <asp:TextBox ID="authorTextBox" runat="server" CssClass="form-control border-success" /><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="authorTextBox" ErrorMessage="Tác giả không được để trống." ForeColor="Red" />
            </td>
            <td>Ngày xuất bản:<br />
                <asp:TextBox ID="product_dateTextBox" runat="server" CssClass="form-control border-success"/><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="product_dateTextBox" ErrorMessage="Ngày xuất bản không được để trống." ForeColor="Red" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="product_dateTextBox"
                    ErrorMessage="Ngày xuất bản không hợp lệ. Vui lòng nhập theo định dạng d/M/yyyy."
                    ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[0-2])/\d{4}$"
                    ForeColor="Red" />
            </td>
        </tr>
        <tr style="height: 100px; vertical-align: top">
            <td>Đơn giá:<br />
                <asp:TextBox ID="priceTextBox" runat="server"  CssClass="form-control border-success"/><br />
                <asp:RequiredFieldValidator ID="priceRequiredValidator" runat="server" ControlToValidate="priceTextBox" ErrorMessage="Giá không được để trống." ForeColor="Red" Display="Dynamic" />
                <asp:RangeValidator ID="priceRangeValidator" runat="server" ControlToValidate="priceTextBox" Type="Integer" MinimumValue="0" MaximumValue="10000000" ErrorMessage="Giá phải lớn hơn hoặc bằng 0." ForeColor="Red" Display="Dynamic" />
            </td>
            <td>Hình ảnh:<br />
                <asp:FileUpload ID="FileUpLoad1" runat="server" CssClass="form-control border-success"/><br />
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorImage" runat="server" ControlToValidate="FileUpLoad1" ErrorMessage="Vui lòng tải lên một hình ảnh." ForeColor="Red" />--%>
            </td>
        </tr>
        <tr style="height: 100px; vertical-align: top">
            <td>Số lượng:<br />
                <asp:TextBox ID="stockTextBox" runat="server" CssClass="form-control border-success" /><br />
                <asp:RequiredFieldValidator ID="stockRequiredValidator" runat="server" ControlToValidate="stockTextBox" ErrorMessage="Số lượng không được để trống." ForeColor="Red" Display="Dynamic" />
                <asp:RangeValidator ID="stockRangeValidator" runat="server" ControlToValidate="stockTextBox" Type="Integer" MinimumValue="0" MaximumValue="10000000" ErrorMessage="Số lượng phải lớn hơn hoặc bằng 0." ForeColor="Red" Display="Dynamic" />
            </td>
            <td>Danh mục:<br />
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control border-success">
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td colspan="2">Mô tả:<br />
                <asp:TextBox ID="descriptionTextBox" runat="server" CssClass="form-control border-success" TextMode="MultiLine" Rows="4" /><br />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="align-items: center; text-align: center">
                <asp:LinkButton Height="30px" Width="60" CssClass="bg-dark text-white" ID="editButton" runat="server" CausesValidation="True" CommandName="Edit" Text="Sửa" OnCommand="editButton_Command" />&nbsp;
                        <asp:LinkButton Height="30px" Width="60" CssClass="bg-dark text-white" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Quay về" PostBackUrl="~/QuanLySanPham.aspx" />
            </td>
        </tr>
    </table>

    <asp:Label ID="errsuasp" ForeColor="Red" runat="server" />
    <br />
    <br />
</asp:Content>
