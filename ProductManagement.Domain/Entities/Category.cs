using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductManagement.Domain.Entities
{
    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string? Description { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        // Relación uno a muchos con productos
        public ICollection<Product> Products { get; set; } = new List<Product>();
    }
}
