using API_CentroMedico.Models;

namespace API_CentroMedico.Interfaces
{
    public interface IPacienteRepository
    {
        Task<List<Paciente>> GetPacientesAsync();
        Task<Paciente?> GetPacientePorDPIAsync(string dpi);
        Task<List<Paciente>> GetPacienteOrderDescAscAsync(char orden);
        Task InsertPacienteAsync(Paciente paciente);
    }
}
