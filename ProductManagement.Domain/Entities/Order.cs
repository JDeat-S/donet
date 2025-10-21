using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductManagement.Domain.Entities
{
    public class Order
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public decimal Total { get; set; }
        public DateTime OrderDate { get; set; } = DateTime.Now;
        public string Status { get; set; } = "Pendiente";

        // Relaciones
        public Customer? Customer { get; set; }
        public ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
    }
}
