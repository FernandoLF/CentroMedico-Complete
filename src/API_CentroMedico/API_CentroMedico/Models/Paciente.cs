using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_CentroMedico.Models
{
    [Table("Paciente")]
    public class Paciente
    {
        [Key]
        public int IdPaciente { get; set; } 

        public string Nombre { get; set; } 

        public string Apellido { get; set; } 

        public DateTime FechaNacimiento { get; set; } 

        public char Genero { get; set; } 

        public string Telefono { get; set; } 

        public string Email { get; set; } 

        public string Direccion { get; set; } 

        public string DPI { get; set; } 

        public DateTime FechaRegistro { get; set; } = DateTime.Now; 

        public bool Activo { get; set; } = true; 
    }
}
