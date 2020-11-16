
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/15/2020 15:49:46
-- Generated from EDMX file: C:\Users\braxd\OneDrive\Desktop\Fall 20\Visual Database\BWaller\1754bWaller\1714bWaller2H\SkateShopModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SkateShop];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_SkateShopDesign]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Designs] DROP CONSTRAINT [FK_SkateShopDesign];
GO
IF OBJECT_ID(N'[dbo].[FK_SkateShopSkate]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Skates] DROP CONSTRAINT [FK_SkateShopSkate];
GO
IF OBJECT_ID(N'[dbo].[FK_DesignSkate]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Skates] DROP CONSTRAINT [FK_DesignSkate];
GO
IF OBJECT_ID(N'[dbo].[FK_InvoiceLineItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LineItems] DROP CONSTRAINT [FK_InvoiceLineItem];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomBoardLineItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LineItems] DROP CONSTRAINT [FK_CustomBoardLineItem];
GO
IF OBJECT_ID(N'[dbo].[FK_DesignCustomBoard]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomBoards] DROP CONSTRAINT [FK_DesignCustomBoard];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Skates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Skates];
GO
IF OBJECT_ID(N'[dbo].[SkateShops]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SkateShops];
GO
IF OBJECT_ID(N'[dbo].[Designs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Designs];
GO
IF OBJECT_ID(N'[dbo].[CustomBoards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomBoards];
GO
IF OBJECT_ID(N'[dbo].[Invoices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Invoices];
GO
IF OBJECT_ID(N'[dbo].[LineItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LineItems];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Skates'
CREATE TABLE [dbo].[Skates] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FName] nvarchar(max)  NOT NULL,
    [LName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [SkateShop_Id] int  NOT NULL,
    [Design_Id] int  NOT NULL
);
GO

-- Creating table 'SkateShops'
CREATE TABLE [dbo].[SkateShops] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Designs'
CREATE TABLE [dbo].[Designs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FName] nvarchar(max)  NOT NULL,
    [LName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [SkateShop_Id] int  NOT NULL
);
GO

-- Creating table 'CustomBoards'
CREATE TABLE [dbo].[CustomBoards] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Size] nvarchar(max)  NOT NULL,
    [Shape] nvarchar(max)  NOT NULL,
    [Amount] nvarchar(max)  NOT NULL,
    [Design_Id] int  NOT NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LineItems'
CREATE TABLE [dbo].[LineItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Invoice_Id] int  NOT NULL,
    [CustomBoard_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Skates'
ALTER TABLE [dbo].[Skates]
ADD CONSTRAINT [PK_Skates]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SkateShops'
ALTER TABLE [dbo].[SkateShops]
ADD CONSTRAINT [PK_SkateShops]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Designs'
ALTER TABLE [dbo].[Designs]
ADD CONSTRAINT [PK_Designs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CustomBoards'
ALTER TABLE [dbo].[CustomBoards]
ADD CONSTRAINT [PK_CustomBoards]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LineItems'
ALTER TABLE [dbo].[LineItems]
ADD CONSTRAINT [PK_LineItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SkateShop_Id] in table 'Designs'
ALTER TABLE [dbo].[Designs]
ADD CONSTRAINT [FK_SkateShopDesign]
    FOREIGN KEY ([SkateShop_Id])
    REFERENCES [dbo].[SkateShops]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SkateShopDesign'
CREATE INDEX [IX_FK_SkateShopDesign]
ON [dbo].[Designs]
    ([SkateShop_Id]);
GO

-- Creating foreign key on [SkateShop_Id] in table 'Skates'
ALTER TABLE [dbo].[Skates]
ADD CONSTRAINT [FK_SkateShopSkate]
    FOREIGN KEY ([SkateShop_Id])
    REFERENCES [dbo].[SkateShops]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SkateShopSkate'
CREATE INDEX [IX_FK_SkateShopSkate]
ON [dbo].[Skates]
    ([SkateShop_Id]);
GO

-- Creating foreign key on [Design_Id] in table 'Skates'
ALTER TABLE [dbo].[Skates]
ADD CONSTRAINT [FK_DesignSkate]
    FOREIGN KEY ([Design_Id])
    REFERENCES [dbo].[Designs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DesignSkate'
CREATE INDEX [IX_FK_DesignSkate]
ON [dbo].[Skates]
    ([Design_Id]);
GO

-- Creating foreign key on [Invoice_Id] in table 'LineItems'
ALTER TABLE [dbo].[LineItems]
ADD CONSTRAINT [FK_InvoiceLineItem]
    FOREIGN KEY ([Invoice_Id])
    REFERENCES [dbo].[Invoices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceLineItem'
CREATE INDEX [IX_FK_InvoiceLineItem]
ON [dbo].[LineItems]
    ([Invoice_Id]);
GO

-- Creating foreign key on [CustomBoard_Id] in table 'LineItems'
ALTER TABLE [dbo].[LineItems]
ADD CONSTRAINT [FK_CustomBoardLineItem]
    FOREIGN KEY ([CustomBoard_Id])
    REFERENCES [dbo].[CustomBoards]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomBoardLineItem'
CREATE INDEX [IX_FK_CustomBoardLineItem]
ON [dbo].[LineItems]
    ([CustomBoard_Id]);
GO

-- Creating foreign key on [Design_Id] in table 'CustomBoards'
ALTER TABLE [dbo].[CustomBoards]
ADD CONSTRAINT [FK_DesignCustomBoard]
    FOREIGN KEY ([Design_Id])
    REFERENCES [dbo].[Designs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DesignCustomBoard'
CREATE INDEX [IX_FK_DesignCustomBoard]
ON [dbo].[CustomBoards]
    ([Design_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------