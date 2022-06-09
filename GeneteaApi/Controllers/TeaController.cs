using GeneteaApi.Contracts;
using GeneteaApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace GeneteaApi.Controllers
{
    [Route("api/teas")]
    [ApiController]
    public class TeaController : ControllerBase
    {
        private readonly ITeaRepository _teaRepo;
        public TeaController(ITeaRepository teaRepo)
        {
            _teaRepo = teaRepo;
        }
        [HttpGet(Name = "Teas")]
        public async Task<IActionResult> GetTeas()
        {
            try
            {
                var teas = await _teaRepo.GetTeas();
                return Ok(teas);
            }
            catch (Exception ex)
            {
                //log error
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("{id}", Name = "TeaById")]
        public async Task<IActionResult> GetTea(int id)
        {
            try
            {
                Tea tea = await _teaRepo.GetTea(id);
                if (tea == null)
                    return NotFound();
                return Ok(tea);
            }
            catch (Exception ex)
            {
                //log error
                return StatusCode(500, ex.Message);
            }
        }
    }
}
