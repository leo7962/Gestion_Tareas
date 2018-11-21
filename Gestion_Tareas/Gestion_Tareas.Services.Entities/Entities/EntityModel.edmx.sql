
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/20/2018 19:42:40
-- Generated from EDMX file: C:\Users\Ingen\source\repos\Gestion_Tareas\Gestion_Tareas\Gestion_Tareas.Services.Entities\Entities\EntityModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Tareas];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Materias'
CREATE TABLE [dbo].[Materias] (
    [IdMateria] int IDENTITY(1,1) NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tareas'
CREATE TABLE [dbo].[Tareas] (
    [IdTareas] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [materia] int  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Materia_IdMateria] int  NOT NULL
);
GO

-- Creating table 'TipoMaterias'
CREATE TABLE [dbo].[TipoMaterias] (
    [IdTipoMateria] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MateriasTipoMateria'
CREATE TABLE [dbo].[MateriasTipoMateria] (
    [Materia_IdMateria] int  NOT NULL,
    [TipoMaterias_IdTipoMateria] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdMateria] in table 'Materias'
ALTER TABLE [dbo].[Materias]
ADD CONSTRAINT [PK_Materias]
    PRIMARY KEY CLUSTERED ([IdMateria] ASC);
GO

-- Creating primary key on [IdTareas] in table 'Tareas'
ALTER TABLE [dbo].[Tareas]
ADD CONSTRAINT [PK_Tareas]
    PRIMARY KEY CLUSTERED ([IdTareas] ASC);
GO

-- Creating primary key on [IdTipoMateria] in table 'TipoMaterias'
ALTER TABLE [dbo].[TipoMaterias]
ADD CONSTRAINT [PK_TipoMaterias]
    PRIMARY KEY CLUSTERED ([IdTipoMateria] ASC);
GO

-- Creating primary key on [Materia_IdMateria], [TipoMaterias_IdTipoMateria] in table 'MateriasTipoMateria'
ALTER TABLE [dbo].[MateriasTipoMateria]
ADD CONSTRAINT [PK_MateriasTipoMateria]
    PRIMARY KEY CLUSTERED ([Materia_IdMateria], [TipoMaterias_IdTipoMateria] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Materia_IdMateria] in table 'Tareas'
ALTER TABLE [dbo].[Tareas]
ADD CONSTRAINT [FK_MateriasTareas]
    FOREIGN KEY ([Materia_IdMateria])
    REFERENCES [dbo].[Materias]
        ([IdMateria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MateriasTareas'
CREATE INDEX [IX_FK_MateriasTareas]
ON [dbo].[Tareas]
    ([Materia_IdMateria]);
GO

-- Creating foreign key on [Materia_IdMateria] in table 'MateriasTipoMateria'
ALTER TABLE [dbo].[MateriasTipoMateria]
ADD CONSTRAINT [FK_MateriasTipoMateria_Materias]
    FOREIGN KEY ([Materia_IdMateria])
    REFERENCES [dbo].[Materias]
        ([IdMateria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TipoMaterias_IdTipoMateria] in table 'MateriasTipoMateria'
ALTER TABLE [dbo].[MateriasTipoMateria]
ADD CONSTRAINT [FK_MateriasTipoMateria_TipoMateria]
    FOREIGN KEY ([TipoMaterias_IdTipoMateria])
    REFERENCES [dbo].[TipoMaterias]
        ([IdTipoMateria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MateriasTipoMateria_TipoMateria'
CREATE INDEX [IX_FK_MateriasTipoMateria_TipoMateria]
ON [dbo].[MateriasTipoMateria]
    ([TipoMaterias_IdTipoMateria]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------