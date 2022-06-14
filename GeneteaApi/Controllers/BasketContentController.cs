using GeneteaApi.Contracts;
using GeneteaApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace GeneteaApi.Controllers
{
    [Route("api/basketContent")]
    [ApiController]
    public class BasketContentController : ControllerBase
    {
        private readonly IBasketContentRepository _basketContentRepo;
        public BasketContentController(IBasketContentRepository basketContentRepo)
        {
            _basketContentRepo = basketContentRepo;
        }
        [HttpGet("getContent", Name = "BasketContent")]
        public async Task<IActionResult> GetBasketContent()
        {
            try
            {
                var basketContent = await _basketContentRepo.GetBasketContent();
                return Ok(basketContent);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
