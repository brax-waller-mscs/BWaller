USE [master]
GO
/****** Object:  Database [Skateboards]    Script Date: 10/6/2020 9:38:30 PM ******/
CREATE DATABASE [Skateboards]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Skateboards', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Skateboards.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Skateboards_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Skateboards_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Skateboards] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Skateboards].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Skateboards] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Skateboards] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Skateboards] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Skateboards] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Skateboards] SET ARITHABORT OFF 
GO
ALTER DATABASE [Skateboards] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Skateboards] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Skateboards] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Skateboards] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Skateboards] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Skateboards] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Skateboards] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Skateboards] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Skateboards] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Skateboards] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Skateboards] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Skateboards] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Skateboards] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Skateboards] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Skateboards] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Skateboards] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Skateboards] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Skateboards] SET RECOVERY FULL 
GO
ALTER DATABASE [Skateboards] SET  MULTI_USER 
GO
ALTER DATABASE [Skateboards] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Skateboards] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Skateboards] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Skateboards] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Skateboards] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Skateboards', N'ON'
GO
ALTER DATABASE [Skateboards] SET QUERY_STORE = OFF
GO
USE [Skateboards]
GO
/****** Object:  Table [dbo].[CustomBoard]    Script Date: 10/6/2020 9:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomBoard](
	[BoardId] [int] IDENTITY(1001,1) NOT NULL,
	[SkateId] [int] NOT NULL,
	[Size] [nvarchar](50) NOT NULL,
	[Shape] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomBoard] PRIMARY KEY CLUSTERED 
(
	[BoardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designer]    Script Date: 10/6/2020 9:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designer](
	[DesignerId] [int] IDENTITY(201,1) NOT NULL,
	[ShopId] [int] NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[Phone] [nchar](12) NOT NULL,
 CONSTRAINT [PK_Designer] PRIMARY KEY CLUSTERED 
(
	[DesignerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 10/6/2020 9:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(5000,1) NOT NULL,
	[SkateId] [int] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skater]    Script Date: 10/6/2020 9:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skater](
	[SkaterId] [int] IDENTITY(301,1) NOT NULL,
	[DesignId] [int] NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[Phone] [nchar](12) NOT NULL,
 CONSTRAINT [PK_Skater] PRIMARY KEY CLUSTERED 
(
	[SkaterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkateShop]    Script Date: 10/6/2020 9:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkateShop](
	[ShopId] [int] IDENTITY(101,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Phone] [nchar](12) NOT NULL,
 CONSTRAINT [PK_SkateShop] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomBoard] ON 

INSERT [dbo].[CustomBoard] ([BoardId], [SkateId], [Size], [Shape]) VALUES (1001, 302, N'7', N'Standard')
INSERT [dbo].[CustomBoard] ([BoardId], [SkateId], [Size], [Shape]) VALUES (1002, 303, N'7', N'Cruiser')
INSERT [dbo].[CustomBoard] ([BoardId], [SkateId], [Size], [Shape]) VALUES (1003, 304, N'8', N'Long')
INSERT [dbo].[CustomBoard] ([BoardId], [SkateId], [Size], [Shape]) VALUES (1004, 305, N'7', N'Cruiser')
INSERT [dbo].[CustomBoard] ([BoardId], [SkateId], [Size], [Shape]) VALUES (1005, 306, N'8', N'Standard')
SET IDENTITY_INSERT [dbo].[CustomBoard] OFF
GO
SET IDENTITY_INSERT [dbo].[Designer] ON 

INSERT [dbo].[Designer] ([DesignerId], [ShopId], [FName], [LName], [Phone]) VALUES (201, 101, N'Stan', N'Lan', N'878-878-8778')
INSERT [dbo].[Designer] ([DesignerId], [ShopId], [FName], [LName], [Phone]) VALUES (202, 102, N'Jack', N'Johnson', N'333-333-333 ')
INSERT [dbo].[Designer] ([DesignerId], [ShopId], [FName], [LName], [Phone]) VALUES (203, 102, N'SG', N'Lewis', N'545-545-5455')
INSERT [dbo].[Designer] ([DesignerId], [ShopId], [FName], [LName], [Phone]) VALUES (204, 103, N'Jimmy', N'Stack', N'686-668-6682')
SET IDENTITY_INSERT [dbo].[Designer] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceId], [SkateId], [Date]) VALUES (5000, 302, CAST(N'2020-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [SkateId], [Date]) VALUES (5001, 303, CAST(N'2020-09-25T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [SkateId], [Date]) VALUES (5002, 304, CAST(N'2020-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [SkateId], [Date]) VALUES (5003, 305, CAST(N'2020-09-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [SkateId], [Date]) VALUES (5004, 306, CAST(N'2020-07-05T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[Skater] ON 

INSERT [dbo].[Skater] ([SkaterId], [DesignId], [FName], [LName], [Phone]) VALUES (302, 201, N'Tony', N'Alva', N'222-222-2222')
INSERT [dbo].[Skater] ([SkaterId], [DesignId], [FName], [LName], [Phone]) VALUES (303, 201, N'Stacy', N'Peralta', N'545-522-3225')
INSERT [dbo].[Skater] ([SkaterId], [DesignId], [FName], [LName], [Phone]) VALUES (304, 202, N'Jay', N'Adams', N'121-123-4567')
INSERT [dbo].[Skater] ([SkaterId], [DesignId], [FName], [LName], [Phone]) VALUES (305, 203, N'Tony', N'Hawk', N'658-966-2563')
INSERT [dbo].[Skater] ([SkaterId], [DesignId], [FName], [LName], [Phone]) VALUES (306, 204, N'Nijah', N'Hudson', N'333-444-5555')
SET IDENTITY_INSERT [dbo].[Skater] OFF
GO
SET IDENTITY_INSERT [dbo].[SkateShop] ON 

INSERT [dbo].[SkateShop] ([ShopId], [City], [State], [Phone]) VALUES (101, N'Oakland', N'CA', N'888-888-888 ')
INSERT [dbo].[SkateShop] ([ShopId], [City], [State], [Phone]) VALUES (102, N'Charlotte', N'NC', N'555-555-555 ')
INSERT [dbo].[SkateShop] ([ShopId], [City], [State], [Phone]) VALUES (103, N'New York', N'NY', N'666-666-666 ')
SET IDENTITY_INSERT [dbo].[SkateShop] OFF
GO
USE [master]
GO
ALTER DATABASE [Skateboards] SET  READ_WRITE 
GO
