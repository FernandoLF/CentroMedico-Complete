namespace API_CentroMedico.Interfaces
{
    public interface IEstadisticaMedicaRepository
    {
        Task<IEnumerable<dynamic>> EjecutarEstadisticaConsultasAsync(int opcion);
    }
}
