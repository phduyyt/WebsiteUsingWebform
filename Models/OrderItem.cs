using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace WebApplication1.Models
{
    public partial class OrderItem
    {
        public int OrderItemId { get; set; }
        public int? Quantity { get; set; }
        public decimal? Price { get; set; }
        public int? ProductProdu { get; set; }
        public int? OrderOrderI { get; set; }

        public virtual Order OrderOrderINavigation { get; set; }
        public virtual Product ProductProduNavigation { get; set; }
    }
}
