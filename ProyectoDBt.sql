USE [master]
GO
/****** Object:  Database [PruebaDB]    Script Date: 10/17/2023 6:05:32 PM ******/
CREATE DATABASE [PruebaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PruebaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PruebaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PruebaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PruebaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PruebaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PruebaDB] SET  MULTI_USER 
GO
ALTER DATABASE [PruebaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PruebaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PruebaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PruebaDB', N'ON'
GO
ALTER DATABASE [PruebaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [PruebaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PruebaDB]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 10/17/2023 6:05:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Domicilio] [varchar](250) NULL,
	[Telefono] [varchar](50) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 10/17/2023 6:05:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Apellido] [varchar](250) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormasdePago]    Script Date: 10/17/2023 6:05:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormasdePago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormasdePago] [varchar](250) NOT NULL,
 CONSTRAINT [PK_FormasdePago] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 10/17/2023 6:05:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[FechaPedido] [datetime] NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidosDetalle]    Script Date: 10/17/2023 6:05:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_PedidosDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 10/17/2023 6:05:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Caducidad] [date] NOT NULL,
	[PrecioCompra] [float] NOT NULL,
	[PrecioVenta] [float] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductosViadeAdministracion]    Script Date: 10/17/2023 6:05:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductosViadeAdministracion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProductos] [int] NOT NULL,
	[IdViadeAdministracion] [int] NOT NULL,
 CONSTRAINT [PK_ProductosViadeAdministracion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 10/17/2023 6:05:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Folio] [int] NOT NULL,
	[Total] [float] NOT NULL,
	[IdFormaPago] [int] NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentasDetalles]    Script Date: 10/17/2023 6:05:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentasDetalles](
	[IdVentas] [int] NOT NULL,
	[IdProductos] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
	[Subtotal] [float] NOT NULL,
 CONSTRAINT [PK_VentasDetalles] PRIMARY KEY CLUSTERED 
(
	[IdVentas] ASC,
	[IdProductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViasdeAdministracion]    Script Date: 10/17/2023 6:05:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViasdeAdministracion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Vias] [varchar](250) NOT NULL,
 CONSTRAINT [PK_ViadeAdministracion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Id], [Nombre], [Domicilio], [Telefono]) VALUES (1, N'Publico General', NULL, NULL)
INSERT [dbo].[Clientes] ([Id], [Nombre], [Domicilio], [Telefono]) VALUES (2, N'Alex', N'Isabel #36', N'6623391850')
INSERT [dbo].[Clientes] ([Id], [Nombre], [Domicilio], [Telefono]) VALUES (3, N'Jose', N'Milan #23', N'6698182339')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellido], [Email], [Telefono]) VALUES (1, N'Juan', N'Lopez', N'juan@gmail.com', N'6629301859')
INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellido], [Email], [Telefono]) VALUES (2, N'Alejandro', N'Rivera', N'alex@hotmail.com', N'6623891090')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[FormasdePago] ON 

INSERT [dbo].[FormasdePago] ([Id], [FormasdePago]) VALUES (1, N'Efectivo')
INSERT [dbo].[FormasdePago] ([Id], [FormasdePago]) VALUES (2, N'Tarjeta de Credito')
INSERT [dbo].[FormasdePago] ([Id], [FormasdePago]) VALUES (3, N'Tarjeta de Debito')
SET IDENTITY_INSERT [dbo].[FormasdePago] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([Id], [IdCliente], [IdEmpleado], [FechaPedido]) VALUES (1, 2, 1, CAST(N'2023-10-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[PedidosDetalle] ON 

INSERT [dbo].[PedidosDetalle] ([Id], [IdPedido], [IdProducto], [Cantidad]) VALUES (1, 1, 1, 10)
INSERT [dbo].[PedidosDetalle] ([Id], [IdPedido], [IdProducto], [Cantidad]) VALUES (2, 1, 3, 6)
SET IDENTITY_INSERT [dbo].[PedidosDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id], [Descripcion], [Caducidad], [PrecioCompra], [PrecioVenta]) VALUES (1, N'Paracetamol', CAST(N'2030-08-08' AS Date), 50.9, 60)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Caducidad], [PrecioCompra], [PrecioVenta]) VALUES (2, N'Alopurinol', CAST(N'2033-05-08' AS Date), 150.9, 260)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Caducidad], [PrecioCompra], [PrecioVenta]) VALUES (3, N'Paracetamol', CAST(N'2033-05-08' AS Date), 70.9, 90)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Caducidad], [PrecioCompra], [PrecioVenta]) VALUES (4, N'Corticoesteroides ', CAST(N'2029-01-02' AS Date), 135.5, 170)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Caducidad], [PrecioCompra], [PrecioVenta]) VALUES (5, N'Fenilefrina ', CAST(N'2030-05-10' AS Date), 255.1, 300)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductosViadeAdministracion] ON 

