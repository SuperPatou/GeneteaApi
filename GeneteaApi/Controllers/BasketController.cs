using GeneteaApi.Contracts;
using GeneteaApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace GeneteaApi.Controllers
{
    [Route("api/baskets")]
    [ApiController]
    public class BasketController : ControllerBase
    {
        private readonly IBasketRepository _basketRepo;
        public BasketController(IBasketRepository basketRepo)
        {
            _basketRepo = basketRepo;
        }
        [HttpGet("getBaskets", Name = "Baskets")]
        public async Task<IActionResult> GetBaskets()
        {
            try
            {
                var baskets = await _basketRepo.GetBaskets();
                return Ok(baskets);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("getBasket/{id}", Name = "BasketById")]
        public async Task<IActionResult> GetTea(int id)
        {
            try
            {
                Basket basket = await _basketRepo.GetBasket(id);
                if (basket == null)
                    return NotFound();
                return Ok(basket);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPut("insertBasket", Name = "BasketTea")]
        public async Task<IActionResult> InsertBasket(Basket unBasket)
        {
            try
            {
                Basket basket = await _basketRepo.InsertBasket(unBasket);
                if (basket == null)
                    return NotFound();
                return Ok(basket);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPut("updateBasket/{id}", Name = "UpdateBasket")]
        public async Task<IActionResult> UpdateBasket(Basket unBasket)
        {
            try
            {
                Basket basket = await _basketRepo.UpdateBasket(unBasket);
                if (basket == null)
                    return NotFound();
                return Ok(basket);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpDelete("deleteBasket/{id}", Name = "DeleteBasket")]
        public async Task<IActionResult> DeleteBasket(int id)
        {
            try
            {
                int ID_basket = await _basketRepo.DeleteBasket(id);
                return Ok(ID_basket);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
