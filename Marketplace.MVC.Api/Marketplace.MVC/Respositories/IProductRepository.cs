using Marketplace.MVC.Api.Models;

namespace Marketplace.MVC.Api.Respositories
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> GetAllAsync();
        Task<Product?> GetByIdAsync(int id);
        Task<int> InsertAsync(Product p);
        Task UpdateAsync(Product p);
        Task DeleteAsync(int id);
    }
}
