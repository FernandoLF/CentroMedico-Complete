using API_CentroMedico.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API_CentroMedico.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstadisticaMedicaController : ControllerBase
    {
        private readonly IEstadisticaMedicaRepository _estadisticaMedicaRepository;
        public EstadisticaMedicaController(IEstadisticaMedicaRepository estadisticaMedicaRepository)
        {
            _estadisticaMedicaRepository = estadisticaMedicaRepository;
        }

        [HttpGet("consultas/{opcion}")]
        public async Task<IActionResult> GetEstadisticasConsultas(int opcion)
        {
            var resultados = await _estadisticaMedicaRepository.EjecutarEstadisticaConsultasAsync(opcion);
            return Ok(resultados);
        }
    }
}
