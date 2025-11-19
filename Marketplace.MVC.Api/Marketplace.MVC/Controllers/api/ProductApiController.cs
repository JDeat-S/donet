using Marketplace.MVC.Api.Models;
using Marketplace.MVC.Api.Respositories;
using Microsoft.AspNetCore.Mvc;

namespace Marketplace.MVC.Api.Controllers.Api
{

    [ApiController]
    [Route("api/[controller]")]
    public class ProductApiController : ControllerBase
    {
        private readonly IProductRepository _repo;
        public ProductApiController(IProductRepository repo) { _repo = repo; }

        [HttpGet]
        public async Task<IActionResult> GetAll() => Ok(await _repo.GetAllAsync());

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var p = await _repo.GetByIdAsync(id);
            if (p == null) return NotFound();
            return Ok(p);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Product p)
        {
            await _repo.InsertAsync(p);
            return CreatedAtAction(nameof(Get), new { id = p.ProductoId }, p);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] Product p)
        {
            if (id != p.ProductoId) return BadRequest();
            await _repo.UpdateAsync(p);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await _repo.DeleteAsync(id);
            return NoContent();
        }
    }

}
