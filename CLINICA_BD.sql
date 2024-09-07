USE [master]
GO
/****** Object:  Database [CLINICA_BD]    Script Date: 07/09/2024 16:01:33 ******/
CREATE DATABASE [CLINICA_BD]


GO
ALTER DATABASE [CLINICA_BD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CLINICA_BD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CLINICA_BD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CLINICA_BD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CLINICA_BD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CLINICA_BD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CLINICA_BD] SET ARITHABORT OFF 
GO
ALTER DATABASE [CLINICA_BD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CLINICA_BD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CLINICA_BD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CLINICA_BD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CLINICA_BD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CLINICA_BD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CLINICA_BD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CLINICA_BD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CLINICA_BD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CLINICA_BD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CLINICA_BD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CLINICA_BD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CLINICA_BD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CLINICA_BD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CLINICA_BD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CLINICA_BD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CLINICA_BD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CLINICA_BD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CLINICA_BD] SET  MULTI_USER 
GO
ALTER DATABASE [CLINICA_BD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CLINICA_BD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CLINICA_BD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CLINICA_BD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CLINICA_BD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CLINICA_BD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CLINICA_BD] SET QUERY_STORE = ON
GO
ALTER DATABASE [CLINICA_BD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CLINICA_BD]
GO
/****** Object:  Table [dbo].[ESPECIALIDADES]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESPECIALIDADES](
	[idEsp_E] [int] IDENTITY(1,1) NOT NULL,
	[nombre_E] [varchar](30) NOT NULL,
 CONSTRAINT [PK_ESPECIALIDAD] PRIMARY KEY CLUSTERED 
(
	[idEsp_E] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCALIDADES]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCALIDADES](
	[idLocalidad_L] [int] IDENTITY(1,1) NOT NULL,
	[idProvincias_L] [int] NOT NULL,
	[nombre_L] [varchar](20) NOT NULL,
 CONSTRAINT [PK_LOCALIDADES] PRIMARY KEY CLUSTERED 
(
	[idLocalidad_L] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEDICOS]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDICOS](
	[legajo_M] [char](5) NOT NULL,
	[localidad_M] [int] NOT NULL,
	[provincia_M] [int] NOT NULL,
	[especialidad_M] [int] NOT NULL,
	[idUsuario_M] [int] NOT NULL,
	[nombre_M] [varchar](25) NOT NULL,
	[Apellido_M] [varchar](25) NOT NULL,
	[DNI_M] [varchar](8) NOT NULL,
	[sexo_M] [varchar](12) NULL,
	[fechaNacimiento_M] [datetime] NULL,
	[direccion_M] [varchar](25) NULL,
	[correo_M] [varchar](30) NULL,
	[telefono_M] [varchar](30) NULL,
	[diasAtencion_M] [varchar](50) NULL,
	[horariosAtencion] [varchar](20) NULL,
	[nacionalidad_M] [varchar](25) NULL,
	[Estado_M] [bit] NULL,
 CONSTRAINT [PK_MEDICO] PRIMARY KEY CLUSTERED 
(
	[legajo_M] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACIENTES]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACIENTES](
	[DNI_P] [varchar](8) NOT NULL,
	[sexo_P] [varchar](12) NULL,
	[localidad_P] [int] NOT NULL,
	[provincia_P] [int] NOT NULL,
	[nombre_P] [varchar](25) NOT NULL,
	[Apellido_P] [varchar](25) NOT NULL,
	[fechaNacimiento_P] [datetime] NULL,
	[direccion_P] [varchar](25) NULL,
	[correo_P] [varchar](30) NULL,
	[telefono_P] [varchar](30) NULL,
	[nacionalidad_P] [varchar](25) NULL,
	[Estado_P] [bit] NOT NULL,
 CONSTRAINT [PK_PACIENTES] PRIMARY KEY CLUSTERED 
(
	[DNI_P] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIAS]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIAS](
	[idProvincia_PR] [int] IDENTITY(1,1) NOT NULL,
	[nombre_PR] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PROVINCIAS] PRIMARY KEY CLUSTERED 
(
	[idProvincia_PR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLES]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[idRol_R] [int] IDENTITY(1,1) NOT NULL,
	[nombre_R] [varchar](15) NOT NULL,
 CONSTRAINT [PKROL] PRIMARY KEY CLUSTERED 
(
	[idRol_R] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TURNOS]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TURNOS](
	[idTurno_T] [int] IDENTITY(1,1) NOT NULL,
	[idEsp_T] [int] NOT NULL,
	[legajoMedico_T] [char](5) NOT NULL,
	[DniPac_T] [varchar](8) NULL,
	[HORARIO_T] [varchar](15) NULL,
	[observacion_T] [varchar](100) NULL,
	[presencialidad_T] [varchar](50) NULL,
	[fecha_T] [datetime] NULL,
 CONSTRAINT [PK_TURNOS] PRIMARY KEY CLUSTERED 
(
	[idTurno_T] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[idUsuario_U] [int] IDENTITY(1,1) NOT NULL,
	[idRol_U] [int] NOT NULL,
	[usuario_U] [varchar](15) NOT NULL,
	[contrasena_U] [varchar](15) NOT NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[idUsuario_U] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ESPECIALIDADES] ON 

INSERT [dbo].[ESPECIALIDADES] ([idEsp_E], [nombre_E]) VALUES (1, N'Pedriatria')
INSERT [dbo].[ESPECIALIDADES] ([idEsp_E], [nombre_E]) VALUES (2, N'Ginecologia')
INSERT [dbo].[ESPECIALIDADES] ([idEsp_E], [nombre_E]) VALUES (3, N'Cardiologia')
INSERT [dbo].[ESPECIALIDADES] ([idEsp_E], [nombre_E]) VALUES (4, N'Dermatologia')
INSERT [dbo].[ESPECIALIDADES] ([idEsp_E], [nombre_E]) VALUES (5, N'Hematologia')
INSERT [dbo].[ESPECIALIDADES] ([idEsp_E], [nombre_E]) VALUES (6, N'Urologia')
INSERT [dbo].[ESPECIALIDADES] ([idEsp_E], [nombre_E]) VALUES (7, N'Traumatologia')
INSERT [dbo].[ESPECIALIDADES] ([idEsp_E], [nombre_E]) VALUES (8, N'Oftalmologia')
INSERT [dbo].[ESPECIALIDADES] ([idEsp_E], [nombre_E]) VALUES (9, N'Neurologia')
INSERT [dbo].[ESPECIALIDADES] ([idEsp_E], [nombre_E]) VALUES (10, N'Geriatria')
SET IDENTITY_INSERT [dbo].[ESPECIALIDADES] OFF
GO
SET IDENTITY_INSERT [dbo].[LOCALIDADES] ON 

INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (1, 1, N'La Plata')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (2, 1, N'Tigre')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (3, 1, N'Mar del Plata')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (4, 1, N'Bahia Blanca')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (5, 1, N'Tandil')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (6, 1, N'Vicente Lopez')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (7, 1, N'Olivos')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (8, 1, N'San Isidro')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (9, 1, N'Quilmes')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (10, 1, N'Lujan')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (11, 1, N'Campana')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (12, 1, N'Escobar')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (13, 2, N'San fernando')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (14, 2, N'Valle Viejo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (15, 2, N'Tinogasta')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (16, 2, N'Belen')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (17, 3, N'Resistencia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (18, 3, N'Barranqueras')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (19, 3, N'Charata')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (20, 3, N'General San Martin')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (21, 4, N'Rawson')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (22, 4, N'Gaiman')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (23, 4, N'Esquel')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (24, 4, N'Dolavon')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (25, 4, N'Puerto Madryn')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (26, 5, N'Villa Carlos Paz')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (27, 5, N'Rio Cuarto')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (28, 5, N'Alta Gracia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (29, 5, N'Villa Maria')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (30, 6, N'Goya')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (31, 6, N'Mercedes')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (32, 6, N'Paso de los Libres')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (33, 6, N'Curuzu Cuatia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (34, 7, N'Parana')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (35, 7, N'Concordia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (36, 7, N'Gualeguaychu')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (37, 7, N'Villaguay')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (38, 8, N'Clorinda')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (39, 8, N'Pirane')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (40, 8, N'Las Lomitas')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (41, 8, N'El Colorado')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (42, 9, N'Palpala')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (43, 9, N'Humahuaca')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (44, 9, N'San Pedro de Jujuy')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (46, 9, N'San Salvador')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (47, 10, N'Santa Rosa')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (48, 10, N'General Pico')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (49, 10, N'Eduardo Castex')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (50, 10, N'Santa Isabel')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (51, 11, N'Chilecito')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (52, 11, N'Chamical')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (53, 11, N'Villa Union')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (54, 11, N'Aimogasta')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (55, 12, N'Godoy Cruz')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (56, 12, N'San Rafael')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (57, 12, N'Maipu')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (58, 12, N'Lujan de Cuyo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (59, 13, N'Posadas')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (60, 13, N'Obera')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (61, 13, N'Eldorado')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (62, 13, N'Puerto Iguazu')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (63, 13, N'Apostoles')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (64, 14, N'Cutral Co')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (65, 14, N'Plaza Huincul')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (66, 14, N'Zapala')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (67, 15, N'Viedma')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (68, 15, N'General Roca')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (70, 15, N'Cipolletti')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (71, 15, N'Allen')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (72, 16, N'Tartagal')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (73, 16, N'Cafayate')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (74, 16, N'Metan')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (75, 17, N'Rivadavia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (76, 17, N'Chimbas')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (77, 17, N'Caucete')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (78, 17, N'Pocito')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (79, 18, N'Villa Mercedes')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (80, 18, N'Merlo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (81, 18, N'La Punta')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (82, 18, N'Juana Koslay')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (83, 19, N'Rio Gallegos')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (84, 19, N'Caleta Olivia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (85, 19, N'Rio Turbio')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (86, 19, N'Puerto Deseado')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (87, 19, N'El Calafate')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (88, 20, N'Rosario')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (89, 20, N'Rafaela')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (90, 20, N'Venado Tuerto')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (91, 20, N'Reconquista')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (92, 21, N'La Banda')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (93, 21, N'Frias')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (94, 21, N'Añatuya')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (95, 22, N'Ushuaia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (96, 22, N'Rio Grande')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (97, 22, N'Tolhuin')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (98, 22, N'San Sebastian')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (99, 22, N'Puerto Almanza')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (100, 23, N'Yerba Buena')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (101, 23, N'Tafi Viejo')
GO
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (102, 23, N'Concepcion')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (103, 23, N'Lules')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincias_L], [nombre_L]) VALUES (104, 23, N'Famailla')
SET IDENTITY_INSERT [dbo].[LOCALIDADES] OFF
GO
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12345', 83, 19, 1, 18, N'Maximo', N'Corvalan', N'45345678', N'Masculino', CAST(N'2004-03-10T00:00:00.000' AS DateTime), N'Av. viva 123', N'maxicorva@gmail.com', N'1112345678', N'Jueves-Viernes', N'12-15', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12346', 2, 1, 6, 2, N'Lucas', N'Caceres', N'45431035', N'Masculino', CAST(N'2004-09-22T00:00:00.000' AS DateTime), N'Tigre 323', N'lucascaceres@gmail.com', N'1135234380', N'Lunes-Martes-Sabado', N'18-21', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12347', 65, 14, 1, 3, N'Ariel', N'Corvalan', N'45232389', N'Masculino', CAST(N'2004-03-12T00:00:00.000' AS DateTime), N'LasMagnolias 456', N'arielpereira@gmail.com', N'1165306328', N'Martes-Jueves-Viernes-Sabado', N'15-18', N'Chilena', 0)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12348', 36, 7, 3, 4, N'Astrid', N'Naivirt', N'45789621', N'Femenino', CAST(N'2003-08-22T00:00:00.000' AS DateTime), N'Las amapolas 122', N'astridn@gmail.com', N'1135234380', N'Martes-Jueves-Sabado', N'12-15', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12349', 75, 17, 4, 5, N'Daniel', N'Martinez', N'56675675', N'Masculino', CAST(N'2004-11-08T00:00:00.000' AS DateTime), N'Oruro 111', N'danimart@gmail.com', N'1151231321', N'Martes', N'12-15', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12350', 1, 1, 5, 6, N'Mariano', N'Herrera', N'27896541', N'Masculino', CAST(N'1970-05-15T00:00:00.000' AS DateTime), N'Las Rosas 198', N'marianoh@gmail.com', N'1141654564', N'Lunes', N'12-15', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12351', 1, 1, 2, 7, N'Lucia', N'Martinez', N'32456841', N'Femenino', CAST(N'1982-06-02T00:00:00.000' AS DateTime), N'Oruro 123', N'luciamartinez@gmail.com', N'1156455440', N'Martes', N'12-15', N'Argentina', 0)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12352', 1, 1, 1, 8, N'Carlos', N'Perez', N'25483920', N'Masculino', CAST(N'1975-12-08T00:00:00.000' AS DateTime), N'Francia 675', N'carlosperez@outlook.COM', N'1134234230', N'Lunes', N'18-21', N'Uruguay', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12353', 1, 1, 2, 9, N'Maria', N'Garcia', N'20867657', N'Femenino', CAST(N'1970-02-23T00:00:00.000' AS DateTime), N'Pisco 167', N'mariagarcia@gmail.com', N'1123456789', N'Lunes', N'12-15', N'Uruguay', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12354', 1, 1, 1, 10, N'Camila', N'Fernandez', N'33876786', N'Femenino', CAST(N'1983-10-01T00:00:00.000' AS DateTime), N'Oruro 606', N'camifernandez@gmail.com', N'1180121212', N'Martes', N'12-15', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12355', 1, 1, 2, 11, N'Soledad', N'Enriquez', N'18657567', N'Femenino', CAST(N'1968-08-13T00:00:00.000' AS DateTime), N'Las Madreselvas 121', N'soledadenriq@gmail.com', N'1178978970', N'Martes', N'12-15', N'Peru', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12356', 13, 1, 6, 12, N'Carlos', N'Fernandez', N'20232323', N'Masculino', CAST(N'1970-09-29T00:00:00.000' AS DateTime), N'Pisco 3434', N'carlosfernandez@outlook.com', N'1145123457', N'Viernes', N'9-12', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12357', 12, 1, 7, 13, N'Carla', N'Bareiro', N'35892523', N'Femenino', CAST(N'1985-03-29T00:00:00.000' AS DateTime), N'Tigre 3434', N'carlabareiro@outlook.com', N'1100593457', N'Lunes-Martes-Viernes', N'9-12', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12358', 34, 7, 8, 14, N'Susana', N'Caceres', N'22001236', N'Femenino', CAST(N'1972-09-08T00:00:00.000' AS DateTime), N'Alemania 598', N'susancaceres@gmail.com', N'1145102858', N'Viernes-Sabado', N'18-21', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12359', 35, 7, 8, 15, N'Victor', N'Garcia', N'33854923', N'Masculino', CAST(N'1985-01-16T00:00:00.000' AS DateTime), N'Las Amapolas 8954', N'victorgarcia@gmail.com', N'1155623457', N'Martes-Jueves-Sabado', N'12-15', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12360', 27, 5, 9, 16, N'Analia', N'Jimenez', N'27236780', N'Femeninino', CAST(N'1979-05-19T00:00:00.000' AS DateTime), N'Av Constitucion 1434', N'analiajimenez@gmail.com', N'1145102017', N'Martes-Miercoles-Jueves', N'15-18', N'Argentina', 0)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'12361', 27, 5, 10, 17, N'Ramiro', N'Chapur', N'38485201', N'Masculino', CAST(N'1990-10-05T00:00:00.000' AS DateTime), N'Tigre 545', N'ramirochapur@outlook.com', N'1189883457', N'Viernes-Sabado', N'15-18', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'19427', 7, 1, 9, 25, N'Joaco', N'Canullo', N'48934949', N'M', CAST(N'1999-01-15T00:00:00.000' AS DateTime), N'alterna 720', N'joacocanullo@gmail.com', N'1135299322', N'Lunes-Miercoles-Viernes', N'15-18', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'20499', 65, 14, 1, 19, N'Franco', N'Barreta', N'65341187', N'M', CAST(N'1999-07-15T00:00:00.000' AS DateTime), N'Cuertelo 864', N'francobarreta@gmail.com', N'1153884387', N'Lunes-Viernes-Sabado', N'18-21', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'27775', 64, 14, 1, 27, N'Marcos', N'Perez', N'45578963', N'M', CAST(N'2002-05-05T00:00:00.000' AS DateTime), N'Amapolas 323', N'marcos@gmail.com', N'1154584745', N'Miercoles', N'9-12', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'28666', 93, 21, 6, 28, N'Maximo', N'Corvalan', N'45665243', N'Masculino', CAST(N'2000-02-10T00:00:00.000' AS DateTime), N'Oruro 174', N'corvalan@gmail.com', N'1132653265', N'Miercoles', N'18-21', N'Argentino', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'31124', 8, 1, 3, 21, N'Agostina', N'Narvaez', N'48911018', N'F', CAST(N'1997-12-26T00:00:00.000' AS DateTime), N'Cuyo 742', N'agostinanarvaez@gmail.com', N'1152834082', N'Martes-Miercoles-Viernes', N'9-12', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'37500', 2, 1, 2, 20, N'Claudio', N'Lopez', N'45390183', N'Masculino', CAST(N'2001-01-15T00:00:00.000' AS DateTime), N'Pacheco 643', N'claudiolopez@gmail.com', N'1180324480', N'Martes-Jueves', N'12-15', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'42200', 7, 1, 5, 23, N'Angie', N'Rojas', N'65398943', N'F', CAST(N'2001-06-15T00:00:00.000' AS DateTime), N'Eleven 783', N'angierojas@gmail.com', N'1138274781', N'Martes-Jueves-Viernes', N'12-15', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'44149', 2, 1, 10, 26, N'Ezequiel', N'Silva', N'40939948', N'M', CAST(N'2000-06-15T00:00:00.000' AS DateTime), N'Troncos 742', N'ezequielsilva@gmail.com', N'1181281391', N'Miercoles', N'9-12', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'47225', 1, 1, 4, 22, N'Gabriel', N'Abraha', N'47081930', N'Masculino', CAST(N'1997-08-15T00:00:00.000' AS DateTime), N'Costa 521', N'lucascaceres3271@gmail.com', N'1150836390', N'Lunes-Martes-Jueves-Viernes', N'9-12', N'Argentina', 1)
INSERT [dbo].[MEDICOS] ([legajo_M], [localidad_M], [provincia_M], [especialidad_M], [idUsuario_M], [nombre_M], [Apellido_M], [DNI_M], [sexo_M], [fechaNacimiento_M], [direccion_M], [correo_M], [telefono_M], [diasAtencion_M], [horariosAtencion], [nacionalidad_M], [Estado_M]) VALUES (N'49234', 59, 13, 7, 24, N'Thiago', N'Correa', N'62938320', N'M', CAST(N'2002-07-15T00:00:00.000' AS DateTime), N'dorado 642', N'thiagocorrea@gmail.com', N'1122238380', N'Lunes-Sabado', N'12-15', N'Argentina', 1)
GO
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'18256478', N'Masculino', 36, 7, N'Lionel', N'Messi', CAST(N'1968-07-22T00:00:00.000' AS DateTime), N'La Paz 1921', N'liomessi@gmail.com', N'1122369840', N'Argentina', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'21855877', N'Femenino', 9, 1, N'Pabla', N'Ramirez', CAST(N'1970-02-26T00:00:00.000' AS DateTime), N'Las Magnolias 2003', N'blitaramirez@gmail.com', N'1154789630', N'Uruguay', 0)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'22569874', N'Masculino', 4, 1, N'Facundo', N'Montiel', CAST(N'1972-11-30T00:00:00.000' AS DateTime), N'Las Violetas 235', N'facumontiel@gmail.com', N'1100245893', N'Argentina', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'26896578', N'Masculino', 4, 1, N'Rodrigo', N'Martinez', CAST(N'1975-12-31T00:00:00.000' AS DateTime), N'Pisco 1521', N'rodrimartinez@outlook.com', N'1140203268', N'Peru', 0)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'30335693', N'Femenino', 24, 4, N'Ariana', N'Galvez', CAST(N'1994-06-09T00:00:00.000' AS DateTime), N'Peru 1268', N'arianagalvez@gmail.com', N'1114563025', N'Peru', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'33005874', N'Masculino', 1, 9, N'Nicolas', N'Gutierrez', CAST(N'1996-08-05T00:00:00.000' AS DateTime), N'Francia 541', N'nicogutierrez@gmail.com', N'1145661689', N'Uruguay', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'34896551', N'Femenino', 10, 1, N'Victoria', N'Castellani', CAST(N'1992-02-11T00:00:00.000' AS DateTime), N'Las Rosas 641', N'vickycastell@gmail.com', N'1156892454', N'Uruguay', 0)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'39452324', N'Masculino', 80, 18, N'Juan', N'Ramirez', CAST(N'1998-05-07T00:00:00.000' AS DateTime), N'El Talar 741', N'juanramirez@outlook.com', N'1312523200', N'Argentina', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'40841248', N'Masculino', 8, 1, N'Maximo', N'Corvalan', CAST(N'2001-04-02T00:00:00.000' AS DateTime), N'Bolivia 1421', N'maxicorva234@gmail.com', N'11568941', N'Argentina', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'4125691', N'Masculino', 85, 19, N'Estanislao', N'Ramirez', CAST(N'2003-02-10T00:00:00.000' AS DateTime), N'Pensar 323', N'Estani@gmail.com', N'116556956', N'Peruana', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'41257410', N'Femenino', 1, 3, N'Catalina', N'Rosalia', CAST(N'2001-02-01T00:00:00.000' AS DateTime), N'Peru 3032', N'catalinarosas@gmail.com', N'1166895210', N'Argentina', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'42982003', N'Femenino', 12, 1, N'Astrid', N'Naivirt', CAST(N'2002-01-09T00:00:00.000' AS DateTime), N'Francia 569', N'astridn@gmail.com', N'1157896530', N'Argentina', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'45148998', N'Masculino', 1, 1, N'Lucas', N'Caceres', CAST(N'2008-09-22T00:00:00.000' AS DateTime), N'El Talar 123', N'lucascaceres3271@gmail.com', N'1135234380', N'Argentina', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'45265149', N'Femenino', 14, 2, N'Lucy', N'Hernandez', CAST(N'2003-03-05T00:00:00.000' AS DateTime), N'Los Jazmines 1621', N'lucyhernandez@gmail.com', N'1145848890', N'Argentina', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'45801023', N'Femenino', 80, 18, N'Tamara', N'Barrios', CAST(N'2003-06-18T00:00:00.000' AS DateTime), N'Corrales 456', N'tamarabarrios@gmail.com', N'1135239986', N'Argentina', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'45931035', N'Femenino', 80, 18, N'Mariana', N'Corvalan', CAST(N'2003-12-10T00:00:00.000' AS DateTime), N'Las Madreselvas 753', N'maricorva2341@gmail.com', N'1135234380', N'Argentina', 0)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'47256301', N'Masculino', 36, 7, N'Lautaro', N'Pereira', CAST(N'2007-07-04T00:00:00.000' AS DateTime), N'La Paz 1921', N'lautipereira@gmail.com', N'1124568741', N'Bolivia', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'48231848', N'Masculino', 1, 1, N'Ariel', N'Pereira', CAST(N'2008-09-01T00:00:00.000' AS DateTime), N'Peru 121', N'arielpereira@outlook.com', N'1148484840', N'Peru', 1)
INSERT [dbo].[PACIENTES] ([DNI_P], [sexo_P], [localidad_P], [provincia_P], [nombre_P], [Apellido_P], [fechaNacimiento_P], [direccion_P], [correo_P], [telefono_P], [nacionalidad_P], [Estado_P]) VALUES (N'49931995', N'Masculino', 39, 8, N'Javier', N'Tavarez', CAST(N'2006-01-15T00:00:00.000' AS DateTime), N'palma 563', N'javiertavarez@gmail.com', N'1130200089', N'Argentina', 0)
GO
SET IDENTITY_INSERT [dbo].[PROVINCIAS] ON 

INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (1, N'Buenos Aires')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (2, N'Catamarca')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (3, N'Chaco')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (4, N'Chubut')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (5, N'Cordoba')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (6, N'Corrientes')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (7, N'Entre Rios')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (8, N'Formosa')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (9, N'Jujuy')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (10, N'La Pampa')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (11, N'La Rioja')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (12, N'Mendoza')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (13, N'Misiones')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (14, N'Neuquen')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (15, N'Rio Negro')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (16, N'Salta')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (17, N'San Juan')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (18, N'San Luis')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (19, N'Santa Cruz')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (20, N'Santa Fe')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (21, N'Santiago del Estero')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (22, N'Tierra del Fuego')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PR], [nombre_PR]) VALUES (23, N'Tucuman')
SET IDENTITY_INSERT [dbo].[PROVINCIAS] OFF
GO
SET IDENTITY_INSERT [dbo].[ROLES] ON 

INSERT [dbo].[ROLES] ([idRol_R], [nombre_R]) VALUES (1, N'Administrador')
INSERT [dbo].[ROLES] ([idRol_R], [nombre_R]) VALUES (2, N'Medico')
SET IDENTITY_INSERT [dbo].[ROLES] OFF
GO
SET IDENTITY_INSERT [dbo].[TURNOS] ON 

INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (2, 6, N'12356', N'45148998', N'9', N'', N'Presente', CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (3, 3, N'12348', N'39452324', N'12', N'', N'Presente', CAST(N'2020-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (4, 3, N'12348', N'45931035', N'14', NULL, N'Ausente', CAST(N'2021-08-20T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (5, 3, N'12348', N'42982003', N'15', NULL, N'Ausente', CAST(N'2021-08-20T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (6, 1, N'12347', N'21855877', N'17', NULL, N'Presente', CAST(N'2022-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (7, 4, N'12349', N'22569874', N'12', NULL, N'Presente', CAST(N'2022-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (8, 7, N'12357', N'48231848', N'10', NULL, N'Ausente', CAST(N'2022-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (9, 1, N'12345', N'45801023', N'13', N'', N'Presente', CAST(N'2023-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (10, 4, N'12349', N'41257410', N'15', NULL, N'Presente', CAST(N'2023-06-22T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (11, 3, N'12348', N'33005874', N'13', NULL, N'Presente', CAST(N'2023-06-22T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (12, 8, N'12359', N'30335693', N'14', NULL, N'Ausente', CAST(N'2023-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (13, 4, N'12349', N'47256301', N'15', NULL, N'Presente', CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (14, 7, N'12357', N'40841248', N'10', NULL, N'Ausente', CAST(N'2024-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (15, 5, N'12350', N'39452324', N'14', NULL, N'Ausente', CAST(N'2024-07-11T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (16, 4, N'12349', N'45931035', N'12', NULL, N'Presente', CAST(N'2024-07-11T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (17, 8, N'12359', N'45265149', N'14', NULL, NULL, CAST(N'2024-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (18, 9, N'12360', N'47256301', N'17', N'hola', NULL, CAST(N'2024-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (19, 10, N'12361', N'18256478', N'18', NULL, NULL, CAST(N'2024-07-26T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (20, 2, N'12351', N'30335693', N'15', NULL, NULL, CAST(N'2024-07-27T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (21, 1, N'12345', N'18256478', N'12', NULL, NULL, CAST(N'2024-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (22, 1, N'12345', N'22569874', N'12', N'loremp', N'Presente', CAST(N'2024-07-25T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (23, 1, N'12345', N'30335693', N'13', N'', N'Ausente', CAST(N'2024-07-25T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (24, 1, N'12345', N'33005874', N'15', NULL, NULL, CAST(N'2024-07-26T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (25, 1, N'12345', N'45148998', N'12', NULL, NULL, CAST(N'2024-08-16T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (26, 1, N'12345', N'48231848', N'14', NULL, NULL, CAST(N'2024-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (27, 6, N'12356', N'18256478', N'9', NULL, NULL, CAST(N'2024-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[TURNOS] ([idTurno_T], [idEsp_T], [legajoMedico_T], [DniPac_T], [HORARIO_T], [observacion_T], [presencialidad_T], [fecha_T]) VALUES (28, 1, N'12345', N'41257410', N'12', NULL, NULL, CAST(N'2024-07-26T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TURNOS] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIOS] ON 

INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (1, 1, N'admin', N'UTNFRGP')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (2, 2, N'Lucas', N'riocuartoA11')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (3, 2, N'Ariel', N'arielPereira1')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (4, 2, N'Astrid', N'astridN22')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (5, 2, N'Daniel', N'danielM2')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (6, 2, N'Mariano', N'marianO123')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (7, 2, N'Lucia', N'Ramiro34')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (8, 2, N'Carlos', N'carlosS56')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (9, 2, N'Maria', N'Maria123')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (10, 2, N'Camila', N'camilaA3')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (11, 2, N'Soledad', N'soledaD22')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (12, 2, N'Carlos', N'carlitoS11')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (13, 2, N'Carla', N'carlitA45')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (14, 2, N'Susana', N'susanAa42')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (15, 2, N'Victor', N'victOr3')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (16, 2, N'Analia', N'anaLia1')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (17, 2, N'Ramiro', N'ramirOo89')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (18, 2, N'Maximo', N'maximoCorva1')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (19, 2, N'Franco', N'Franco99')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (20, 2, N'Claudio', N'Claudio50')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (21, 2, N'Agostina', N'Agostina24')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (22, 2, N'Gabriel', N'Gabriel32')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (23, 2, N'Angie', N'Angie323')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (24, 2, N'Thiago', N'Thiago70')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (25, 2, N'Joaco', N'Joaco123')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (26, 2, N'Ezequiel', N'Ezequiel81')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (27, 2, N'Marcos', N'Marcos75')
INSERT [dbo].[USUARIOS] ([idUsuario_U], [idRol_U], [usuario_U], [contrasena_U]) VALUES (28, 2, N'Maximo', N'12345Maximo')
SET IDENTITY_INSERT [dbo].[USUARIOS] OFF
GO
ALTER TABLE [dbo].[LOCALIDADES]  WITH CHECK ADD  CONSTRAINT [FK_Localidades_Provincias] FOREIGN KEY([idProvincias_L])
REFERENCES [dbo].[PROVINCIAS] ([idProvincia_PR])
GO
ALTER TABLE [dbo].[LOCALIDADES] CHECK CONSTRAINT [FK_Localidades_Provincias]
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD  CONSTRAINT [FK_ESPECIALIDADES] FOREIGN KEY([especialidad_M])
REFERENCES [dbo].[ESPECIALIDADES] ([idEsp_E])
GO
ALTER TABLE [dbo].[MEDICOS] CHECK CONSTRAINT [FK_ESPECIALIDADES]
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD  CONSTRAINT [FK_MEDICO_LOCALIDAD] FOREIGN KEY([localidad_M])
REFERENCES [dbo].[LOCALIDADES] ([idLocalidad_L])
GO
ALTER TABLE [dbo].[MEDICOS] CHECK CONSTRAINT [FK_MEDICO_LOCALIDAD]
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD  CONSTRAINT [FK_MEDICOS_PROVINCIAS] FOREIGN KEY([provincia_M])
REFERENCES [dbo].[PROVINCIAS] ([idProvincia_PR])
GO
ALTER TABLE [dbo].[MEDICOS] CHECK CONSTRAINT [FK_MEDICOS_PROVINCIAS]
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD  CONSTRAINT [FK_MEDICOS_USUARIOS] FOREIGN KEY([idUsuario_M])
REFERENCES [dbo].[USUARIOS] ([idUsuario_U])
GO
ALTER TABLE [dbo].[MEDICOS] CHECK CONSTRAINT [FK_MEDICOS_USUARIOS]
GO
ALTER TABLE [dbo].[PACIENTES]  WITH CHECK ADD  CONSTRAINT [FK_PACIENTES_LOCALIDAD] FOREIGN KEY([localidad_P])
REFERENCES [dbo].[LOCALIDADES] ([idLocalidad_L])
GO
ALTER TABLE [dbo].[PACIENTES] CHECK CONSTRAINT [FK_PACIENTES_LOCALIDAD]
GO
ALTER TABLE [dbo].[PACIENTES]  WITH CHECK ADD  CONSTRAINT [FK_PACIENTES_PROVINCIAS] FOREIGN KEY([provincia_P])
REFERENCES [dbo].[PROVINCIAS] ([idProvincia_PR])
GO
ALTER TABLE [dbo].[PACIENTES] CHECK CONSTRAINT [FK_PACIENTES_PROVINCIAS]
GO
ALTER TABLE [dbo].[TURNOS]  WITH CHECK ADD  CONSTRAINT [FK_TURNO_PACIENTES] FOREIGN KEY([DniPac_T])
REFERENCES [dbo].[PACIENTES] ([DNI_P])
GO
ALTER TABLE [dbo].[TURNOS] CHECK CONSTRAINT [FK_TURNO_PACIENTES]
GO
ALTER TABLE [dbo].[TURNOS]  WITH CHECK ADD  CONSTRAINT [FK_TURNOS_MEDICOS] FOREIGN KEY([legajoMedico_T])
REFERENCES [dbo].[MEDICOS] ([legajo_M])
GO
ALTER TABLE [dbo].[TURNOS] CHECK CONSTRAINT [FK_TURNOS_MEDICOS]
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_USUARIOS_ROL] FOREIGN KEY([idRol_U])
REFERENCES [dbo].[ROLES] ([idRol_R])
GO
ALTER TABLE [dbo].[USUARIOS] CHECK CONSTRAINT [FK_USUARIOS_ROL]
GO
/****** Object:  StoredProcedure [dbo].[spAltaMedico]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAltaMedico]
@LEGAJO char(5), 
@LOCALIDAD int, 
@IDUSUARIO int,
@PROVINCIA int, 
@ESPECIALIDAD int,
@NOMBRE varchar(25), 
@APELLIDO varchar(25), 
@DNI varchar(8), 
@SEXO varchar(12), 
@FECHANAC datetime, 
@DIRECCION varchar(25), 
@CORREO varchar(30), 
@TELEFONO varchar(30), 
@DIAS varchar(50), 
@HORARIOS varchar(20), 
@NACIONALIDAD varchar(25)
AS
INSERT INTO MEDICOS(legajo_M,idUsuario_M, localidad_M, provincia_M, especialidad_M, nombre_M, Apellido_M, DNI_M, sexo_M, fechaNacimiento_M, direccion_M, correo_M, telefono_M, diasAtencion_M, horariosAtencion, nacionalidad_M, Estado_M)
SELECT @LEGAJO,@IDUSUARIO, @LOCALIDAD, @PROVINCIA, @ESPECIALIDAD, @NOMBRE, @APELLIDO, @DNI, @SEXO, @FECHANAC, @DIRECCION, @CORREO, @TELEFONO, @DIAS, @HORARIOS, @NACIONALIDAD, 1
GO
/****** Object:  StoredProcedure [dbo].[spAltaPaciente]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spAltaPaciente]
@DNI varchar(8), 
@SEXO varchar(12),
@LOCALIDAD int, 
@PROVINCIA int, 
@NOMBRE varchar(25), 
@APELLIDO varchar(25), 
@FECHANAC datetime, 
@DIRECCION varchar(25), 
@CORREO varchar(30), 
@TELEFONO varchar(30), 
@NACIONALIDAD varchar(25)
AS
INSERT INTO PACIENTES(DNI_P, sexo_P,localidad_P, provincia_P, nombre_P, Apellido_P, fechaNacimiento_P, direccion_P, correo_P, telefono_P, nacionalidad_P, Estado_P)
SELECT @DNI, @SEXO, @LOCALIDAD, @PROVINCIA, @NOMBRE, @APELLIDO, @FECHANAC, @DIRECCION, @CORREO, @TELEFONO, @NACIONALIDAD, 1
GO
/****** Object:  StoredProcedure [dbo].[spAltaTurno]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAltaTurno]
@IDESPECIALIDAD int, 
@LEGAJO varchar(5), 
@DNI varchar(8), 
@FECHA DATETIME, 
@HORARIO varchar(15)
AS
INSERT INTO TURNOS(idEsp_T, legajoMedico_T,DniPac_T,fecha_T,HORARIO_T)
SELECT @IDESPECIALIDAD,@LEGAJO,@DNI,@FECHA,@HORARIO
GO
/****** Object:  StoredProcedure [dbo].[spAltaUsuario]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spAltaUsuario]
@IDRol int,
@Usuario varchar(15), 
@contraseña varchar(15)
AS
INSERT INTO Usuarios(idRol_U,usuario_U, contrasena_U)
SELECT @IDRol, @Usuario,@contraseña
GO
/****** Object:  StoredProcedure [dbo].[spBajaMedico]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spBajaMedico]
@LEGAJO char(5)
AS
UPDATE MEDICOS
SET Estado_M = 0
WHERE legajo_M = @LEGAJO
GO
/****** Object:  StoredProcedure [dbo].[spBajaPaciente]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spBajaPaciente]
@DNI varchar(8)
AS
UPDATE PACIENTES 
SET Estado_P = 0
WHERE DNI_P = @DNI
GO
/****** Object:  StoredProcedure [dbo].[spBuscarDniRepetidoMedico]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[spBuscarDniRepetidoMedico]
@DNI varchar(8)
AS
SELECT DNI_M from MEDICOS WHERE DNI_M = @DNI 

GO
/****** Object:  StoredProcedure [dbo].[spBuscarDniRepetidoPaciente]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create   PROCEDURE [dbo].[spBuscarDniRepetidoPaciente]
@DNI varchar(8)
AS
SELECT DNI_P from PACIENTES WHERE DNI_P = @DNI 

GO
/****** Object:  StoredProcedure [dbo].[spBuscarLegajoRepetidoMedico]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    PROCEDURE [dbo].[spBuscarLegajoRepetidoMedico]
@LEGAJO char(5)
AS
SELECT legajo_M from MEDICOS WHERE legajo_M = @LEGAJO

GO
/****** Object:  StoredProcedure [dbo].[spcambiarMedicoTurno]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[spcambiarMedicoTurno]
@idTurno int,
@observacion varchar (100),
@presencialidad  varchar(50)
as

update TURNOS set observacion_T=@observacion , presencialidad_T=@presencialidad
where idTurno_T=@idTurno
GO
/****** Object:  StoredProcedure [dbo].[spFiltrarTurnos]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spFiltrarTurnos]
    @Paciente varchar(50) = NULL,
    @TipoTurno varchar(20) = NULL,
    @Horario varchar(20) = NULL,
    @Fecha date = NULL
AS
BEGIN
    SELECT DISTINCT 
        T.idTurno_T AS Turno, 
        P.DNI_P AS DNIPaciente,
        CONCAT(P.nombre_P, ' ', P.apellido_P) AS Paciente, 
        T.horario_T AS Horario, 
        T.fecha_T AS Fecha, 
        T.presencialidad_T AS Presencialidad,
        T.observacion_T AS Observacion
    FROM TURNOS AS T
    INNER JOIN PACIENTES AS P ON P.DNI_P = T.DniPac_T 
    WHERE 
        (@Paciente IS NULL OR CONCAT(P.nombre_P, ' ', P.apellido_P) LIKE '%' + @Paciente + '%')
        AND (@TipoTurno = 'Todos' 
            OR (@TipoTurno = 'Anteriores' AND (T.presencialidad_T = 'Presente' OR T.presencialidad_T = 'Ausente'))
            OR (@TipoTurno = 'Proximos' AND T.fecha_T >= GETDATE())
            OR T.presencialidad_T = @TipoTurno)
        AND (@Horario IS NULL OR T.horario_T = @Horario)
        AND (@Fecha IS NULL OR T.fecha_T = @Fecha)
    ORDER BY T.fecha_T, T.horario_T;
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarMedico]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spModificarMedico] 
@LEGAJO char(5), 
@LOCALIDAD int, 
@IDUSUARIO int,
@PROVINCIA int, 
@ESPECIALIDAD int,
@NOMBRE varchar(25), 
@APELLIDO varchar(25), 
@DNI varchar(8), 
@SEXO varchar(12), 
@FECHANAC datetime, 
@DIRECCION varchar(25), 
@CORREO varchar(30), 
@TELEFONO varchar(30), 
@DIAS varchar(50), 
@HORARIOS varchar(20), 
@NACIONALIDAD varchar(25)

AS


UPDATE MEDICOS
SET 
idUsuario_M = @IDUSUARIO,
localidad_M = @LOCALIDAD,
provincia_M = @PROVINCIA,
especialidad_M = @ESPECIALIDAD,
nombre_M = @NOMBRE,
Apellido_M = @APELLIDO,
DNI_M = @DNI,
sexo_M = @SEXO,
fechaNacimiento_M = @FECHANAC,
direccion_M = @DIRECCION,
correo_M = @CORREO,
telefono_M = @TELEFONO,
diasAtencion_M = @DIAS,
horariosAtencion = @HORARIOS,
nacionalidad_M = @NACIONALIDAD
WHERE legajo_M = @LEGAJO

GO
/****** Object:  StoredProcedure [dbo].[spModificarPaciente]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spModificarPaciente]
@DNI varchar(8),
@SEXO varchar(12),
@LOCALIDAD int,
@PROVINCIA int,
@NOMBRE varchar(25),
@APELLIDO varchar(25),
@FECHANAC datetime,
@DIRECCION varchar(25),
@CORREO varchar(30),
@TELEFONO varchar(30),
@NACIONALIDAD varchar(25)

AS

UPDATE PACIENTES
SET sexo_P = @SEXO,
localidad_P = @LOCALIDAD,
provincia_P = @PROVINCIA,
nombre_P = @NOMBRE,
Apellido_P = @APELLIDO,
fechaNacimiento_P = @FECHANAC,
direccion_P = @DIRECCION,
correo_P = @CORREO,
telefono_P = @TELEFONO,
nacionalidad_P = @NACIONALIDAD
WHERE DNI_P = @DNI

GO
/****** Object:  StoredProcedure [dbo].[spModificarUsuario]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModificarUsuario] 
    @USUARIO varchar(15),
    @CON varchar(15),
    @IDUSUARIO int
AS
BEGIN
    UPDATE USUARIOS
    SET
        usuario_U = @USUARIO,
        contrasena_U = @CON
    WHERE 
        idUsuario_U = @IDUSUARIO;
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerCantTurnos]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* EN ESTE CASO OBTENEMOS LA CANTIDAD DE TURNOS ASIGNADOS/PRESENTES/AUSENTES DESDE X MES Y A�O HASTA X MES Y A�O */

