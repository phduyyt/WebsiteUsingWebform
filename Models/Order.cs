using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace WebApplication1.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderItem = new HashSet<OrderItem>();
        }

        public int OrderId { get; set; }
        public DateTime? OrderDate { get; set; }
        public int? TotalPrice { get; set; }
        public int? CustomerCusto { get; set; }
        public int? PaymentPayme { get; set; }
        public int? ShipmentShipm { get; set; }

        public virtual Customer CustomerCustoNavigation { get; set; }
        public virtual Payment PaymentPaymeNavigation { get; set; }
        public virtual Shipment ShipmentShipmNavigation { get; set; }
        public virtual ICollection<OrderItem> OrderItem { get; set; }
    }
}
