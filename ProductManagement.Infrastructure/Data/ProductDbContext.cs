using Microsoft.EntityFrameworkCore;
using ProductManagement.Domain;
using ProductManagement.Domain.Entities;

namespace ProductManagement.Infrastructure.Data
{
    public class ProductDbContext : DbContext
    {
        public ProductDbContext(DbContextOptions<ProductDbContext> options)
            : base(options) { }
        public DbSet<Category> Categories => Set<Category>();
        public DbSet<Product> Products => Set<Product>();
        public DbSet<Customer> Customers => Set<Customer>();
        public DbSet<Order> Orders => Set<Order>();
        public DbSet<OrderDetail> OrderDetails => Set<OrderDetail>();
        public DbSet<User> Users => Set<User>();
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configuración opcional (por ejemplo, restricciones o longitudes)
            modelBuilder.Entity<Category>().Property(c => c.Name).HasMaxLength(100).IsRequired();
            modelBuilder.Entity<Product>().Property(p => p.Name).HasMaxLength(100).IsRequired();
            modelBuilder.Entity<Customer>().Property(c => c.Email).HasMaxLength(100).IsRequired();
            // Configurar precisión de decimales
            modelBuilder.Entity<Product>().Property(p => p.Price).HasPrecision(10, 2);
            modelBuilder.Entity<Order>().Property(o => o.Total).HasPrecision(10, 2);
            modelBuilder.Entity<OrderDetail>().Property(od => od.UnitPrice).HasPrecision(10, 2);

            // Relación Order ↔ Customer
            modelBuilder.Entity<Order>()
                .HasOne(o => o.Customer)
                .WithMany(c => c.Orders)
                .HasForeignKey(o => o.CustomerId);

            // Relación Product ↔ Category
            modelBuilder.Entity<Product>()
                .HasOne(p => p.Category)
                .WithMany(c => c.Products)
                .HasForeignKey(p => p.CategoryId);

            // Relación OrderDetail ↔ Order y Product
            modelBuilder.Entity<OrderDetail>()
                .HasOne(od => od.Order)
                .WithMany(o => o.OrderDetails)
                .HasForeignKey(od => od.OrderId);

            modelBuilder.Entity<OrderDetail>()
                .HasOne(od => od.Product)
                .WithMany(p => p.OrderDetails)
                .HasForeignKey(od => od.ProductId);
        }
    }
}