CREATE   PROCEDURE [dbo].[spObtenerCantTurnos]
	@TURNO varchar(20), 
	@DESDEDIA INT,
    @DESDEMES INT,
    @DESDEANIO INT,
    @HASTADIA INT,
    @HASTAMES INT,
    @HASTAANIO INT
AS

DECLARE @PRESENCIA varchar(20)
DECLARE @RETORNO int /*DECLARACION DE VARIABLE DE RETORNO*/

 -- Convertir los parámetros en fechas de inicio y fin
    DECLARE @fechaDesde DATETIME
    DECLARE @fechaHasta DATETIME
    
    SET @fechaDesde = CONVERT(DATETIME, CONVERT(VARCHAR, @DESDEANIO) + '-' + CONVERT(VARCHAR, @DESDEMES) + '-' + CONVERT(VARCHAR, @DESDEDIA), 120)
    SET @fechaHasta = CONVERT(DATETIME, CONVERT(VARCHAR, @HASTAANIO) + '-' + CONVERT(VARCHAR, @HASTAMES) + '-' + CONVERT(VARCHAR, @HASTADIA), 120)

IF @TURNO = 'Asignados'
	BEGIN 
		SET @RETORNO = (SELECT COUNT(*) FROM TURNOS WHERE fecha_T BETWEEN @fechaDesde AND @fechaHasta)
		RETURN @RETORNO
	END

