using API_CentroMedico.Context;
using API_CentroMedico.Interfaces;
using API_CentroMedico.Repositories;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddScoped<IPacienteRepository, PacienteRepository>();
builder.Services.AddScoped<IEstadisticaMedicaRepository, EstadisticaMedicaRepository>();

// Add services to the container.
//Crear la cadena de conexi�n a la base de datos
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
//Registrar el servicio para la conexi�n
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(connectionString));

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo
    {
        Title = "API Centro M�dico",
        Version = "v1",
        Description = "API para la gesti�n de pacientes y m�dicos"
    });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
