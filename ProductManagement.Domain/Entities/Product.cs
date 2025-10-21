
namespace ProductManagement.Domain.Entities
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string? Description { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
        public bool IsActive { get; set; } = true;
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        // Clave foránea
        public int? CategoryId { get; set; }
        public Category? Category { get; set; }

        // Relación con OrderDetails
        public ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
    }
}
