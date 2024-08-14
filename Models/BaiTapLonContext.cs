using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace WebApplication1.Models
{
    public partial class BaiTapLonContext : DbContext
    {
        public BaiTapLonContext()
        {
        }

        public BaiTapLonContext(DbContextOptions<BaiTapLonContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Cart> Cart { get; set; }
        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<Customer> Customer { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<OrderItem> OrderItem { get; set; }
        public virtual DbSet<Payment> Payment { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<Shipment> Shipment { get; set; }
        public virtual DbSet<Wishlist> Wishlist { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=DUYYYT;Database=BaiTapLon;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cart>(entity =>
            {
                entity.Property(e => e.CartId).HasColumnName("cart_id");

                entity.Property(e => e.CustomerCustomerId).HasColumnName("Customer_customer_id");

                entity.Property(e => e.ProductProductId).HasColumnName("Product_product_id");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.HasOne(d => d.CustomerCustomer)
                    .WithMany(p => p.Cart)
                    .HasForeignKey(d => d.CustomerCustomerId)
                    .HasConstraintName("FK__Cart__Customer_c__534D60F1");

                entity.HasOne(d => d.ProductProduct)
                    .WithMany(p => p.Cart)
                    .HasForeignKey(d => d.ProductProductId)
                    .HasConstraintName("FK__Cart__Product_pr__5441852A");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.Property(e => e.CategoryId)
                    .HasColumnName("category_id")
                    .ValueGeneratedNever();

                entity.Property(e => e.Name)
                    .HasColumnName("name")
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.Property(e => e.CustomerId).HasColumnName("customer_id");

                entity.Property(e => e.Address)
                    .HasColumnName("address")
                    .HasMaxLength(100);

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .HasColumnName("name")
                    .HasMaxLength(100);

                entity.Property(e => e.Password)
                    .HasColumnName("password")
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .HasColumnName("phone_number")
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Role)
                    .HasColumnName("role")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.OrderId).HasColumnName("order_id");

                entity.Property(e => e.CustomerCusto).HasColumnName("Customer_custo");

                entity.Property(e => e.OrderDate)
                    .HasColumnName("order_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.PaymentPayme).HasColumnName("Payment_payme");

                entity.Property(e => e.ShipmentShipm).HasColumnName("Shipment_shipm");

                entity.Property(e => e.TotalPrice).HasColumnName("total_price");

                entity.HasOne(d => d.CustomerCustoNavigation)
                    .WithMany(p => p.Order)
                    .HasForeignKey(d => d.CustomerCusto)
                    .HasConstraintName("FK__Order__Customer___60A75C0F");

                entity.HasOne(d => d.PaymentPaymeNavigation)
                    .WithMany(p => p.Order)
                    .HasForeignKey(d => d.PaymentPayme)
                    .HasConstraintName("FK__Order__Payment_p__619B8048");

                entity.HasOne(d => d.ShipmentShipmNavigation)
                    .WithMany(p => p.Order)
                    .HasForeignKey(d => d.ShipmentShipm)
                    .HasConstraintName("FK__Order__Shipment___628FA481");
            });

            modelBuilder.Entity<OrderItem>(entity =>
            {
                entity.ToTable("Order_Item");

                entity.Property(e => e.OrderItemId).HasColumnName("order_item_id");

                entity.Property(e => e.OrderOrderI).HasColumnName("Order_order_i");

                entity.Property(e => e.Price)
                    .HasColumnName("price")
                    .HasColumnType("decimal(10, 2)");

                entity.Property(e => e.ProductProdu).HasColumnName("Product_produ");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.HasOne(d => d.OrderOrderINavigation)
                    .WithMany(p => p.OrderItem)
                    .HasForeignKey(d => d.OrderOrderI)
                    .HasConstraintName("FK__Order_Ite__Order__66603565");

                entity.HasOne(d => d.ProductProduNavigation)
                    .WithMany(p => p.OrderItem)
                    .HasForeignKey(d => d.ProductProdu)
                    .HasConstraintName("FK__Order_Ite__Produ__656C112C");
            });

            modelBuilder.Entity<Payment>(entity =>
            {
                entity.Property(e => e.PaymentId).HasColumnName("payment_id");

                entity.Property(e => e.Amount).HasColumnName("amount");

                entity.Property(e => e.CustomerCustome).HasColumnName("Customer_custome");

                entity.Property(e => e.PaymentDate)
                    .HasColumnName("payment_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.PaymentMethod)
                    .HasColumnName("payment_method")
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.CustomerCustomeNavigation)
                    .WithMany(p => p.Payment)
                    .HasForeignKey(d => d.CustomerCustome)
                    .HasConstraintName("FK__Payment__Custome__5DCAEF64");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.Author)
                    .HasColumnName("author")
                    .HasMaxLength(200);

                entity.Property(e => e.CategoryCatego).HasColumnName("Category_catego");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.Image)
                    .HasColumnName("image")
                    .HasMaxLength(255);

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.ProductDate)
                    .HasColumnName("product_date")
                    .HasColumnType("date");

                entity.Property(e => e.ProductName)
                    .HasColumnName("product_name")
                    .HasMaxLength(100);

                entity.Property(e => e.Publish)
                    .HasColumnName("publish")
                    .HasMaxLength(200);

                entity.Property(e => e.Stock).HasColumnName("stock");

                entity.HasOne(d => d.CategoryCategoNavigation)
                    .WithMany(p => p.Product)
                    .HasForeignKey(d => d.CategoryCatego)
                    .HasConstraintName("FK__Product__Categor__4E88ABD4");
            });

            modelBuilder.Entity<Shipment>(entity =>
            {
                entity.Property(e => e.ShipmentId).HasColumnName("shipment_id");

                entity.Property(e => e.Address)
                    .HasColumnName("address")
                    .HasMaxLength(100);

                entity.Property(e => e.City)
                    .HasColumnName("city")
                    .HasMaxLength(100);

                entity.Property(e => e.Country)
                    .HasColumnName("country")
                    .HasMaxLength(50);

                entity.Property(e => e.CustomerCustom).HasColumnName("Customer_custom");

                entity.Property(e => e.ShipmentDate)
                    .HasColumnName("shipment_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.State)
                    .HasColumnName("state")
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.ZipCode)
                    .HasColumnName("zip_code")
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.HasOne(d => d.CustomerCustomNavigation)
                    .WithMany(p => p.Shipment)
                    .HasForeignKey(d => d.CustomerCustom)
                    .HasConstraintName("FK__Shipment__Custom__5AEE82B9");
            });

            modelBuilder.Entity<Wishlist>(entity =>
            {
                entity.Property(e => e.WishlistId).HasColumnName("wishlist_id");

                entity.Property(e => e.CustomerCustomerId).HasColumnName("Customer_customer_id");

                entity.Property(e => e.ProductProductId).HasColumnName("Product_product_id");

                entity.HasOne(d => d.CustomerCustomer)
                    .WithMany(p => p.Wishlist)
                    .HasForeignKey(d => d.CustomerCustomerId)
                    .HasConstraintName("FK__Wishlist__Custom__571DF1D5");

                entity.HasOne(d => d.ProductProduct)
                    .WithMany(p => p.Wishlist)
                    .HasForeignKey(d => d.ProductProductId)
                    .HasConstraintName("FK__Wishlist__Produc__5812160E");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
