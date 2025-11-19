namespace Marketplace.MVC.Api.Models
{
    public class Category
    {
        public int CategoryId { get; set; }
        public string Nombre { get; set; }
        public string? Descripcion { get; set; }
        public ICollection<Product>? Productos { get; set; }
    }
}