ELSE IF @TURNO = 'Presentes'
	BEGIN
		SET @PRESENCIA = 'Presente'
	END

ELSE
	BEGIN
		SET @PRESENCIA = 'Ausente'
	END

SET @RETORNO = (SELECT COUNT(*) FROM TURNOS 
WHERE presencialidad_T = @PRESENCIA AND fecha_T BETWEEN @fechaDesde AND @fechaHasta)

RETURN @RETORNO
GO
/****** Object:  StoredProcedure [dbo].[spObtenerEspecialidades]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerEspecialidades]
AS
SELECT DISTINCT * from ESPECIALIDADES
GO
/****** Object:  StoredProcedure [dbo].[spObtenerEstadoMedico]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spObtenerEstadoMedico]
@ID int
as
select Estado_M from MEDICOS
where MEDICOS.Estado_M = 1 and MEDICOS.idUsuario_M = @ID
GO
/****** Object:  StoredProcedure [dbo].[spObtenerHorarioDeTurno]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerHorarioDeTurno]
@LEGAJO char(5),
@FECHA datetime
AS
SELECT HORARIO_T FROM TURNOS WHERE legajoMedico_T = @LEGAJO AND fecha_T = @FECHA

GO
/****** Object:  StoredProcedure [dbo].[spObtenerIDUsuario]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerIDUsuario]
    @usuario VARCHAR(15),
    @contrasena VARCHAR(15)
AS
    SELECT idUsuario_U
    FROM USUARIOS
    WHERE usuario_U = @usuario AND contrasena_U = @contrasena;

GO
/****** Object:  StoredProcedure [dbo].[spObtenerLocalidades]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spObtenerLocalidades]
@IDProvincia int
AS
SELECT DISTINCT l.nombre_L,l.idLocalidad_L from LOCALIDADES l WHERE l.idProvincias_L = @IDProvincia
GO
/****** Object:  StoredProcedure [dbo].[spObtenerMedicoPorApellido]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	-----------------MEDICO---------------------------------------------------------------------------------------------------------------------------------------------

	create   procedure [dbo].[spObtenerMedicoPorApellido]
	@Apellido varchar(30)
	as
	SELECT DISTINCT m.legajo_M AS Legajo, m.DNI_M AS DNI, m.nombre_M AS Nombre, m.apellido_M AS Apellido, m.direccion_M AS Direccion, m.correo_M AS Correo, m.telefono_M AS Telefono, e.idEsp_E AS Especialidad, m.diasAtencion_M AS Dias, m.HorariosAtencion AS Horario, idUsuario_M, contrasena_U, nombre_L, nombre_PR, fechaNacimiento_M, sexo_M, nacionalidad_M, localidad_M, provincia_M
    FROM Medicos AS m INNER JOIN ESPECIALIDADES AS e ON m.especialidad_M = e.idEsp_E inner join USUARIOS on idUsuario_M = idUsuario_U inner join LOCALIDADES on localidad_M = idLocalidad_L inner join PROVINCIAS on provincia_M = idProvincia_PR
    WHERE Estado_M=1 and m.Apellido_M like '%'+@Apellido+'%'

GO
/****** Object:  StoredProcedure [dbo].[spObtenerMedicoPorApellidoFiltrado]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[spObtenerMedicoPorApellidoFiltrado]
@especialidad varchar(25),
@apellido varchar(25)
as
 SELECT DISTINCT m.legajo_M AS Legajo, m.DNI_M AS DNI, m.nombre_M AS Nombre, m.apellido_M AS Apellido, m.direccion_M AS Direccion, m.correo_M AS Correo, m.telefono_M AS Telefono, e.idEsp_E AS EspecialidadID,e.nombre_E as Especialidad, m.diasAtencion_M AS Dias, m.HorariosAtencion AS Horario, idUsuario_M, contrasena_U, nombre_L, nombre_PR, fechaNacimiento_M, sexo_M, nacionalidad_M, localidad_M, provincia_M
    FROM Medicos AS m INNER JOIN ESPECIALIDADES AS e ON m.especialidad_M = e.idEsp_E inner join USUARIOS on idUsuario_M = idUsuario_U inner join LOCALIDADES on localidad_M = idLocalidad_L inner join PROVINCIAS on provincia_M = idProvincia_PR
    WHERE Estado_M=1 and m.Apellido_M like '%'+@apellido+'%' and  e.nombre_E = @especialidad
GO
/****** Object:  StoredProcedure [dbo].[spObtenerMedicoPorDni]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   Procedure [dbo].[spObtenerMedicoPorDni]
@DNI varchar(8)
AS
	SELECT DISTINCT m.legajo_M AS Legajo, m.DNI_M AS DNI, m.nombre_M AS Nombre, m.apellido_M AS Apellido, m.direccion_M AS Direccion, m.correo_M AS Correo, m.telefono_M AS Telefono, e.idEsp_E AS Especialidad, m.diasAtencion_M AS Dias, m.HorariosAtencion AS Horario, idUsuario_M, contrasena_U, nombre_L, nombre_PR, fechaNacimiento_M, sexo_M, nacionalidad_M, localidad_M, provincia_M
    FROM Medicos AS m INNER JOIN ESPECIALIDADES AS e ON m.especialidad_M = e.idEsp_E inner join USUARIOS on idUsuario_M = idUsuario_U inner join LOCALIDADES on localidad_M = idLocalidad_L inner join PROVINCIAS on provincia_M = idProvincia_PR
    WHERE Estado_M=1 and m.DNI_M like '%'+@DNI+'%'
GO
/****** Object:  StoredProcedure [dbo].[spObtenerMedicoPorIdEspecialidad]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  Procedure [dbo].[spObtenerMedicoPorIdEspecialidad]
@IDESPECIALIDAD int
AS
	SELECT DISTINCT m.legajo_M AS Legajo, m.DNI_M AS DNI, m.nombre_M AS Nombre, m.apellido_M AS Apellido, m.direccion_M AS Direccion, m.correo_M AS Correo, m.telefono_M AS Telefono, e.idEsp_E AS EspecialidadID,e.nombre_E as Especialidad, m.diasAtencion_M AS Dias, m.HorariosAtencion AS Horario, idUsuario_M, contrasena_U, nombre_L, nombre_PR, fechaNacimiento_M, sexo_M, nacionalidad_M, localidad_M, provincia_M
    FROM Medicos AS m INNER JOIN ESPECIALIDADES AS e ON m.especialidad_M = e.idEsp_E inner join USUARIOS on idUsuario_M = idUsuario_U inner join LOCALIDADES on localidad_M = idLocalidad_L inner join PROVINCIAS on provincia_M = idProvincia_PR
    WHERE Estado_M=1 and m.especialidad_M = @IDESPECIALIDAD
GO
/****** Object:  StoredProcedure [dbo].[spObtenerMedicoPorLegajo]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spObtenerMedicoPorLegajo]
@Legajo  char(5)
AS
	SELECT DISTINCT m.legajo_M AS Legajo, m.DNI_M AS DNI, m.nombre_M AS Nombre, m.apellido_M AS Apellido, m.direccion_M AS Direccion, m.correo_M AS Correo, m.telefono_M AS Telefono, e.idEsp_E AS EspecialidadID,e.nombre_E as Especialidad, m.diasAtencion_M AS Dias, m.HorariosAtencion AS Horario, idUsuario_M, contrasena_U as constrasena, nombre_L, nombre_PR, fechaNacimiento_M, sexo_M, nacionalidad_M, localidad_M, provincia_M
    FROM Medicos AS m INNER JOIN ESPECIALIDADES AS e ON m.especialidad_M = e.idEsp_E inner join USUARIOS on idUsuario_M = idUsuario_U inner join LOCALIDADES on localidad_M = idLocalidad_L inner join PROVINCIAS on provincia_M = idProvincia_PR
    WHERE Estado_M=1 and m.legajo_M like '%'+@Legajo+'%'
GO
/****** Object:  StoredProcedure [dbo].[spObtenerMedicoPorNombre]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE   PROCEDURE [dbo].[spObtenerMedicoPorNombre]
 @Nombre varchar(30)
 as
 	SELECT DISTINCT m.legajo_M AS Legajo, m.DNI_M AS DNI, m.nombre_M AS Nombre, m.apellido_M AS Apellido, m.direccion_M AS Direccion, m.correo_M AS Correo, m.telefono_M AS Telefono, e.idEsp_E AS EspecialidadID,e.nombre_E as Especialidad, m.diasAtencion_M AS Dias, m.HorariosAtencion AS Horario, idUsuario_M, contrasena_U, nombre_L, nombre_PR, fechaNacimiento_M, sexo_M, nacionalidad_M, localidad_M, provincia_M
    FROM Medicos AS m INNER JOIN ESPECIALIDADES AS e ON m.especialidad_M = e.idEsp_E inner join USUARIOS on idUsuario_M = idUsuario_U inner join LOCALIDADES on localidad_M = idLocalidad_L inner join PROVINCIAS on provincia_M = idProvincia_PR
    WHERE Estado_M=1 and m.nombre_M like '%'+@Nombre+'%'

GO
/****** Object:  StoredProcedure [dbo].[spObtenerMedicoPorNombreFiltrado]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[spObtenerMedicoPorNombreFiltrado]
@especialidad varchar(25),
@nombre varchar(25)
as
 SELECT DISTINCT m.legajo_M AS Legajo, m.DNI_M AS DNI, m.nombre_M AS Nombre, m.apellido_M AS Apellido, m.direccion_M AS Direccion, m.correo_M AS Correo, m.telefono_M AS Telefono, e.idEsp_E AS EspecialidadID,e.nombre_E as Especialidad, m.diasAtencion_M AS Dias, m.HorariosAtencion AS Horario, idUsuario_M, contrasena_U, nombre_L, nombre_PR, fechaNacimiento_M, sexo_M, nacionalidad_M, localidad_M, provincia_M
    FROM Medicos AS m INNER JOIN ESPECIALIDADES AS e ON m.especialidad_M = e.idEsp_E inner join USUARIOS on idUsuario_M = idUsuario_U inner join LOCALIDADES on localidad_M = idLocalidad_L inner join PROVINCIAS on provincia_M = idProvincia_PR
    WHERE Estado_M=1 and m.nombre_M like '%'+@nombre+'%' and  e.nombre_E = @especialidad
GO
/****** Object:  StoredProcedure [dbo].[spObtenerMedicos]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerMedicos]
AS
SELECT DISTINCT m.legajo_M AS Legajo, m.DNI_M AS DNI, m.nombre_M AS Nombre, m.apellido_M AS Apellido, m.direccion_M AS Direccion, m.correo_M AS Correo, m.telefono_M AS Telefono, e.idEsp_E AS EspecialidadID, e.nombre_E as Especialidad, m.diasAtencion_M AS Dias, m.HorariosAtencion AS Horario, idUsuario_M, contrasena_U, nombre_L, nombre_PR, fechaNacimiento_M, sexo_M, nacionalidad_M, localidad_M, provincia_M
FROM Medicos AS m INNER JOIN ESPECIALIDADES AS e ON m.especialidad_M = e.idEsp_E inner join USUARIOS on idUsuario_M = idUsuario_U inner join LOCALIDADES on localidad_M = idLocalidad_L inner join PROVINCIAS on provincia_M = idProvincia_PR
WHERE Estado_M=1;
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPacientePorApellido]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[spObtenerPacientePorApellido]
@Apellido varchar(30)
as
SELECT DISTINCT p.DNI_P AS DNI, p.nombre_P AS Nombre, p.apellido_P AS Apellido, p.direccion_P AS Direccion, p.correo_P AS Correo, p.telefono_P AS Telefono, p.nacionalidad_P,p.fechaNacimiento_P,p.sexo_P,PROVINCIAS.nombre_PR as Provincia,LOCALIDADES.nombre_L as Localidad
FROM Pacientes AS p
JOIN PROVINCIAS on p.provincia_P=PROVINCIAS.idProvincia_PR
join LOCALIDADES on localidad_P=LOCALIDADES.idLocalidad_L
WHERE 
    Estado_P = 1 
    AND p.apellido_P LIKE '%'+ @Apellido+'%'
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPacientePorApellidoFiltrado]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create   procedure [dbo].[spObtenerPacientePorApellidoFiltrado]
@Apellido varchar(20),
@Localidad int,
@Provincia  int
as 
SELECT DISTINCT p.DNI_P AS DNI, p.nombre_P AS Nombre, p.apellido_P AS Apellido, p.direccion_P AS Direccion, p.correo_P AS Correo, p.telefono_P AS Telefono, p.nacionalidad_P,p.fechaNacimiento_P,p.sexo_P,PROVINCIAS.nombre_PR as Provincia,LOCALIDADES.nombre_L as Localidad
FROM Pacientes AS p
JOIN PROVINCIAS on p.provincia_P=PROVINCIAS.idProvincia_PR
join LOCALIDADES on localidad_P=LOCALIDADES.idLocalidad_L
WHERE 
    Estado_P = 1 
    AND p.Apellido_P LIKE '%'+@Apellido+'%' and LOCALIDADES.idLocalidad_L=@Localidad and LOCALIDADES.idProvincias_L=@Provincia
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPacientePorDNI]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[spObtenerPacientePorDNI]
@DNI char(8)
as
SELECT DISTINCT p.DNI_P AS DNI, p.nombre_P AS Nombre, p.apellido_P AS Apellido, p.direccion_P AS Direccion, p.correo_P AS Correo, p.telefono_P AS Telefono, p.nacionalidad_P,p.fechaNacimiento_P,p.sexo_P,PROVINCIAS.nombre_PR as Provincia,LOCALIDADES.nombre_L as Localidad,provincia_P, localidad_P
FROM Pacientes AS p
JOIN PROVINCIAS on p.provincia_P=PROVINCIAS.idProvincia_PR
join LOCALIDADES on localidad_P=LOCALIDADES.idLocalidad_L
WHERE 
    Estado_P = 1 
    AND p.DNI_P LIKE '%'+@DNI+'%'
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPacientePorNombre]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE   procedure [dbo].[spObtenerPacientePorNombre]
@Nombre varchar(30)
as

SELECT DISTINCT p.DNI_P AS DNI, p.nombre_P AS Nombre, p.apellido_P AS Apellido, p.direccion_P AS Direccion, p.correo_P AS Correo, p.telefono_P AS Telefono, p.nacionalidad_P,p.fechaNacimiento_P,p.sexo_P,PROVINCIAS.nombre_PR as Provincia,LOCALIDADES.nombre_L as Localidad
FROM Pacientes AS p
JOIN PROVINCIAS on p.provincia_P=PROVINCIAS.idProvincia_PR
join LOCALIDADES on localidad_P=LOCALIDADES.idLocalidad_L
WHERE 
    Estado_P = 1 
    AND p.nombre_P LIKE '%'+@Nombre+'%'
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPacientePorNombreFiltrado]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[spObtenerPacientePorNombreFiltrado]
@Nombre varchar(20),
@Localidad int,
@Provincia  int
as 
SELECT DISTINCT p.DNI_P AS DNI, p.nombre_P AS Nombre, p.apellido_P AS Apellido, p.direccion_P AS Direccion, p.correo_P AS Correo, p.telefono_P AS Telefono, p.nacionalidad_P,p.fechaNacimiento_P,p.sexo_P,PROVINCIAS.nombre_PR as Provincia,LOCALIDADES.nombre_L as Localidad
FROM Pacientes AS p
JOIN PROVINCIAS on p.provincia_P=PROVINCIAS.idProvincia_PR
join LOCALIDADES on localidad_P=LOCALIDADES.idLocalidad_L
WHERE 
    Estado_P = 1 
    AND p.nombre_P LIKE '%'+@Nombre+'%' and LOCALIDADES.idLocalidad_L=@Localidad and LOCALIDADES.idProvincias_L=@Provincia
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPacientes]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spObtenerPacientes]
AS
SELECT DISTINCT p.DNI_P AS DNI, p.nombre_P AS Nombre, p.apellido_P AS Apellido, p.direccion_P AS Direccion, p.correo_P AS Correo, p.telefono_P AS Telefono, p.nacionalidad_P,provincia_P,localidad_P,p.fechaNacimiento_P,p.sexo_P,PROVINCIAS.nombre_PR as Provincia,LOCALIDADES.nombre_L as Localidad
FROM Pacientes AS p
JOIN PROVINCIAS on p.provincia_P=PROVINCIAS.idProvincia_PR
join LOCALIDADES on localidad_P=LOCALIDADES.idLocalidad_L
WHERE Estado_P=1;
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPacientes_PR_AU]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* En este procedimiento obtenemos los datos de los turnos presentes para plasmarlos en una grilla, combinando varias tablas para mostrar los datos relevantes. */

