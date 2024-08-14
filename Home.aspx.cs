using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class Home : Page
    {
        BaiTapLonContext db = new BaiTapLonContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["dm"] != null)
                {
                    int m = (int)Session["dm"];
                    Category c = db.Category.Where(a => a.CategoryId == m).FirstOrDefault();
                    ProductList1.BindData(m);
                    home.Text = c.Name;
                    panelViewHot.Visible = false;
                    panelViewNew.Visible = false;
                }
                else if (Session["search"] != null)
                {
                    panelViewHot.Visible = false;
                    panelViewNew.Visible = false;
                    string search = ((string)Session["search"]).ToLower();
                    ProductList1.BindData($@"SELECT * 
                        FROM Product 
                        WHERE LOWER(product_name) LIKE N'%{search}%';
                        ");
                }
                else if (Session["dm"] == null && Session["search"] == null)
                {
                    panelViewHot.Visible = true;
                    panelViewNew.Visible = true;
                    ProductList1.SetImage("");
                    ProductList1.BindData("SELECT * FROM [Product]");
                    ProductList2.SetImage("~/assets/img/cart/span-new.png");
                    ProductList2.BindData("SELECT TOP 8 * FROM Product ORDER BY product_date DESC");
                    ProductList3.SetImage("~/assets/img/cart/span-hot.png");
                    string sql = @"SELECT Top 8
                                        Product.product_id,
                                        Product.product_name,
                                        Product.description,
                                        Product.price,
                                        Product.stock,
                                        Product.Category_catego,
                                        Product.publish,
                                        Product.author,
                                        Product.product_date,
                                        Product.Image,
                                        SUM(Order_Item.quantity) AS total_quantity
                                    FROM 
                                        Order_Item
                                    JOIN 
                                        Product ON Order_Item.Product_produ = Product.product_id
                                    GROUP BY 
                                        Product.product_id, Product.product_name, Product.description, Product.price, Product.stock, Product.Category_catego, Product.publish,
                                        Product.author, Product.product_date, Product.Image
                                    ORDER BY 
                                        total_quantity DESC;";
                    ProductList3.BindData(sql);
                }
            }
        }
        protected void filterButton_Click(object sender, EventArgs e)
        {
            filterPanel.Visible = true;
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            filterPanel.Visible = false;
        }

        protected void priceRadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = priceRadioButtonList.SelectedValue;

            switch (selectedValue)
            {
                case "Under100":
                    minPrice.Text = "0";
                    maxPrice.Text = "100000";
                    break;
                case "100To200":
                    minPrice.Text = "100000";
                    maxPrice.Text = "200000";
                    break;
                case "200To300":
                    minPrice.Text = "200000";
                    maxPrice.Text = "300000";
                    break;
                case "Over300":
                    minPrice.Text = "300000";
                    maxPrice.Text = "10000000"; 
                    break;
                default:
                    break;
            }
        }

        protected void btnClearPrice_Click(object sender, EventArgs e)
        {
            minPrice.Text = "";
            maxPrice.Text = "";
        }

        protected void btnViewResults_Click(object sender, EventArgs e)
        {
            panelViewAll.Visible = false;
            panelViewHot.Visible = false;
            panelViewNew.Visible = false;
            panelSearch.Visible = true;
            ProductList4.RemovePager();
            int min =0; 
            int max =10000000;
            if (minPrice.Text != "" && maxPrice.Text != "")
            {
                try
                {
                    min = int.Parse(minPrice.Text);
                    max = int.Parse(maxPrice.Text);
                }
                catch (Exception)
                {

                    min = 0;
                    max = 10000000;
                }
            }
            ProductList4.BindData($@"SELECT * 
                        FROM Product 
                        WHERE price >= '{min}' AND price < '{max}'
                        ");
            filterPanel.Visible = false;
        }
    }
}