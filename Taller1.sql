/****** Object:  Database [Universidad]    Script Date: 6/9/2023 23:36:15 ******/
CREATE DATABASE [Universidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\Universidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\Universidad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Universidad] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Universidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Universidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Universidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Universidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Universidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Universidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Universidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Universidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Universidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Universidad] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Universidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Universidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Universidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Universidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Universidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Universidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Universidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Universidad] SET RECOVERY FULL 
GO
ALTER DATABASE [Universidad] SET  MULTI_USER 
GO
ALTER DATABASE [Universidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Universidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Universidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Universidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Universidad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Universidad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Universidad', N'ON'
GO
ALTER DATABASE [Universidad] SET QUERY_STORE = ON
GO
ALTER DATABASE [Universidad] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Universidad]
GO
/****** Object:  User [NelsonAlmendares]    Script Date: 6/9/2023 23:36:16 ******/
CREATE USER [NelsonAlmendares] FOR LOGIN [NelsonAlmendares] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Candidatos]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidatos](
	[id_candidato] [int] IDENTITY(1,1) NOT NULL,
	[nombre_candidato] [varchar](180) NOT NULL,
	[aplellido_candidato] [varchar](180) NOT NULL,
	[procedencia_candidato] [varchar](100) NOT NULL,
	[id_carrera] [int] NOT NULL,
	[contacto_candidato] [varchar](12) NOT NULL,
	[documento_candidato] [varchar](12) NULL,
	[id_estadoCandidato] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_candidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoCandidato]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoCandidato](
	[id_estadoCandidato] [int] IDENTITY(1,1) NOT NULL,
	[estado_candidato] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estadoCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carreras]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carreras](
	[id_carrera] [int] IDENTITY(1,1) NOT NULL,
	[nombre_carrera] [varchar](100) NOT NULL,
	[codigo_carrera] [varchar](50) NOT NULL,
	[id_facultad] [int] NOT NULL,
	[id_tipoCarrera] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Candidatos]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--INSERT INTO [dbo].[Matriculas] (id_asignatura, id_estudiante, id_carrera, fecha_matricula) VALUES (2, 2023000, 1, GETDATE());

-- ****************************** Vista para los detallos de los candidatos ******************************
CREATE VIEW [dbo].[View_Candidatos] 
	AS SELECT nombre_candidato AS Nombre, aplellido_candidato AS Apellido, procedencia_candidato AS Procedencia, nombre_carrera AS Carrera, contacto_candidato AS Contacto, estado_candidato
	FROM [dbo].[Candidatos]
	INNER JOIN [dbo].[Carreras] ON [dbo].[Carreras].id_carrera = [dbo].[Candidatos].id_carrera
	INNER JOIN [dbo].[EstadoCandidato] ON [dbo].[Candidatos].id_estadoCandidato = [dbo].[EstadoCandidato].id_estadoCandidato
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[id_asignatura] [int] IDENTITY(1,1) NOT NULL,
	[nombre_asignatura] [varchar](150) NOT NULL,
	[catedratico_asignatura] [varchar](150) NOT NULL,
	[codigo_asignatura] [varchar](10) NOT NULL,
	[id_estadoAsignatura] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_asignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BitacoraEstudiantil]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BitacoraEstudiantil](
	[id_bitacora] [int] IDENTITY(1,1) NOT NULL,
	[id_asignatura] [int] NOT NULL,
	[id_estadoAsignaturaInscrita] [int] NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[numero_matricula] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_bitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoAsignatura]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoAsignatura](
	[id_estadoAsignatura] [int] IDENTITY(1,1) NOT NULL,
	[estado_Asignatura] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estadoAsignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoAsignaturaInscrita]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoAsignaturaInscrita](
	[id_asignaturaInscrita] [int] IDENTITY(1,1) NOT NULL,
	[estado_asignatura] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_asignaturaInscrita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoEstudiantes]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoEstudiantes](
	[id_estadoEstudiante] [int] IDENTITY(1,1) NOT NULL,
	[estadoEstudiante] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estadoEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[carnet_estudiante] [int] IDENTITY(2023000,1) NOT NULL,
	[nombre_estudiante] [varchar](150) NOT NULL,
	[apellido_estudiante] [varchar](150) NOT NULL,
	[documento_estudiante] [varchar](10) NULL,
	[procedencia_estudiante] [varchar](250) NOT NULL,
	[contacto_estudiante] [varchar](9) NOT NULL,
	[INE_estudiante] [int] NULL,
	[id_estadoEstudiante] [int] NOT NULL,
	[id_carrera] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[carnet_estudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facultad]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facultad](
	[id_facultad] [int] IDENTITY(1,1) NOT NULL,
	[nombre_facultad] [varchar](150) NOT NULL,
	[encargado_faculad] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_facultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matriculas]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matriculas](
	[id_matricula] [int] IDENTITY(1,1) NOT NULL,
	[id_asignatura] [int] NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[id_carrera] [int] NOT NULL,
	[fecha_matricula] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[id_nota] [int] IDENTITY(1,1) NOT NULL,
	[id_asignatura] [int] NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[nota_obtenida] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registros]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registros](
	[id_registro] [int] IDENTITY(1,1) NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[id_carrera] [int] NOT NULL,
	[pagos] [float] NULL,
	[fecha_registro] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCarrera]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCarrera](
	[id_tipoCarrera] [int] IDENTITY(1,1) NOT NULL,
	[tipoCarrera] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipoCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asignatura] ON 

INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (1, N'Cálculo Diferencial', N'Luis Alonso Arenivar', N'ALG501', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (2, N'Programación Estructurada', N'Juan Carlos Aguilar', N'PRE101', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (3, N'Programación Orientada a Objetos', N'David Enersto Perez', N'POO101', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (4, N'Dibujo técnico 1', N'Pricila de Guevara Cruz', N'DT-102', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (5, N'Química General', N'Juan Obvidio de Preza', N'QMG501', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (6, N'Técnica Fotográfica', N'Miguel Angel de la O', N'FT302', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (7, N'Cinemática y dinámica de particulas', N'Ingrid Ester Menjivar', N'CDP501', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (8, N'Redes Cisco CCNA', N'Edgardo Daniel Hernandez', N'RCN101', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (9, N'Gestión de Recusos', N'Anderson Rogel de Preza', N'GR301', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (10, N'Aviónica', N'Felipe Martinez', N'AV103', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (11, N'Mantenimiento de sistemas Hidráulicos', N'José Miguel Estrada', N'MTH102', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (12, N'Dinámica de fluidos viscosos y no viscosos', N'Milton Estrada', N'DFV103', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (13, N'Técnicas de locución verbal', N'Mirna de Martinez', N'TLV203', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (14, N'Ingles para el trabajo corporativo', N'Issela Guevara Porras', N'ITP203', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (15, N'Técnicas de Mantenimiento', N'Juan Carlos Aguilar', N'TMA103', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (16, N'Animación 2D y 3D', N'Amilcar Amadeo Cruz', N'AD302', 1)
INSERT [dbo].[Asignatura] ([id_asignatura], [nombre_asignatura], [catedratico_asignatura], [codigo_asignatura], [id_estadoAsignatura]) VALUES (17, N'Estadistica', N'Nestor Montes Parras', N'EST501', 1)
SET IDENTITY_INSERT [dbo].[Asignatura] OFF
GO
SET IDENTITY_INSERT [dbo].[BitacoraEstudiantil] ON 

INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (1, 2, 2, 2023000, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (2, 4, 1, 2023001, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (3, 14, 1, 2023005, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (4, 3, 1, 2023003, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (5, 2, 1, 2023000, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (6, 5, 1, 2023001, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (7, 16, 1, 2023005, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (8, 5, 1, 2023000, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (9, 9, 1, 2023001, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (10, 9, 1, 2023003, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (11, 8, 1, 2023000, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (12, 1, 1, 2023003, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (13, 17, 1, 2023001, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (14, 7, 1, 2023003, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (15, 6, 1, 2023005, 1)
INSERT [dbo].[BitacoraEstudiantil] ([id_bitacora], [id_asignatura], [id_estadoAsignaturaInscrita], [id_estudiante], [numero_matricula]) VALUES (16, 6, 1, 2023004, 1)
SET IDENTITY_INSERT [dbo].[BitacoraEstudiantil] OFF
GO
SET IDENTITY_INSERT [dbo].[Candidatos] ON 

INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (1, N'Nelson José', N'Almendares Ruiz', N'Instituto Técnico Ricaldone', 1, N'7375-7645', N'01234512-2', 1)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (2, N'Ana Lucía', N'Vasquez Torres', N'Colegio Santa Mónica', 4, N'9834-3143', N'05381234-2', 1)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (3, N'José Amilcar', N'Chacón Gonzales', N'Colegio la Diveina Providencia', 5, N'0424-3452', N'09423452-7', 1)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (4, N'Diana Berenice', N'Aguilar Peña', N'Instituto Técnico Ricaldone', 2, N'4014-4512', N'04912314-3', 1)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (5, N'Milton Daniel', N'Hecheverría Cruz', N'Colegio Santa Cecilia', 3, N'2344-6516', N'54910312-9', 1)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (6, N'Ana Mirna', N'Monje', N'Instituto Cantón De la Paz', 7, N'8034-2341', N'03225234-3', 2)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (7, N'Hector Enmanuel', N'Garcia Luna', N'Colegio Técnico de San Roque', 3, N'0923-1233', N'34983123-8', 1)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (8, N'Wilfredo Alejandro', N'Villeda', N'Colegio EXAL', 6, N'2344-1235', N'30131232-5', 2)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (9, N'Victor Esteban', N'Perez de la O', N'Instituto Técnico Ricaldone', 1, N'89340932', N'00200314-3', 1)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (10, N'Joel Alberto', N'Enrriquez Enrriquez', N'Colegio Militar Salvadoreño', 2, N'9034-3461', N'09423421-1', 2)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (11, N'Eriberto Steve', N'Edmons', N'Instituto Técnico Ricaldone', 1, N'8923-1234', N'44123123-0', 1)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (12, N'José Daniel', N'Rodas Cerín', N'Instituto Técnico Ricaldone', 5, N'4216-1451', N'23454512-4', 2)
INSERT [dbo].[Candidatos] ([id_candidato], [nombre_candidato], [aplellido_candidato], [procedencia_candidato], [id_carrera], [contacto_candidato], [documento_candidato], [id_estadoCandidato]) VALUES (13, N'Carlos Alberto', N'Ponce Ramirez', N'Colegio Divina Providencia', 4, N'9083-3234', N'42342344-3', 2)
SET IDENTITY_INSERT [dbo].[Candidatos] OFF
GO
SET IDENTITY_INSERT [dbo].[Carreras] ON 

INSERT [dbo].[Carreras] ([id_carrera], [nombre_carrera], [codigo_carrera], [id_facultad], [id_tipoCarrera]) VALUES (1, N'Ingeniería en Ciencias de la Computación', N'101', 1, 1)
INSERT [dbo].[Carreras] ([id_carrera], [nombre_carrera], [codigo_carrera], [id_facultad], [id_tipoCarrera]) VALUES (2, N'Ingeniería Industrial', N'102', 1, 1)
INSERT [dbo].[Carreras] ([id_carrera], [nombre_carrera], [codigo_carrera], [id_facultad], [id_tipoCarrera]) VALUES (3, N'Ingeniería Aeronáutica', N'103', 3, 1)
INSERT [dbo].[Carreras] ([id_carrera], [nombre_carrera], [codigo_carrera], [id_facultad], [id_tipoCarrera]) VALUES (4, N'Diplomado en Ciencias de la comunicación', N'201', 3, 4)
INSERT [dbo].[Carreras] ([id_carrera], [nombre_carrera], [codigo_carrera], [id_facultad], [id_tipoCarrera]) VALUES (5, N'Diplomado en Hoteles y turismo', N'202', 2, 4)
INSERT [dbo].[Carreras] ([id_carrera], [nombre_carrera], [codigo_carrera], [id_facultad], [id_tipoCarrera]) VALUES (6, N'Diplomado en Idiomas', N'203', 3, 4)
INSERT [dbo].[Carreras] ([id_carrera], [nombre_carrera], [codigo_carrera], [id_facultad], [id_tipoCarrera]) VALUES (7, N'Licenciatura en Administración de Empresas', N'301', 2, 2)
INSERT [dbo].[Carreras] ([id_carrera], [nombre_carrera], [codigo_carrera], [id_facultad], [id_tipoCarrera]) VALUES (8, N'Licenciatura en Diseño gráfico', N'302', 3, 2)
INSERT [dbo].[Carreras] ([id_carrera], [nombre_carrera], [codigo_carrera], [id_facultad], [id_tipoCarrera]) VALUES (9, N'Licenciatura en Telecomunicaciones', N'303', 3, 2)
SET IDENTITY_INSERT [dbo].[Carreras] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoAsignatura] ON 

INSERT [dbo].[EstadoAsignatura] ([id_estadoAsignatura], [estado_Asignatura]) VALUES (1, N'Activa')
INSERT [dbo].[EstadoAsignatura] ([id_estadoAsignatura], [estado_Asignatura]) VALUES (2, N'Inactiva')
SET IDENTITY_INSERT [dbo].[EstadoAsignatura] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoAsignaturaInscrita] ON 

INSERT [dbo].[EstadoAsignaturaInscrita] ([id_asignaturaInscrita], [estado_asignatura]) VALUES (1, N'Reprobada')
INSERT [dbo].[EstadoAsignaturaInscrita] ([id_asignaturaInscrita], [estado_asignatura]) VALUES (2, N'Aprobada')
SET IDENTITY_INSERT [dbo].[EstadoAsignaturaInscrita] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoCandidato] ON 

INSERT [dbo].[EstadoCandidato] ([id_estadoCandidato], [estado_candidato]) VALUES (1, N'Aprobado')
INSERT [dbo].[EstadoCandidato] ([id_estadoCandidato], [estado_candidato]) VALUES (2, N'Denegado')
SET IDENTITY_INSERT [dbo].[EstadoCandidato] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoEstudiantes] ON 

INSERT [dbo].[EstadoEstudiantes] ([id_estadoEstudiante], [estadoEstudiante]) VALUES (1, N'Activo')
INSERT [dbo].[EstadoEstudiantes] ([id_estadoEstudiante], [estadoEstudiante]) VALUES (2, N'Inactivo')
INSERT [dbo].[EstadoEstudiantes] ([id_estadoEstudiante], [estadoEstudiante]) VALUES (3, N'Condicional')
INSERT [dbo].[EstadoEstudiantes] ([id_estadoEstudiante], [estadoEstudiante]) VALUES (4, N'Proceso de graduación')
SET IDENTITY_INSERT [dbo].[EstadoEstudiantes] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiantes] ON 

INSERT [dbo].[Estudiantes] ([carnet_estudiante], [nombre_estudiante], [apellido_estudiante], [documento_estudiante], [procedencia_estudiante], [contacto_estudiante], [INE_estudiante], [id_estadoEstudiante], [id_carrera]) VALUES (2023000, N'Nelson José', N'Almendares Ruiz', N'01234512-2', N'Instituto Técnico Ricaldone', N'7375-7645', NULL, 1, 1)
INSERT [dbo].[Estudiantes] ([carnet_estudiante], [nombre_estudiante], [apellido_estudiante], [documento_estudiante], [procedencia_estudiante], [contacto_estudiante], [INE_estudiante], [id_estadoEstudiante], [id_carrera]) VALUES (2023001, N'Ana Lucía', N'Vasquez Torres', N'05381234-2', N'Colegio Santa Mónica', N'9834-3143', NULL, 1, 4)
INSERT [dbo].[Estudiantes] ([carnet_estudiante], [nombre_estudiante], [apellido_estudiante], [documento_estudiante], [procedencia_estudiante], [contacto_estudiante], [INE_estudiante], [id_estadoEstudiante], [id_carrera]) VALUES (2023002, N'José Amilcar', N'Chacón Gonzales', N'09423452-7', N'Colegio la Diveina Providencia', N'0424-3452', NULL, 1, 5)
INSERT [dbo].[Estudiantes] ([carnet_estudiante], [nombre_estudiante], [apellido_estudiante], [documento_estudiante], [procedencia_estudiante], [contacto_estudiante], [INE_estudiante], [id_estadoEstudiante], [id_carrera]) VALUES (2023003, N'Diana Berenice', N'Aguilar Peña', N'04912314-3', N'Instituto Técnico Ricaldone', N'4014-4512', NULL, 1, 2)
INSERT [dbo].[Estudiantes] ([carnet_estudiante], [nombre_estudiante], [apellido_estudiante], [documento_estudiante], [procedencia_estudiante], [contacto_estudiante], [INE_estudiante], [id_estadoEstudiante], [id_carrera]) VALUES (2023004, N'Milton Daniel', N'Hecheverría Cruz', N'54910312-9', N'Colegio Santa Cecilia', N'2344-6516', NULL, 1, 3)
INSERT [dbo].[Estudiantes] ([carnet_estudiante], [nombre_estudiante], [apellido_estudiante], [documento_estudiante], [procedencia_estudiante], [contacto_estudiante], [INE_estudiante], [id_estadoEstudiante], [id_carrera]) VALUES (2023005, N'Hector Enmanuel', N'Garcia Luna', N'34983123-8', N'Colegio Técnico de San Roque', N'0923-1233', NULL, 1, 3)
INSERT [dbo].[Estudiantes] ([carnet_estudiante], [nombre_estudiante], [apellido_estudiante], [documento_estudiante], [procedencia_estudiante], [contacto_estudiante], [INE_estudiante], [id_estadoEstudiante], [id_carrera]) VALUES (2023006, N'Victor Esteban', N'Perez de la O', N'00200314-3', N'Instituto Técnico Ricaldone', N'89340932', NULL, 1, 1)
INSERT [dbo].[Estudiantes] ([carnet_estudiante], [nombre_estudiante], [apellido_estudiante], [documento_estudiante], [procedencia_estudiante], [contacto_estudiante], [INE_estudiante], [id_estadoEstudiante], [id_carrera]) VALUES (2023007, N'Eriberto Steve', N'Edmons', N'44123123-0', N'Instituto Técnico Ricaldone', N'8923-1234', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Estudiantes] OFF
GO
SET IDENTITY_INSERT [dbo].[Facultad] ON 

INSERT [dbo].[Facultad] ([id_facultad], [nombre_facultad], [encargado_faculad]) VALUES (1, N'Ingenierías', N'Luis Alonso Cabrera')
INSERT [dbo].[Facultad] ([id_facultad], [nombre_facultad], [encargado_faculad]) VALUES (2, N'Ciencias Económicas', N'Ana Luisa Deras')
INSERT [dbo].[Facultad] ([id_facultad], [nombre_facultad], [encargado_faculad]) VALUES (3, N'Ciencias y Humanidades', N'Juan Carlos Grande')
INSERT [dbo].[Facultad] ([id_facultad], [nombre_facultad], [encargado_faculad]) VALUES (4, N'Facultad de Aeronáutica', N'Nestor Enrrique Salamanca')
INSERT [dbo].[Facultad] ([id_facultad], [nombre_facultad], [encargado_faculad]) VALUES (5, N'Ciencias Básicas', N'Nestor Enrrique Salamanca')
SET IDENTITY_INSERT [dbo].[Facultad] OFF
GO
SET IDENTITY_INSERT [dbo].[Matriculas] ON 

INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (1, 2, 2023000, 1, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (2, 4, 2023001, 4, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (3, 14, 2023005, 3, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (4, 3, 2023003, 5, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (5, 2, 2023000, 1, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (6, 5, 2023001, 4, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (7, 16, 2023005, 3, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (8, 5, 2023000, 1, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (9, 9, 2023001, 4, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (10, 9, 2023003, 5, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (11, 8, 2023000, 1, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (12, 1, 2023003, 5, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (13, 17, 2023001, 4, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (14, 7, 2023003, 5, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (15, 6, 2023005, 3, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[Matriculas] ([id_matricula], [id_asignatura], [id_estudiante], [id_carrera], [fecha_matricula]) VALUES (16, 6, 2023004, 5, CAST(N'2023-09-06' AS Date))
SET IDENTITY_INSERT [dbo].[Matriculas] OFF
GO
SET IDENTITY_INSERT [dbo].[Notas] ON 

INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (1, 2, 2023000, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (2, 4, 2023001, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (3, 14, 2023005, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (4, 3, 2023003, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (5, 2, 2023000, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (6, 5, 2023001, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (7, 16, 2023005, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (8, 5, 2023000, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (9, 9, 2023001, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (10, 9, 2023003, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (11, 8, 2023000, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (12, 1, 2023003, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (13, 17, 2023001, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (14, 7, 2023003, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (15, 6, 2023005, 0)
INSERT [dbo].[Notas] ([id_nota], [id_asignatura], [id_estudiante], [nota_obtenida]) VALUES (16, 6, 2023004, 0)
SET IDENTITY_INSERT [dbo].[Notas] OFF
GO
SET IDENTITY_INSERT [dbo].[Registros] ON 

INSERT [dbo].[Registros] ([id_registro], [id_estudiante], [id_carrera], [pagos], [fecha_registro]) VALUES (1, 2023000, 1, 115.99, CAST(N'2023-09-06' AS Date))
SET IDENTITY_INSERT [dbo].[Registros] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoCarrera] ON 

INSERT [dbo].[TipoCarrera] ([id_tipoCarrera], [tipoCarrera]) VALUES (1, N'Ingenierías')
INSERT [dbo].[TipoCarrera] ([id_tipoCarrera], [tipoCarrera]) VALUES (2, N'Licenciaturas')
INSERT [dbo].[TipoCarrera] ([id_tipoCarrera], [tipoCarrera]) VALUES (3, N'Técnicos')
INSERT [dbo].[TipoCarrera] ([id_tipoCarrera], [tipoCarrera]) VALUES (4, N'Diplomados')
SET IDENTITY_INSERT [dbo].[TipoCarrera] OFF
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD  CONSTRAINT [FK_estadoAsignatura] FOREIGN KEY([id_estadoAsignatura])
REFERENCES [dbo].[EstadoAsignatura] ([id_estadoAsignatura])
GO
ALTER TABLE [dbo].[Asignatura] CHECK CONSTRAINT [FK_estadoAsignatura]
GO
ALTER TABLE [dbo].[BitacoraEstudiantil]  WITH CHECK ADD  CONSTRAINT [FK_bitacora] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[Estudiantes] ([carnet_estudiante])
GO
ALTER TABLE [dbo].[BitacoraEstudiantil] CHECK CONSTRAINT [FK_bitacora]
GO
ALTER TABLE [dbo].[BitacoraEstudiantil]  WITH CHECK ADD  CONSTRAINT [FK_estadoAsignaturaInscita] FOREIGN KEY([id_estadoAsignaturaInscrita])
REFERENCES [dbo].[EstadoAsignaturaInscrita] ([id_asignaturaInscrita])
GO
ALTER TABLE [dbo].[BitacoraEstudiantil] CHECK CONSTRAINT [FK_estadoAsignaturaInscita]
GO
ALTER TABLE [dbo].[Candidatos]  WITH CHECK ADD  CONSTRAINT [FK_carreras] FOREIGN KEY([id_carrera])
REFERENCES [dbo].[Carreras] ([id_carrera])
GO
ALTER TABLE [dbo].[Candidatos] CHECK CONSTRAINT [FK_carreras]
GO
ALTER TABLE [dbo].[Candidatos]  WITH CHECK ADD  CONSTRAINT [FK_estadoCandidato] FOREIGN KEY([id_estadoCandidato])
REFERENCES [dbo].[EstadoCandidato] ([id_estadoCandidato])
GO
ALTER TABLE [dbo].[Candidatos] CHECK CONSTRAINT [FK_estadoCandidato]
GO
ALTER TABLE [dbo].[Carreras]  WITH CHECK ADD  CONSTRAINT [FK_facultad] FOREIGN KEY([id_facultad])
REFERENCES [dbo].[Facultad] ([id_facultad])
GO
ALTER TABLE [dbo].[Carreras] CHECK CONSTRAINT [FK_facultad]
GO
ALTER TABLE [dbo].[Carreras]  WITH CHECK ADD  CONSTRAINT [FK_tipoCarrera] FOREIGN KEY([id_tipoCarrera])
REFERENCES [dbo].[TipoCarrera] ([id_tipoCarrera])
GO
ALTER TABLE [dbo].[Carreras] CHECK CONSTRAINT [FK_tipoCarrera]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_estadoEstudiante] FOREIGN KEY([id_estadoEstudiante])
REFERENCES [dbo].[EstadoEstudiantes] ([id_estadoEstudiante])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_estadoEstudiante]
GO
ALTER TABLE [dbo].[Matriculas]  WITH CHECK ADD  CONSTRAINT [FK_asignatura] FOREIGN KEY([id_asignatura])
REFERENCES [dbo].[Asignatura] ([id_asignatura])
GO
ALTER TABLE [dbo].[Matriculas] CHECK CONSTRAINT [FK_asignatura]
GO
ALTER TABLE [dbo].[Matriculas]  WITH CHECK ADD  CONSTRAINT [FK_matricula] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[Estudiantes] ([carnet_estudiante])
GO
ALTER TABLE [dbo].[Matriculas] CHECK CONSTRAINT [FK_matricula]
GO
ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [FK_notas] FOREIGN KEY([id_asignatura])
REFERENCES [dbo].[Asignatura] ([id_asignatura])
GO
ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [FK_notas]
GO
ALTER TABLE [dbo].[Registros]  WITH CHECK ADD  CONSTRAINT [FK_estudiante] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[Estudiantes] ([carnet_estudiante])
GO
ALTER TABLE [dbo].[Registros] CHECK CONSTRAINT [FK_estudiante]
GO
ALTER TABLE [dbo].[Registros]  WITH CHECK ADD  CONSTRAINT [FK_registro] FOREIGN KEY([id_carrera])
REFERENCES [dbo].[Carreras] ([id_carrera])
GO
ALTER TABLE [dbo].[Registros] CHECK CONSTRAINT [FK_registro]
GO
/****** Object:  StoredProcedure [dbo].[CheckDataRegister]    Script Date: 6/9/2023 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ******************************  Procedimiento para validar los registros de un Estudiante ****************************** 
CREATE PROCEDURE [dbo].[CheckDataRegister] (@carnet INT, @carrera_id INT)
AS
BEGIN
	IF @carrera_id = 1 AND EXISTS (SELECT 1 FROM [dbo].[Registros] WHERE id_estudiante = @carnet) OR 
		@carrera_id = 2 AND EXISTS (SELECT 1 FROM [dbo].[Registros] WHERE id_estudiante = @carnet) OR 
		 @carrera_id = 3 AND EXISTS (SELECT 1 FROM [dbo].[Registros] WHERE id_estudiante = @carnet)
	BEGIN
		PRINT 'El estudiante ya pertenece a una carrera'
	END
	-- En el caso de que no coincida con los primeros datos evaluamos si es un diplomado y si no se ha inscrito en más de 2 de los mismos 
	ELSE 
	BEGIN
		DECLARE @max INT; SET @max = 2;

		IF @carrera_id = 4 AND (SELECT COUNT (*) AS Cantidad FROM [dbo].[Registros] WHERE id_estudiante = @carnet) >= @max OR
			@carrera_id = 5 AND (SELECT COUNT (*) AS Cantidad FROM [dbo].[Registros] WHERE id_estudiante = @carnet) >= @max OR
			 @carrera_id = 6 AND (SELECT COUNT (*) AS Cantidad FROM [dbo].[Registros] WHERE id_estudiante = @carnet) >= @max
		BEGIN
			PRINT 'El estudiante ya lleva dos diplomados o una carrera y un diplomado.'
		END
		ELSE
			BEGIN
				PRINT 'Registro realizado correctamente.'
				-- Insertar el registro
				INSERT INTO [dbo].[Registros] (id_estudiante, id_carrera, pagos, fecha_registro)
				VALUES (@carnet, @carrera_id, 115.99, GETDATE())
			END
		END
	END
GO
USE [master]
GO
ALTER DATABASE [Universidad] SET  READ_WRITE 
GO