CREATE   PROCEDURE [dbo].[spObtenerPacientes_PR_AU]
	@TURNO varchar(20), 
	@DESDEDIA INT,
    @DESDEMES INT,
    @DESDEANIO INT,
    @HASTADIA INT,
    @HASTAMES INT,
    @HASTAANIO INT
AS

DECLARE @PRESENCIA varchar(20)

 -- Convertir los parámetros en fechas de inicio y fin
    DECLARE @fechaDesde DATETIME
    DECLARE @fechaHasta DATETIME
    
    SET @fechaDesde = CONVERT(DATETIME, CONVERT(VARCHAR, @DESDEANIO) + '-' + CONVERT(VARCHAR, @DESDEMES) + '-' + CONVERT(VARCHAR, @DESDEDIA), 120)
    SET @fechaHasta = CONVERT(DATETIME, CONVERT(VARCHAR, @HASTAANIO) + '-' + CONVERT(VARCHAR, @HASTAMES) + '-' + CONVERT(VARCHAR, @HASTADIA), 120)


IF @TURNO = 'Presentes'
	BEGIN
		SET @PRESENCIA = 'Presente'
	END
ELSE
	BEGIN
		SET @PRESENCIA = 'Ausente'
	END

SELECT T.idTurno_T AS Turno, P.DNI_P AS [DNI Paciente],CONCAT(P.nombre_P, ' ', P.Apellido_P) AS Paciente, CONCAT(M.nombre_M, ' ', M.Apellido_M) AS Medico, E.nombre_E AS Especialidad, T.fecha_T AS Fecha
FROM PACIENTES as P
INNER JOIN TURNOS as T ON P.DNI_P = T.DniPac_T 
INNER JOIN MEDICOS as M ON T.legajoMedico_T = M.legajo_M
JOIN ESPECIALIDADES AS E ON M.especialidad_M = E.idEsp_E
WHERE T.presencialidad_T = @PRESENCIA AND fecha_T BETWEEN @fechaDesde AND @fechaHasta
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPacientesTurno]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    procedure [dbo].[spObtenerPacientesTurno]
@idUsuario int
AS

