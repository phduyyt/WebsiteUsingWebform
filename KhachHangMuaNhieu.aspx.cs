using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using iTextSharp.tool.xml;

namespace WebApplication1
{
    public partial class KhachHangMuaNhieu : System.Web.UI.Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();

            var result = db.Order
                .Select(order => new
                {
                    order.OrderId,
                    CustomerName = order.CustomerCustoNavigation.Name,
                    PhoneNumber = order.CustomerCustoNavigation.PhoneNumber,
                    TotalPrice = order.TotalPrice,
                    State = order.ShipmentShipmNavigation.State,
                    Date = order.OrderDate
                })
                .ToList();


            string date = $"{ DateTime.Now:d/M/yyyy}";

            var day = result.Where(p => $"{ p.Date:d/M/yyyy}".Contains(date)).ToList();
            sodonngay.Text = $"- Tổng số đơn: {day.Count()} đơn hàng.";
            dongiaongay.Text = $"- Số đơn đã giao: {day.Where(p=>p.State=="3").Count()} đơn hàng.";
            doanhthungay.Text = "- Doanh thu: " + string.Format("{0:N0} VNĐ", day.Where(p => p.State == "3").Sum(p => p.TotalPrice));
 
            date = $"{ DateTime.Now:M/yyyy}";
            var month = result.Where(p => $"{ p.Date:d/M/yyyy}".Contains(date)).ToList();
            sodonthang.Text = $"- Tổng số đơn: {month.Count()} đơn hàng.";
            dongiaothang.Text = $"- Số đơn đã giao: {month.Where(p => p.State == "3").Count()} đơn hàng.";
            doanhthuthang.Text = "- Doanh thu: " + string.Format("{0:N0} VNĐ", month.Where(p => p.State == "3").Sum(p => p.TotalPrice));

            date = $"{ DateTime.Now:yyyy}";
            var year = result.Where(p => $"{ p.Date:d/M/yyyy}".Contains(date)).ToList();
            sodonnnam.Text = $"- Tổng số đơn: {year.Count()} đơn hàng.";
            dongiaonam.Text = $"- Số đơn đã giao: {year.Where(p => p.State == "3").Count()} đơn hàng.";
            doanhthunam.Text = "- Doanh thu: " + string.Format("{0:N0} VNĐ", year.Where(p => p.State == "3").Sum(p => p.TotalPrice));
            

        }
        private void LoadData()
        {
            try
            {
                var result = db.Order
                .Join(db.OrderItem,
                      order => order.OrderId,
                      orderItem => orderItem.OrderOrderI,
                      (order, orderItem) => new { order.CustomerCusto, orderItem.Quantity })
                .Join(db.Customer,
                      order => order.CustomerCusto,
                      customer => customer.CustomerId,
                      (order, customer) => new
                      {
                          customer.CustomerId,
                          customer.Name,
                          customer.Email,
                          customer.Address,
                          order.Quantity
                      })
                .GroupBy(x => new { x.Name, x.Email, x.Address, x.CustomerId })
                .Select(g => new
                {
                    ID=g.Key.CustomerId,
                    Name = g.Key.Name,
                    Email = g.Key.Email,
                    Address = g.Key.Address,
                    TotalQuantity = g.Sum(x => x.Quantity)
                })
                .OrderByDescending(x => x.TotalQuantity)
                .ToList();
                var top1 = result.Take(1).FirstOrDefault();
                GridView1.DataSource = result.Where(p=>p.TotalQuantity==top1.TotalQuantity);
                GridView1.DataBind();

                //Bán chạy
                var result2 = db.Product
                .Join(db.OrderItem,
                      product => product.ProductId,
                      orderItem => orderItem.ProductProdu,
                      (product, orderItem) => new { product, orderItem.Quantity })
                .GroupBy(x => new { x.product.ProductId, x.product.ProductName, x.product.Price, x.product.Publish, x.product.Author, x.product.Image })
                .Select(g => new
                {
                    ProductId = g.Key.ProductId,
                    ProductName = g.Key.ProductName,
                    Price = g.Key.Price,
                    Publish = g.Key.Publish,
                    Author = g.Key.Author,
                    Image = g.Key.Image,
                    TotalQuantity = g.Sum(x => x.Quantity)
                })
                .OrderByDescending(x => x.TotalQuantity)
                .ToList();
                var rs2 = result2.Take(1).FirstOrDefault();
                GridView2.DataSource = result2.Where(p=>p.TotalQuantity==rs2.TotalQuantity).ToList();
                GridView2.DataBind();

            }
            catch (Exception)
            {
                // Xử lý ngoại lệ nếu có
            }
        }

        protected void ExportToPdf(object sender, EventArgs e)
        {
            using(StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    Control contentPlaceHolder = Page.Master.FindControl("ContentPlaceHolder1");
                    contentPlaceHolder.RenderControl(hw);
                    string htmlString = sw.ToString();
                    htmlString = RemoveListElements(htmlString);
                    StringReader sr = new StringReader(htmlString);
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=file1.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        private string RemoveListElements(string htmlString)
        {
            // You can implement logic to remove list elements here
            // For example, you can use regular expressions to remove <ul> and <ol> elements
            // This example removes both <ul> and <ol> elements
            htmlString = System.Text.RegularExpressions.Regex.Replace(htmlString, @"<ul[^>]*>|</ul>", "");
            // You can add more logic here to remove list items or customize as needed
            return htmlString;
        }
    }
}