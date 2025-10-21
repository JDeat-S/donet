using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductManagement.Domain.Entities
{
    public class Customer
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string? Phone { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        // Relación uno a muchos con Orders
        public ICollection<Order> Orders { get; set; } = new List<Order>();
    }
}