SELECT P.DNI_P AS DNI, CONCAT(P.nombre_P, ' ', P.Apellido_P) AS NombrePacientes,
       T.HORARIO_T AS Horario,
       T.fecha_T AS Fecha,
       T.presencialidad_T AS Presencialidad,
       T.observacion_T AS Observacion,
	   T.idTurno_T as Turno
FROM PACIENTES AS P
INNER JOIN TURNOS AS T ON P.DNI_P = T.DniPac_T
join MEDICOS AS M on T.legajoMedico_T = M.legajo_M
join USUARIOS AS U on M.idUsuario_M = U.idUsuario_U
WHERE T.fecha_T >= getdate() AND U.idUsuario_U = @idUsuario


/****** Object:  StoredProcedure [dbo].[spObtenerPorcentajes]    Script Date: 13/07/2024 12:27:55 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPorcentajes]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spObtenerPorcentajes]
	@TURNO varchar(20), 
	@DESDEDIA INT,
    @DESDEMES INT,
    @DESDEANIO INT,
    @HASTADIA INT,
    @HASTAMES INT,
    @HASTAANIO INT
AS

DECLARE @TOTAL int

DECLARE @CANT_PR_AU int; /*UNICA VARIABLE QUE SIRVE EN CASO DE PRESENTES O AUSENTES */

 -- Convertir los parámetros en fechas de inicio y fin
    DECLARE @fechaDesde DATETIME
    DECLARE @fechaHasta DATETIME
    
    SET @fechaDesde = CONVERT(DATETIME, CONVERT(VARCHAR, @DESDEANIO) + '-' + CONVERT(VARCHAR, @DESDEMES) + '-' + CONVERT(VARCHAR, @DESDEDIA), 120)
    SET @fechaHasta = CONVERT(DATETIME, CONVERT(VARCHAR, @HASTAANIO) + '-' + CONVERT(VARCHAR, @HASTAMES) + '-' + CONVERT(VARCHAR, @HASTADIA), 120)
	SET @TOTAL = (SELECT COUNT(*) FROM TURNOS WHERE fecha_T BETWEEN @fechaDesde AND @fechaHasta)

