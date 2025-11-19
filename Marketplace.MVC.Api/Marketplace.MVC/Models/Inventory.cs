namespace Marketplace.MVC.Api.Models
{
    public class Inventory
    {
        public int InventarioId { get; set; }
        public int ProductoId { get; set; }
        public int Cantidad { get; set; }
        public DateTime UltimaActualizacion { get; set; }

        public Product? Producto { get; set; }
    }
}