INSERT [dbo].[ProductosViadeAdministracion] ([Id], [IdProductos], [IdViadeAdministracion]) VALUES (1, 1, 1)
INSERT [dbo].[ProductosViadeAdministracion] ([Id], [IdProductos], [IdViadeAdministracion]) VALUES (2, 2, 1)
INSERT [dbo].[ProductosViadeAdministracion] ([Id], [IdProductos], [IdViadeAdministracion]) VALUES (3, 3, 4)
INSERT [dbo].[ProductosViadeAdministracion] ([Id], [IdProductos], [IdViadeAdministracion]) VALUES (4, 4, 4)
INSERT [dbo].[ProductosViadeAdministracion] ([Id], [IdProductos], [IdViadeAdministracion]) VALUES (5, 5, 3)
SET IDENTITY_INSERT [dbo].[ProductosViadeAdministracion] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([Id], [IdCliente], [IdEmpleado], [Folio], [Total], [IdFormaPago], [FechaVenta]) VALUES (1, 1, 1, 3928, 300, 1, CAST(N'2023-10-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Ventas] ([Id], [IdCliente], [IdEmpleado], [Folio], [Total], [IdFormaPago], [FechaVenta]) VALUES (2, 2, 1, 326463, 600, 2, CAST(N'2023-05-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
INSERT [dbo].[VentasDetalles] ([IdVentas], [IdProductos], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (1, 1, 5, 60, 300)
INSERT [dbo].[VentasDetalles] ([IdVentas], [IdProductos], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (2, 1, 10, 60, 600)
GO
SET IDENTITY_INSERT [dbo].[ViasdeAdministracion] ON 

INSERT [dbo].[ViasdeAdministracion] ([Id], [Vias]) VALUES (1, N'Oral')
INSERT [dbo].[ViasdeAdministracion] ([Id], [Vias]) VALUES (2, N'Cutánea ')
INSERT [dbo].[ViasdeAdministracion] ([Id], [Vias]) VALUES (3, N'Oftálmica ')
INSERT [dbo].[ViasdeAdministracion] ([Id], [Vias]) VALUES (4, N'Nasal ')
SET IDENTITY_INSERT [dbo].[ViasdeAdministracion] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Empleados]    Script Date: 10/17/2023 6:05:32 PM ******/
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [IX_Empleados] UNIQUE NONCLUSTERED 
(
	[Telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ventas]    Script Date: 10/17/2023 6:05:32 PM ******/
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [IX_Ventas] UNIQUE NONCLUSTERED 
(
	[Folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Empleados]
GO
ALTER TABLE [dbo].[PedidosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidosDetalle_Pedidos] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedidos] ([Id])
GO
ALTER TABLE [dbo].[PedidosDetalle] CHECK CONSTRAINT [FK_PedidosDetalle_Pedidos]
GO
ALTER TABLE [dbo].[PedidosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidosDetalle_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[PedidosDetalle] CHECK CONSTRAINT [FK_PedidosDetalle_Productos]
GO
ALTER TABLE [dbo].[ProductosViadeAdministracion]  WITH CHECK ADD  CONSTRAINT [FK_ProductosViadeAdministracion_Productos] FOREIGN KEY([IdProductos])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[ProductosViadeAdministracion] CHECK CONSTRAINT [FK_ProductosViadeAdministracion_Productos]
GO
ALTER TABLE [dbo].[ProductosViadeAdministracion]  WITH CHECK ADD  CONSTRAINT [FK_ProductosViadeAdministracion_ViadeAdministracion] FOREIGN KEY([IdViadeAdministracion])
REFERENCES [dbo].[ViasdeAdministracion] ([Id])
GO
ALTER TABLE [dbo].[ProductosViadeAdministracion] CHECK CONSTRAINT [FK_ProductosViadeAdministracion_ViadeAdministracion]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Empleados]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_FormasdePago] FOREIGN KEY([IdFormaPago])
REFERENCES [dbo].[FormasdePago] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_FormasdePago]
GO
ALTER TABLE [dbo].[VentasDetalles]  WITH CHECK ADD  CONSTRAINT [FK_VentasDetalles_Productos] FOREIGN KEY([IdProductos])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[VentasDetalles] CHECK CONSTRAINT [FK_VentasDetalles_Productos]
GO
ALTER TABLE [dbo].[VentasDetalles]  WITH CHECK ADD  CONSTRAINT [FK_VentasDetalles_Ventas] FOREIGN KEY([IdVentas])
REFERENCES [dbo].[Ventas] ([Id])
GO
ALTER TABLE [dbo].[VentasDetalles] CHECK CONSTRAINT [FK_VentasDetalles_Ventas]
GO
USE [master]
GO
ALTER DATABASE [PruebaDB] SET  READ_WRITE 
GO