IF @TURNO = 'Presentes'
	BEGIN 
		SET @CANT_PR_AU = (SELECT COUNT(*) FROM TURNOS WHERE presencialidad_T = 'Presente' AND fecha_T BETWEEN @fechaDesde AND @fechaHasta)
	END

ELSE
	BEGIN
		SET @CANT_PR_AU = (SELECT COUNT(*) FROM TURNOS WHERE presencialidad_T = 'Ausente' AND fecha_T BETWEEN @fechaDesde AND @fechaHasta)
	END

DECLARE @RETORNO int /*DECLARACION DE VARIABLE DE RETORNO*/
SET @RETORNO = (SELECT SUM(@CANT_PR_AU * 100 / @TOTAL)) /*LE SETEAMOS EL RESULTADO QUE DEBE RETORNAR */

RETURN @RETORNO
GO
/****** Object:  StoredProcedure [dbo].[spObtenerProvincias]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerProvincias]
AS
SELECT DISTINCT * from PROVINCIAS
GO
/****** Object:  StoredProcedure [dbo].[spObtenerTurnoPacienteXMedicoAsignado]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spObtenerTurnoPacienteXMedicoAsignado]
@LEGAJO char(5),
@DNI varchar(8)
AS
BEGIN
    DECLARE @RETORNO INT

    IF EXISTS (SELECT 1 FROM TURNOS WHERE legajoMedico_T = @LEGAJO AND DniPac_T = @DNI AND presencialidad_T IS NULL)
    BEGIN
        SET @RETORNO = 1
    END
    ELSE
    BEGIN
        SET @RETORNO = 0
    END
    -- Devolver el valor de @RETORNO
    SELECT @RETORNO AS Result
END

GO
/****** Object:  StoredProcedure [dbo].[spObtenerTurnos_A_PR_AU]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/* AC� APLICAMOS MISMA COMBINACI�N DE TABLAS PARA OBTENER TODOS LOS ASIGNADOS/PRESENTES/AUSENTES CON LOS DATOS RELEVANTES */

