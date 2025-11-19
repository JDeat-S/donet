namespace Marketplace.MVC.Api.Models
{
    public class Product
    {
        public int ProductoId { get; set; }
        public string Nombre { get; set; }
        public string? Descripcion { get; set; }
        public decimal Precio { get; set; }

        public int CategoriaId { get; set; }
        public int UsuarioId { get; set; }
        public string? ImagenBase64 { get; set; }
        public DateTime FechaPublicacion { get; set; }
        public bool Activo { get; set; }

        public Category? Categoria { get; set; }
        public User? Usuario { get; set; }
        public Inventory? Inventario { get; set; }
    }

}
