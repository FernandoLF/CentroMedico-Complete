using API_CentroMedico.Context;
using API_CentroMedico.Interfaces;
using API_CentroMedico.Models;
using CentroMedico.Helpers;
using Microsoft.EntityFrameworkCore;
using System.Dynamic;

public class PacienteRepository : IPacienteRepository
{
    private readonly AppDbContext _context;

    public PacienteRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<List<Paciente>> GetPacientesAsync()
    {
        return await _context.Pacientes.ToListAsync();
    }

    public async Task<Paciente?> GetPacientePorDPIAsync(string dpi)
    {
        return await _context.Pacientes.FirstOrDefaultAsync(p => p.DPI == dpi);
    }

    public async Task<List<Paciente>> GetPacienteOrderDescAscAsync(char orden)
    {
        var listaPacientes = await _context.Pacientes.ToListAsync();

        return GeneralUtils.OrdenarLista(listaPacientes, p => p.Nombre, orden);
    }

    public async Task InsertPacienteAsync(Paciente paciente)
    {
        await _context.Pacientes.AddAsync(paciente);
        await _context.SaveChangesAsync();
    }
}