CREATE   PROCEDURE [dbo].[spObtenerTurnos_A_PR_AU]
	@TURNO varchar(20), 
	@DESDEDIA INT,
    @DESDEMES INT,
    @DESDEANIO INT,
    @HASTADIA INT,
    @HASTAMES INT,
    @HASTAANIO INT
AS

DECLARE @PRESENCIA varchar(20)

 -- Convertir los parámetros en fechas de inicio y fin
    DECLARE @fechaDesde DATETIME
    DECLARE @fechaHasta DATETIME
    
    SET @fechaDesde = CONVERT(DATETIME, CONVERT(VARCHAR, @DESDEANIO) + '-' + CONVERT(VARCHAR, @DESDEMES) + '-' + CONVERT(VARCHAR, @DESDEDIA), 120)
    SET @fechaHasta = CONVERT(DATETIME, CONVERT(VARCHAR, @HASTAANIO) + '-' + CONVERT(VARCHAR, @HASTAMES) + '-' + CONVERT(VARCHAR, @HASTADIA), 120)


IF @TURNO = 'Asignados'
	BEGIN 
		SELECT T.idTurno_T AS Turno, P.DNI_P AS [DNI Paciente],CONCAT(P.nombre_P, ' ', P.Apellido_P) AS Paciente, CONCAT(M.nombre_M, ' ', M.Apellido_M) AS Medico, E.nombre_E AS Especialidad, T.fecha_T AS Fecha, T.presencialidad_T AS Presencia 
		FROM PACIENTES as P
		INNER JOIN TURNOS as T ON P.DNI_P = T.DniPac_T 
		INNER JOIN MEDICOS as M ON T.legajoMedico_T = M.legajo_M
		JOIN ESPECIALIDADES AS E ON M.especialidad_M = E.idEsp_E
		WHERE fecha_T BETWEEN @fechaDesde AND @fechaHasta
		RETURN
	END

