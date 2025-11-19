using Dapper;
using Marketplace.MVC.Api.Models;
using Marketplace.MVC.Api.Respositories;
using System.Data;

public class ProductRepository : IProductRepository
{
    private readonly IDbConnection _db;
    public ProductRepository(IDbConnection db) { _db = db; }

    public async Task<IEnumerable<Product>> GetAllAsync()
    {
        return await _db.QueryAsync<Product>("sp_Productos_GetAll", commandType: CommandType.StoredProcedure);
    }

    public async Task<Product?> GetByIdAsync(int id)
    {
        var sql = "SELECT * FROM Productos WHERE ProductoId = @id";
        return await _db.QueryFirstOrDefaultAsync<Product>(sql, new { id });
    }

    public async Task<int> InsertAsync(Product p)
    {
        var parameters = new DynamicParameters();
        parameters.Add("@Nombre", p.Nombre);
        parameters.Add("@Descripcion", p.Descripcion);
        parameters.Add("@Precio", p.Precio);
        parameters.Add("@CategoriaId", p.CategoriaId);
        parameters.Add("@UsuarioId", p.UsuarioId);
        parameters.Add("@ImagenBase64", p.ImagenBase64);
        return await _db.ExecuteAsync("sp_Productos_Insert", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task UpdateAsync(Product p)
    {
        var parameters = new DynamicParameters();
        parameters.Add("@ProductoId", p.ProductoId);
        parameters.Add("@Nombre", p.Nombre);
        parameters.Add("@Descripcion", p.Descripcion);
        parameters.Add("@Precio", p.Precio);
        parameters.Add("@CategoriaId", p.CategoriaId);
        parameters.Add("@Activo", p.Activo);
        await _db.ExecuteAsync("sp_Productos_Update", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task DeleteAsync(int id)
    {
        await _db.ExecuteAsync("sp_Productos_Delete", new { ProductoId = id }, commandType: CommandType.StoredProcedure);
    }
}
