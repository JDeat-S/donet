using System.Data;

namespace Marketplace.MVC.Api.Models
{
    public class User
    {
        public int UsuarioId { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
        public int RoleId { get; set; }
        public DateTime FechaRegistro { get; set; }
        public bool Activo { get; set; }

        public Role? Role { get; set; }
        public ICollection<Product>? Productos { get; set; }
    }
}
