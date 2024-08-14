using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace WebApplication1.Models
{
    public partial class Shipment
    {
        public Shipment()
        {
            Order = new HashSet<Order>();
        }

        public int ShipmentId { get; set; }
        public DateTime? ShipmentDate { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string ZipCode { get; set; }
        public int? CustomerCustom { get; set; }

        public virtual Customer CustomerCustomNavigation { get; set; }
        public virtual ICollection<Order> Order { get; set; }
    }
}
