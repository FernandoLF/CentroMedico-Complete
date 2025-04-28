using API_CentroMedico.Interfaces;
using API_CentroMedico.Models;
using Microsoft.AspNetCore.Mvc;

namespace API_CentroMedico.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PacienteController : ControllerBase
    {
        private readonly IPacienteRepository _pacienteRepository;

        public PacienteController(IPacienteRepository pacienteRepository)
        {
            _pacienteRepository = pacienteRepository;
        }

        [HttpGet]
        public async Task<IActionResult> GetPacientes()
        {
            var pacientes = await _pacienteRepository.GetPacientesAsync();
            return pacientes == null || pacientes.Count == 0
                ? NotFound(new { mensaje = "No hay pacientes registrados" })
                : Ok(pacientes);
        }

        [HttpGet("{dpi}")]
        public async Task<IActionResult> GetPacientePorDPI(string dpi)
        {
            var paciente = await _pacienteRepository.GetPacientePorDPIAsync(dpi);
            return paciente == null ? NotFound(new { mensaje = "Paciente no encontrado" }) : Ok(paciente);
        }

        [HttpPost]
        public async Task<IActionResult> InsertPaciente([FromBody] Paciente paciente)
        {
            if (paciente == null)
            {
                return BadRequest(new { mensaje = "Datos del paciente inválidos" });
            }

            await _pacienteRepository.InsertPacienteAsync(paciente);
            return CreatedAtAction(nameof(GetPacientePorDPI), new { dpi = paciente.DPI }, paciente);
        }

    }
}