ELSE IF @TURNO = 'Presentes'
	BEGIN
		SET @PRESENCIA = 'Presente'
	END

ELSE
	BEGIN
		SET @PRESENCIA = 'Ausente'
	END

SELECT T.idTurno_T AS Turno, P.DNI_P AS [DNI Paciente],CONCAT(P.nombre_P, ' ', P.Apellido_P) AS Paciente, CONCAT(M.nombre_M, ' ', M.Apellido_M) AS Medico, E.nombre_E AS Especialidad,T.fecha_T AS Fecha, T.presencialidad_T AS Presencia 
FROM PACIENTES as P
INNER JOIN TURNOS as T ON P.DNI_P = T.DniPac_T 
INNER JOIN MEDICOS as M ON T.legajoMedico_T = M.legajo_M
JOIN ESPECIALIDADES AS E ON M.especialidad_M = E.idEsp_E
WHERE T.presencialidad_T = @PRESENCIA AND fecha_T BETWEEN @fechaDesde AND @fechaHasta
GO
/****** Object:  StoredProcedure [dbo].[spObtenerTurnos_FECHA]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spObtenerTurnos_FECHA]
    @DESDEDIA INT,
    @DESDEMES INT,
    @DESDEANIO INT,
    @HASTADIA INT,
    @HASTAMES INT,
    @HASTAANIO INT,
    @legajo CHAR(5)
AS
BEGIN
    -- Convertir los parámetros en fechas de inicio y fin
    DECLARE @fechaDesde DATETIME
    DECLARE @fechaHasta DATETIME
    
    SET @fechaDesde = CONVERT(DATETIME, CONVERT(VARCHAR, @DESDEANIO) + '-' + CONVERT(VARCHAR, @DESDEMES) + '-' + CONVERT(VARCHAR, @DESDEDIA), 120)
    SET @fechaHasta = CONVERT(DATETIME, CONVERT(VARCHAR, @HASTAANIO) + '-' + CONVERT(VARCHAR, @HASTAMES) + '-' + CONVERT(VARCHAR, @HASTADIA), 120)

    SELECT P.DNI_P AS DNI, CONCAT(P.nombre_P, ' ', P.Apellido_P) AS NombrePacientes,
           T.HORARIO_T AS Horario,
           T.fecha_T AS Fecha,
           T.presencialidad_T AS Presencialidad,
           T.observacion_T AS Observacion
    FROM PACIENTES AS P
    INNER JOIN TURNOS AS T ON P.DNI_P = T.DniPac_T 
    WHERE T.fecha_T BETWEEN @fechaDesde AND @fechaHasta
      AND T.legajoMedico_T = @legajo
END

GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarioPorId]    Script Date: 07/09/2024 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spObtenerUsuarioPorId]
@ID int 
as
select USUARIOS.contrasena_U, USUARIOS.usuario_U, USUARIOS.idRol_U, USUARIOS.idUsuario_U from USUARIOS
where idUsuario_U=@ID
GO
USE [master]
GO
ALTER DATABASE [CLINICA_BD] SET  READ_WRITE 
GO
