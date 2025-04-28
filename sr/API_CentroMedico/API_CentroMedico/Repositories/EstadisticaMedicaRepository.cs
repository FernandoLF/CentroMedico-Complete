using API_CentroMedico.Context;
using API_CentroMedico.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Dynamic;

namespace API_CentroMedico.Repositories
{
    public class EstadisticaMedicaRepository : IEstadisticaMedicaRepository
    {
        private readonly AppDbContext _context;

        public EstadisticaMedicaRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<dynamic>> EjecutarEstadisticaConsultasAsync(int opcion)
        {
            var resultados = new List<dynamic>();

            using (var connection = _context.Database.GetDbConnection())
            {
                await connection.OpenAsync();

                using (var command = connection.CreateCommand())
                {
                    command.CommandText = "EXEC SP_EstadisticaConsultasMedicas @opcion";
                    var parametro = command.CreateParameter();
                    parametro.ParameterName = "@opcion";
                    parametro.Value = opcion;
                    command.Parameters.Add(parametro);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var fila = new ExpandoObject() as IDictionary<string, object>;
                            for (var i = 0; i < reader.FieldCount; i++)
                            {
                                fila.Add(reader.GetName(i), reader.GetValue(i));
                            }
                            resultados.Add(fila);
                        }
                    }
                }
            }

            return resultados;
        }
    }
}
