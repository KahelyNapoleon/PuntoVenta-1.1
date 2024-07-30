USE [master]
GO
/****** Object:  Database [PuntoVenta]    Script Date: 30/7/2024 14:04:13 ******/
CREATE DATABASE [PuntoVenta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PuntoVenta', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\PuntoVenta.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PuntoVenta_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\PuntoVenta_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PuntoVenta] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PuntoVenta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PuntoVenta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PuntoVenta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PuntoVenta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PuntoVenta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PuntoVenta] SET ARITHABORT OFF 
GO
ALTER DATABASE [PuntoVenta] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PuntoVenta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PuntoVenta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PuntoVenta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PuntoVenta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PuntoVenta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PuntoVenta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PuntoVenta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PuntoVenta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PuntoVenta] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PuntoVenta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PuntoVenta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PuntoVenta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PuntoVenta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PuntoVenta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PuntoVenta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PuntoVenta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PuntoVenta] SET RECOVERY FULL 
GO
ALTER DATABASE [PuntoVenta] SET  MULTI_USER 
GO
ALTER DATABASE [PuntoVenta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PuntoVenta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PuntoVenta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PuntoVenta] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PuntoVenta] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PuntoVenta] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PuntoVenta', N'ON'
GO
ALTER DATABASE [PuntoVenta] SET QUERY_STORE = ON
GO
ALTER DATABASE [PuntoVenta] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PuntoVenta]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 30/7/2024 14:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CategoriaId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ganancia]    Script Date: 30/7/2024 14:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ganancia](
	[GananciaId] [int] IDENTITY(1,1) NOT NULL,
	[Costo] [decimal](18, 2) NOT NULL,
	[PorcentajeGanancia] [decimal](18, 2) NULL,
	[GananciaNeta] [decimal](18, 2) NULL,
	[ProductoId] [int] NOT NULL,
	[PrecioVenta] [decimal](18, 2) NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GananciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 30/7/2024 14:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ProductoId] [int] IDENTITY(1,1) NOT NULL,
	[CodigoBarra] [int] NULL,
	[Nombre] [varchar](50) NOT NULL,
	[PesoNeto] [int] NOT NULL,
	[CategoriaId] [int] NULL,
	[Costo] [decimal](18, 2) NULL,
	[PorcentajeGanancia] [decimal](18, 2) NULL,
	[PrecioVenta] [decimal](10, 2) NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 30/7/2024 14:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[FechaIngreso] [date] NULL,
	[Cantidad] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 30/7/2024 14:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[VentaId] [int] NOT NULL,
	[IngresoDinero] [decimal](5, 2) NULL,
	[FechaVenta] [date] NULL,
	[ProductoId] [int] NULL,
	[StockId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Descripcion]) VALUES (0, N'Bebidas s/a')
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Descripcion]) VALUES (1, N'Fideos')
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Descripcion]) VALUES (2, N'Salsa')
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Descripcion]) VALUES (3, N'Secos')
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Descripcion]) VALUES (4, N'Harina')
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Descripcion]) VALUES (5, N'Galletita')
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Descripcion]) VALUES (6, N'Bebida c/a')
GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Ganancia] ON 
GO
INSERT [dbo].[Ganancia] ([GananciaId], [Costo], [PorcentajeGanancia], [GananciaNeta], [ProductoId], [PrecioVenta], [Cantidad]) VALUES (1013, CAST(1100.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(5280.00 AS Decimal(18, 2)), 2027, CAST(1540.00 AS Decimal(18, 2)), 12)
GO
INSERT [dbo].[Ganancia] ([GananciaId], [Costo], [PorcentajeGanancia], [GananciaNeta], [ProductoId], [PrecioVenta], [Cantidad]) VALUES (1015, CAST(750.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(3600.00 AS Decimal(18, 2)), 2029, CAST(1050.00 AS Decimal(18, 2)), 12)
GO
INSERT [dbo].[Ganancia] ([GananciaId], [Costo], [PorcentajeGanancia], [GananciaNeta], [ProductoId], [PrecioVenta], [Cantidad]) VALUES (1019, CAST(628.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(3780.00 AS Decimal(18, 2)), 2034, CAST(880.00 AS Decimal(18, 2)), 15)
GO
INSERT [dbo].[Ganancia] ([GananciaId], [Costo], [PorcentajeGanancia], [GananciaNeta], [ProductoId], [PrecioVenta], [Cantidad]) VALUES (1020, CAST(1992.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(4788.00 AS Decimal(18, 2)), 2035, CAST(2790.00 AS Decimal(18, 2)), 6)
GO
SET IDENTITY_INSERT [dbo].[Ganancia] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 
GO
INSERT [dbo].[Producto] ([ProductoId], [CodigoBarra], [Nombre], [PesoNeto], [CategoriaId], [Costo], [PorcentajeGanancia], [PrecioVenta], [Cantidad]) VALUES (2027, 951951, N'Don Satur Magdalenas', 500, 5, CAST(1100.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(1540.00 AS Decimal(10, 2)), 12)
GO
INSERT [dbo].[Producto] ([ProductoId], [CodigoBarra], [Nombre], [PesoNeto], [CategoriaId], [Costo], [PorcentajeGanancia], [PrecioVenta], [Cantidad]) VALUES (2029, 654987321, N'Coca', 500, 0, CAST(750.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(1050.00 AS Decimal(10, 2)), 12)
GO
INSERT [dbo].[Producto] ([ProductoId], [CodigoBarra], [Nombre], [PesoNeto], [CategoriaId], [Costo], [PorcentajeGanancia], [PrecioVenta], [Cantidad]) VALUES (2034, 951951951, N'Trio Peas', 302, 5, CAST(628.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(880.00 AS Decimal(10, 2)), 15)
GO
INSERT [dbo].[Producto] ([ProductoId], [CodigoBarra], [Nombre], [PesoNeto], [CategoriaId], [Costo], [PorcentajeGanancia], [PrecioVenta], [Cantidad]) VALUES (2035, 321654987, N'Vina de Balbo Botellon', 1125, 6, CAST(1992.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(2790.00 AS Decimal(10, 2)), 6)
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 
GO
INSERT [dbo].[Stock] ([StockId], [FechaIngreso], [Cantidad], [ProductoId]) VALUES (1, CAST(N'2024-07-24' AS Date), 12, 2027)
GO
INSERT [dbo].[Stock] ([StockId], [FechaIngreso], [Cantidad], [ProductoId]) VALUES (3, CAST(N'2024-07-24' AS Date), 12, 2029)
GO
INSERT [dbo].[Stock] ([StockId], [FechaIngreso], [Cantidad], [ProductoId]) VALUES (7, CAST(N'2024-07-25' AS Date), 15, 2034)
GO
INSERT [dbo].[Stock] ([StockId], [FechaIngreso], [Cantidad], [ProductoId]) VALUES (8, CAST(N'2024-07-25' AS Date), 6, 2035)
GO
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
/****** Object:  Index [UQ__tmp_ms_x__F504A76373FC1F5C]    Script Date: 30/7/2024 14:04:14 ******/
ALTER TABLE [dbo].[Producto] ADD UNIQUE NONCLUSTERED 
(
	[CodigoBarra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ganancia] ADD  DEFAULT ((0)) FOR [Cantidad]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT ((0)) FOR [Cantidad]
GO
ALTER TABLE [dbo].[Ganancia]  WITH CHECK ADD  CONSTRAINT [FK_Ganancia_Producto] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
GO
ALTER TABLE [dbo].[Ganancia] CHECK CONSTRAINT [FK_Ganancia_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Producto] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categoria] ([CategoriaId])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Categoria_Producto]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Venta] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Producto_Venta]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Venta] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([StockId])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Stock_Venta]
GO
USE [master]
GO
ALTER DATABASE [PuntoVenta] SET  READ_WRITE 
GO
