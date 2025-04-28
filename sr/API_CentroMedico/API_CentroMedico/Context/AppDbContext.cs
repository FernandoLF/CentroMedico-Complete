using API_CentroMedico.Models;
using Microsoft.EntityFrameworkCore;

namespace API_CentroMedico.Context
{
    public class AppDbContext: DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options): base(options)
        {
            
        }

        public DbSet<Paciente> Pacientes { get; set; }
    }
}
