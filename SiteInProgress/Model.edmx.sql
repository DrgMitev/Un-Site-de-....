
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/21/2016 22:31:09
-- Generated from EDMX file: C:\Users\speed\Documents\Visual Studio 2015\Projects\SiteInProgress\SiteInProgress\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [C:\USERS\SPEED\DOCUMENTS\VISUAL STUDIO 2015\PROJECTS\SITEINPROGRESS\SITEINPROGRESS\APP_DATA\SERVERDATABASE.MDF]
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUsersImageGalleries_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUsersImageGalleries] DROP CONSTRAINT [FK_AspNetUsersImageGalleries_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUsersImageGalleries_ImageGalleries]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUsersImageGalleries] DROP CONSTRAINT [FK_AspNetUsersImageGalleries_ImageGalleries];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoriesImageGalleries_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CategoriesImageGalleries] DROP CONSTRAINT [FK_CategoriesImageGalleries_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoriesImageGalleries_ImageGallery]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CategoriesImageGalleries] DROP CONSTRAINT [FK_CategoriesImageGalleries_ImageGallery];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[ImageGalleries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ImageGalleries];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsersImageGalleries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsersImageGalleries];
GO
IF OBJECT_ID(N'[dbo].[CategoriesImageGalleries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategoriesImageGalleries];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(max)  NOT NULL,
    [CategoryCount] int  NULL
);
GO

-- Creating table 'ImageGalleries'
CREATE TABLE [dbo].[ImageGalleries] (
    [FileID] int IDENTITY(1,1) NOT NULL,
    [FileSize] int  NOT NULL,
    [FileName] varchar(200)  NOT NULL,
    [FileData] varbinary(max)  NOT NULL,
    [UserID] nvarchar(128)  NOT NULL,
    [DateOfPosting] datetime  NOT NULL,
    [Title] nvarchar(max)  NULL,
    [CategoryId] int  NOT NULL,
    [Info] nvarchar(max)  NOT NULL,
    [Tel] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsersImageGalleries'
CREATE TABLE [dbo].[AspNetUsersImageGalleries] (
    [AspNetUsers_Id] nvarchar(128)  NOT NULL,
    [ImageGalleries_FileID] int  NOT NULL
);
GO

-- Creating table 'CategoriesImageGalleries'
CREATE TABLE [dbo].[CategoriesImageGalleries] (
    [Categories_Id] int  NOT NULL,
    [ImageGalleries_FileID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [FileID] in table 'ImageGalleries'
ALTER TABLE [dbo].[ImageGalleries]
ADD CONSTRAINT [PK_ImageGalleries]
    PRIMARY KEY CLUSTERED ([FileID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- Creating primary key on [AspNetUsers_Id], [ImageGalleries_FileID] in table 'AspNetUsersImageGalleries'
ALTER TABLE [dbo].[AspNetUsersImageGalleries]
ADD CONSTRAINT [PK_AspNetUsersImageGalleries]
    PRIMARY KEY CLUSTERED ([AspNetUsers_Id], [ImageGalleries_FileID] ASC);
GO

-- Creating primary key on [Categories_Id], [ImageGalleries_FileID] in table 'CategoriesImageGalleries'
ALTER TABLE [dbo].[CategoriesImageGalleries]
ADD CONSTRAINT [PK_CategoriesImageGalleries]
    PRIMARY KEY CLUSTERED ([Categories_Id], [ImageGalleries_FileID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUsersImageGalleries'
ALTER TABLE [dbo].[AspNetUsersImageGalleries]
ADD CONSTRAINT [FK_AspNetUsersImageGalleries_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ImageGalleries_FileID] in table 'AspNetUsersImageGalleries'
ALTER TABLE [dbo].[AspNetUsersImageGalleries]
ADD CONSTRAINT [FK_AspNetUsersImageGalleries_ImageGalleries]
    FOREIGN KEY ([ImageGalleries_FileID])
    REFERENCES [dbo].[ImageGalleries]
        ([FileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUsersImageGalleries_ImageGalleries'
CREATE INDEX [IX_FK_AspNetUsersImageGalleries_ImageGalleries]
ON [dbo].[AspNetUsersImageGalleries]
    ([ImageGalleries_FileID]);
GO

-- Creating foreign key on [Categories_Id] in table 'CategoriesImageGalleries'
ALTER TABLE [dbo].[CategoriesImageGalleries]
ADD CONSTRAINT [FK_CategoriesImageGalleries_Category]
    FOREIGN KEY ([Categories_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ImageGalleries_FileID] in table 'CategoriesImageGalleries'
ALTER TABLE [dbo].[CategoriesImageGalleries]
ADD CONSTRAINT [FK_CategoriesImageGalleries_ImageGallery]
    FOREIGN KEY ([ImageGalleries_FileID])
    REFERENCES [dbo].[ImageGalleries]
        ([FileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriesImageGalleries_ImageGallery'
CREATE INDEX [IX_FK_CategoriesImageGalleries_ImageGallery]
ON [dbo].[CategoriesImageGalleries]
    ([ImageGalleries_FileID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------