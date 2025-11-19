namespace Marketplace.MVC.Api.Models
{
    public class Role
    {
        public int RoleId { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }

        // Navegación opcional
        public ICollection<User>? Usuarios { get; set; }
    }
}
