USE [master]
GO
/****** Object:  Database [DB_CentroMedico]    Script Date: 4/28/2025 2:08:16 PM ******/
CREATE DATABASE [DB_CentroMedico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_CentroMedico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_CentroMedico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_CentroMedico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_CentroMedico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_CentroMedico] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_CentroMedico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_CentroMedico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_CentroMedico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_CentroMedico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_CentroMedico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_CentroMedico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_CentroMedico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_CentroMedico] SET  MULTI_USER 
GO
ALTER DATABASE [DB_CentroMedico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_CentroMedico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_CentroMedico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_CentroMedico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_CentroMedico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_CentroMedico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_CentroMedico] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_CentroMedico] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_CentroMedico]
GO
/****** Object:  Table [dbo].[AnexoCita]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnexoCita](
	[IdAnexoCita] [int] IDENTITY(1,1) NOT NULL,
	[Observaciones] [varchar](500) NULL,
	[IdCita] [int] NOT NULL,
	[Fotografia] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAnexoCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo](
	[IdCatalogo] [int] IDENTITY(1,1) NOT NULL,
	[IdMedico] [int] NOT NULL,
	[IdEspecialidad] [int] NULL,
	[IdSubespecialidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[IdCita] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFin] [time](7) NULL,
	[ProximaCita] [datetime] NULL,
	[IdPaciente] [int] NOT NULL,
	[IdMedico] [int] NOT NULL,
	[IdEstadoCita] [int] NOT NULL,
	[IdMedicamento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[IdEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](1000) NULL,
	[Codigo] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoCita]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoCita](
	[IdEstadoCita] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](12) NULL,
	[Descripcion] [varchar](120) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstadoCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[IdMedicamento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Laboratorio] [varchar](80) NULL,
	[Presentacion] [int] NULL,
	[Descripcion] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[IdMedico] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Genero] [char](1) NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Telefono] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[Direccion] [varchar](255) NULL,
	[DPI] [varchar](14) NULL,
	[NumeroColegiado] [varchar](50) NOT NULL,
	[IdEspecialidad] [int] NULL,
	[FechaRegistro] [datetime] NULL,
	[CodigoVerificacion] [smallint] NULL,
	[IdResidencia] [int] NULL,
	[Activo] [bit] NULL,
	[JefeInmediato] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NumeroColegiado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Genero] [char](1) NULL,
	[Telefono] [varchar](11) NULL,
	[Email] [varchar](50) NULL,
	[Direccion] [varchar](250) NULL,
	[DPI] [varchar](14) NULL,
	[FechaRegistro] [datetime] NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Residencia]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Residencia](
	[IdResidencia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdResidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subespecialidad]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subespecialidad](
	[IdSubespecialidad] [int] IDENTITY(1,1) NOT NULL,
	[NombreSubespecialidad] [varchar](100) NOT NULL,
	[IdEspecialidad] [int] NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSubespecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medico] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Medico] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Paciente] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Paciente] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[AnexoCita]  WITH CHECK ADD  CONSTRAINT [FK_AnexoCitaCita] FOREIGN KEY([IdCita])
REFERENCES [dbo].[Cita] ([IdCita])
GO
ALTER TABLE [dbo].[AnexoCita] CHECK CONSTRAINT [FK_AnexoCitaCita]
GO
ALTER TABLE [dbo].[Catalogo]  WITH CHECK ADD  CONSTRAINT [FK_CatalogoEspecialidad] FOREIGN KEY([IdEspecialidad])
REFERENCES [dbo].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [dbo].[Catalogo] CHECK CONSTRAINT [FK_CatalogoEspecialidad]
GO
ALTER TABLE [dbo].[Catalogo]  WITH CHECK ADD  CONSTRAINT [FK_CatalogoSubespecialidad] FOREIGN KEY([IdSubespecialidad])
REFERENCES [dbo].[Subespecialidad] ([IdSubespecialidad])
GO
ALTER TABLE [dbo].[Catalogo] CHECK CONSTRAINT [FK_CatalogoSubespecialidad]
GO
ALTER TABLE [dbo].[Catalogo]  WITH CHECK ADD  CONSTRAINT [FK_MedicoCatalogo] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
ALTER TABLE [dbo].[Catalogo] CHECK CONSTRAINT [FK_MedicoCatalogo]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_CitaEstado] FOREIGN KEY([IdEstadoCita])
REFERENCES [dbo].[EstadoCita] ([IdEstadoCita])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_CitaEstado]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_CitaMedicamento] FOREIGN KEY([IdMedicamento])
REFERENCES [dbo].[Medicamento] ([IdMedicamento])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_CitaMedicamento]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_CitaMedico] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_CitaMedico]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_CitaPaciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_CitaPaciente]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadMedico] FOREIGN KEY([IdEspecialidad])
REFERENCES [dbo].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_EspecialidadMedico]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_JefeInmediato] FOREIGN KEY([JefeInmediato])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_JefeInmediato]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Residencia] FOREIGN KEY([IdResidencia])
REFERENCES [dbo].[Residencia] ([IdResidencia])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Residencia]
GO
ALTER TABLE [dbo].[Subespecialidad]  WITH CHECK ADD  CONSTRAINT [FK_SubEspecialidad] FOREIGN KEY([IdEspecialidad])
REFERENCES [dbo].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [dbo].[Subespecialidad] CHECK CONSTRAINT [FK_SubEspecialidad]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD CHECK  (([Genero]='F' OR [Genero]='M'))
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD CHECK  (([Genero]='F' OR [Genero]='M'))
GO
ALTER TABLE [dbo].[Residencia]  WITH CHECK ADD CHECK  (([Nombre]='R4' OR [Nombre]='R3' OR [Nombre]='R2' OR [Nombre]='R1'))
GO
/****** Object:  StoredProcedure [dbo].[SP_EstadisticaConsultasMedicas]    Script Date: 4/28/2025 2:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Fernando López
-- Create date: <28/04/2025>
-- Description:	<Estadísticas de Consultas Médicas>
-- =============================================
CREATE PROCEDURE [dbo].[SP_EstadisticaConsultasMedicas] 
    @opcion INT
AS
BEGIN
    SET NOCOUNT ON;

    IF @opcion = 1
    BEGIN
        --1. Total de Consultas por Especialidad
		SELECT e.Nombre AS Especialidad, COUNT(c.IdCita) AS TotalConsultas
		FROM Cita c
		INNER JOIN Medico m ON c.IdMedico = m.IdMedico
		INNER JOIN Especialidad e ON m.IdEspecialidad = e.IdEspecialidad
		WHERE c.IdEstadoCita = (SELECT IdEstadoCita FROM EstadoCita WHERE Nombre = 'En Progreso')
		GROUP BY e.Nombre
		ORDER BY TotalConsultas DESC;
    END
    ELSE IF @opcion = 2
    BEGIN
        SELECT CONCAT(m.Nombre, m.Apellido) AS Nombre, COUNT(c.IdCita) AS CitasPendientes
		FROM Medico m
		INNER JOIN Cita c ON c.IdMedico = m.IdMedico
		WHERE c.IdEstadoCita = (SELECT IdEstadoCita FROM EstadoCita WHERE Nombre = 'Pendiente')
		GROUP BY m.Nombre, m.Apellido
		ORDER BY CitasPendientes
    END
    ELSE IF @opcion = 3
    BEGIN
        --3. La Consulta con Mayor duración en minuto, incluir el nombre del paciente y
		--   médico tratante de dicha consulta
		SELECT TOP 1 
			p.Nombre + ' ' + p.Apellido AS Paciente,
			m.Nombre + ' ' + m.Apellido AS Medico,
			DATEDIFF(MINUTE, c.HoraInicio, c.HoraFin) AS DuracionMinutos
		FROM Cita c
		JOIN Paciente p ON c.IdPaciente = p.IdPaciente
		JOIN Medico m ON c.IdMedico = m.IdMedico
		WHERE c.HoraFin IS NOT NULL
		ORDER BY DuracionMinutos DESC;
    END
    ELSE IF @opcion = 4
    BEGIN
        -- 4. La Consulta con menor duración en segundos, incluir el nombre del paciente
		--    y médico tratante de dicha consulta
		SELECT TOP 1 
			p.Nombre + ' ' + p.Apellido AS Paciente,
			m.Nombre + ' ' + m.Apellido AS Medico,
			DATEDIFF(SECOND, c.HoraInicio, c.HoraFin) AS DuracionSegundos
		FROM Cita c
		JOIN Paciente p ON c.IdPaciente = p.IdPaciente
		JOIN Medico m ON c.IdMedico = m.IdMedico
		WHERE c.HoraFin IS NOT NULL
		ORDER BY DuracionSegundos ASC;
    END
    ELSE IF @opcion = 5
    BEGIN
        --5. El cliente con más medicamentos recetados
		SELECT TOP 1 
			p.Nombre + ' ' + p.Apellido AS Paciente,
			COUNT(c.IdMedicamento) AS TotalMedicamentos
		FROM Cita c
		JOIN Paciente p ON c.IdPaciente = p.IdPaciente
		GROUP BY p.Nombre, p.Apellido
		ORDER BY TotalMedicamentos DESC;
    END
    ELSE IF @opcion = 6
    BEGIN
        --6. El médico hombre que ha atendido a más pacientes mujeres
		SELECT TOP 1 
			m.Nombre + ' ' + m.Apellido AS Medico,
			COUNT(c.IdCita) AS TotalPacientesAtendidos
		FROM Cita c
		JOIN Paciente p ON c.IdPaciente = p.IdPaciente
		JOIN Medico m ON c.IdMedico = m.IdMedico
		WHERE m.Genero = 'M' AND p.Genero = 'F'
		GROUP BY m.Nombre, m.Apellido
		ORDER BY TotalPacientesAtendidos DESC;
    END
    ELSE IF @opcion = 7
    BEGIN
        --7. Cada subespecialidad con el total de consultas realizadas
		--   a pacientes hombres
		SELECT s.NombreSubespecialidad AS Subespecialidad, COUNT(c.IdCita) AS TotalConsultas
		FROM Cita c
		JOIN Paciente p ON c.IdPaciente = p.IdPaciente
		JOIN Medico m ON c.IdMedico = m.IdMedico
		JOIN Subespecialidad s ON m.IdEspecialidad = s.IdEspecialidad
		WHERE p.Genero = 'M'
		GROUP BY s.NombreSubespecialidad
		ORDER BY TotalConsultas DESC;
    END
    ELSE
    BEGIN
        SELECT 'El valor proporcionado en @opcion es inválido. Por favor elija entre 1 y 7.' AS Mensaje;
    END
END;
GO
USE [master]
GO
ALTER DATABASE [DB_CentroMedico] SET  READ_WRITE 
GO
