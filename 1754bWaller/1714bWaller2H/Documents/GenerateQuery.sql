USE [master]
GO
/****** Object:  Database [SkateShop]    Script Date: 11/15/2020 6:37:25 PM ******/
CREATE DATABASE [SkateShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SkateShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\SkateShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SkateShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\SkateShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SkateShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SkateShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SkateShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SkateShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SkateShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SkateShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SkateShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [SkateShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SkateShop] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [SkateShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SkateShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SkateShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SkateShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SkateShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SkateShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SkateShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SkateShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SkateShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SkateShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SkateShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SkateShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SkateShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SkateShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SkateShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SkateShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SkateShop] SET  MULTI_USER 
GO
ALTER DATABASE [SkateShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SkateShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SkateShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SkateShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SkateShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SkateShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SkateShop', N'ON'
GO
ALTER DATABASE [SkateShop] SET QUERY_STORE = OFF
GO
USE [SkateShop]
GO
/****** Object:  Table [dbo].[CustomBoards]    Script Date: 11/15/2020 6:37:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomBoards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Size] [nvarchar](max) NOT NULL,
	[Shape] [nvarchar](max) NOT NULL,
	[Design_Id] [int] NOT NULL,
 CONSTRAINT [PK_CustomBoards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designs]    Script Date: 11/15/2020 6:37:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](max) NOT NULL,
	[LName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[SkateShop_Id] [int] NOT NULL,
 CONSTRAINT [PK_Designs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 11/15/2020 6:37:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineItems]    Script Date: 11/15/2020 6:37:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Invoice_Id] [int] NOT NULL,
	[CustomBoard_Id] [int] NOT NULL,
	[Amount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_LineItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skates]    Script Date: 11/15/2020 6:37:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](max) NOT NULL,
	[LName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[SkateShop_Id] [int] NOT NULL,
	[Design_Id] [int] NOT NULL,
 CONSTRAINT [PK_Skates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkateShops]    Script Date: 11/15/2020 6:37:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkateShops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SkateShops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomBoards] ON 
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (3, N'7', N'Surf', 2)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (4, N'7', N'Regular', 3)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (5, N'7', N'Cruiser', 4)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (6, N'8', N'Surf', 5)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (7, N'8', N'Regular', 6)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (8, N'8', N'Cruiser', 7)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (9, N'7', N'Cruiser', 8)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (10, N'8', N'Surf', 9)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (11, N'8', N'Regular', 3)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (12, N'7', N'Surf', 4)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (13, N'7', N'Regular', 5)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (14, N'8', N'Cruiser', 9)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (15, N'8', N'Crusier', 8)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (16, N'7', N'Cruiser', 6)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (17, N'7', N'Regular', 3)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (18, N'8', N'Surf', 5)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (19, N'8', N'Regular', 2)
GO
INSERT [dbo].[CustomBoards] ([Id], [Size], [Shape], [Design_Id]) VALUES (20, N'7', N'Cruiser', 7)
GO
SET IDENTITY_INSERT [dbo].[CustomBoards] OFF
GO
SET IDENTITY_INSERT [dbo].[Designs] ON 
GO
INSERT [dbo].[Designs] ([Id], [FName], [LName], [Phone], [SkateShop_Id]) VALUES (2, N'Brax', N'Waller', N'535-535-5353', 2)
GO
INSERT [dbo].[Designs] ([Id], [FName], [LName], [Phone], [SkateShop_Id]) VALUES (3, N'Lane', N'Cherek', N'456-456-4564', 3)
GO
INSERT [dbo].[Designs] ([Id], [FName], [LName], [Phone], [SkateShop_Id]) VALUES (4, N'Luke', N'Skywalker', N'897-888-9699', 2)
GO
INSERT [dbo].[Designs] ([Id], [FName], [LName], [Phone], [SkateShop_Id]) VALUES (5, N'Micheal', N'Scott', N'777-898-888', 4)
GO
INSERT [dbo].[Designs] ([Id], [FName], [LName], [Phone], [SkateShop_Id]) VALUES (6, N'Bev', N'Worley', N'555-555-8888', 5)
GO
INSERT [dbo].[Designs] ([Id], [FName], [LName], [Phone], [SkateShop_Id]) VALUES (7, N'Jeff', N'Mueller', N'666-888-5555', 3)
GO
INSERT [dbo].[Designs] ([Id], [FName], [LName], [Phone], [SkateShop_Id]) VALUES (8, N'Brad', N'Pitt', N'222-333-555', 5)
GO
INSERT [dbo].[Designs] ([Id], [FName], [LName], [Phone], [SkateShop_Id]) VALUES (9, N'Lindsey', N'Cherek', N'982-356-6688', 4)
GO
SET IDENTITY_INSERT [dbo].[Designs] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoices] ON 
GO
INSERT [dbo].[Invoices] ([Id], [Date]) VALUES (1, N'10-22-2020')
GO
INSERT [dbo].[Invoices] ([Id], [Date]) VALUES (2, N'10-23-2020')
GO
INSERT [dbo].[Invoices] ([Id], [Date]) VALUES (3, N'10-24-2020')
GO
INSERT [dbo].[Invoices] ([Id], [Date]) VALUES (4, N'11-26-2020')
GO
INSERT [dbo].[Invoices] ([Id], [Date]) VALUES (5, N'10-22-2020')
GO
INSERT [dbo].[Invoices] ([Id], [Date]) VALUES (6, N'11-01-2020')
GO
SET IDENTITY_INSERT [dbo].[Invoices] OFF
GO
SET IDENTITY_INSERT [dbo].[LineItems] ON 
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (1, 1, 3, 65.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (2, 2, 4, 50.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (3, 3, 20, 80.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (4, 4, 18, 75.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (6, 5, 5, 80.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (7, 6, 7, 70.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (8, 1, 6, 75.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (9, 2, 8, 100.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (10, 3, 9, 80.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (11, 4, 10, 75.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (12, 5, 11, 70.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (13, 6, 12, 65.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (14, 1, 13, 50.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (15, 2, 14, 100.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (16, 3, 15, 100.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (17, 4, 16, 80.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (18, 5, 17, 50.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [CustomBoard_Id], [Amount]) VALUES (19, 6, 19, 70.0000)
GO
SET IDENTITY_INSERT [dbo].[LineItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Skates] ON 
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (1, N'Chris', N'Cole', N'123-456-7999', 2, 2)
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (2, N'Paul', N'Rodriguez', N'658-899-8989', 3, 3)
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (3, N'Lizzie', N'Armanto', N'252-252-2222', 4, 4)
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (4, N'Tom', N'Schaar', N'558-855-5555', 5, 5)
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (5, N'Laun', N'Oliveira', N'888-888-8585', 2, 6)
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (6, N'Pedro', N'Barros', N'777-888-9999', 3, 7)
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (7, N'Shane', N'Nell', N'555-666-7777', 4, 8)
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (8, N'Ryan', N'Sheckler', N'333-333-5555', 5, 9)
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (9, N'Danny', N'Way', N'111-222-3333', 2, 5)
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (10, N'Bam', N'Margera', N'356-558-1253', 3, 8)
GO
INSERT [dbo].[Skates] ([Id], [FName], [LName], [Phone], [SkateShop_Id], [Design_Id]) VALUES (11, N'Eric', N'Koston', N'575-689-8888', 4, 6)
GO
SET IDENTITY_INSERT [dbo].[Skates] OFF
GO
SET IDENTITY_INSERT [dbo].[SkateShops] ON 
GO
INSERT [dbo].[SkateShops] ([Id], [City], [State], [Phone]) VALUES (2, N'Lexington', N'NC', N'222-222-2222')
GO
INSERT [dbo].[SkateShops] ([Id], [City], [State], [Phone]) VALUES (3, N'New York', N'NY', N'333-333-3333')
GO
INSERT [dbo].[SkateShops] ([Id], [City], [State], [Phone]) VALUES (4, N'Minneapolis', N'MN', N'444-444-4444')
GO
INSERT [dbo].[SkateShops] ([Id], [City], [State], [Phone]) VALUES (5, N'Red Wing', N'MN', N'555-555-5555')
GO
SET IDENTITY_INSERT [dbo].[SkateShops] OFF
GO
/****** Object:  Index [IX_FK_DesignCustomBoard]    Script Date: 11/15/2020 6:37:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_DesignCustomBoard] ON [dbo].[CustomBoards]
(
	[Design_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SkateShopDesign]    Script Date: 11/15/2020 6:37:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SkateShopDesign] ON [dbo].[Designs]
(
	[SkateShop_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CustomBoardLineItem]    Script Date: 11/15/2020 6:37:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CustomBoardLineItem] ON [dbo].[LineItems]
(
	[CustomBoard_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_InvoiceLineItem]    Script Date: 11/15/2020 6:37:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_InvoiceLineItem] ON [dbo].[LineItems]
(
	[Invoice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DesignSkate]    Script Date: 11/15/2020 6:37:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_DesignSkate] ON [dbo].[Skates]
(
	[Design_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SkateShopSkate]    Script Date: 11/15/2020 6:37:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SkateShopSkate] ON [dbo].[Skates]
(
	[SkateShop_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomBoards]  WITH CHECK ADD  CONSTRAINT [FK_DesignCustomBoard] FOREIGN KEY([Design_Id])
REFERENCES [dbo].[Designs] ([Id])
GO
ALTER TABLE [dbo].[CustomBoards] CHECK CONSTRAINT [FK_DesignCustomBoard]
GO
ALTER TABLE [dbo].[Designs]  WITH CHECK ADD  CONSTRAINT [FK_SkateShopDesign] FOREIGN KEY([SkateShop_Id])
REFERENCES [dbo].[SkateShops] ([Id])
GO
ALTER TABLE [dbo].[Designs] CHECK CONSTRAINT [FK_SkateShopDesign]
GO
ALTER TABLE [dbo].[Skates]  WITH CHECK ADD  CONSTRAINT [FK_DesignSkate] FOREIGN KEY([Design_Id])
REFERENCES [dbo].[Designs] ([Id])
GO
ALTER TABLE [dbo].[Skates] CHECK CONSTRAINT [FK_DesignSkate]
GO
ALTER TABLE [dbo].[Skates]  WITH CHECK ADD  CONSTRAINT [FK_SkateShopSkate] FOREIGN KEY([SkateShop_Id])
REFERENCES [dbo].[SkateShops] ([Id])
GO
ALTER TABLE [dbo].[Skates] CHECK CONSTRAINT [FK_SkateShopSkate]
GO
USE [master]
GO
ALTER DATABASE [SkateShop] SET  READ_WRITE 
GO
