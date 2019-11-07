USE [Videojuegos]
GO
CREATE TABLE [dbo].[Grupos](
[IdGrupo] [int] IDENTITY(1,1) NOT NULL,
[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grupos] PRIMARY KEY CLUSTERED ([IdGrupo] ASC)
);
GO
CREATE TABLE [dbo].[Usuarios](
[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
[Login] [nvarchar](20) NOT NULL,
[Password] [varchar](64) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED ([IdUsuario] ASC)
);
GO
CREATE TABLE [dbo].[UsuariosGrupos](
[IdUsuarioGrupo] [int] IDENTITY(1,1) NOT NULL,
[IdUsuario] [int] NOT NULL,
[IdGrupo] [int] NOT NULL,
 CONSTRAINT [PK_UsuariosGrupos] PRIMARY KEY CLUSTERED ([IdUsuarioGrupo] ASC)
);
GO

ALTER TABLE [dbo].[Usuarios] ADD CONSTRAINT [AK_Usuarios_Login] UNIQUE ([Login]);
GO
ALTER TABLE [dbo].[Grupos] ADD CONSTRAINT [AK_Grupos_Nombre] UNIQUE ([Nombre]);
GO
ALTER TABLE [dbo].[UsuariosGrupos] ADD CONSTRAINT [FK_UsuariosGrupos_Grupos]
FOREIGN KEY([IdGrupo])REFERENCES [dbo].[Grupos] ([IdGrupo])
GO
ALTER TABLE [dbo].[UsuariosGrupos] ADD CONSTRAINT [FK_UsuariosGrupos_Usuarios]
FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuariosGrupos] ADD CONSTRAINT [AK_UsuariosGrupos_UsuGrup]
UNIQUE ([IdUsuario],[IdGrupo])
GO

USE Videojuegos;
GO
INSERT INTO Usuarios (Login, Password) VALUES
('admin', '723ac1bf7bdf89a24880ed8450dc4107889d19bf9e1ec91eeec5fa6a171ddb1f'),
('customer',
'723ac1bf7bdf89a24880ed8450dc4107889d19bf9e1ec91eeec5fa6a171ddb1f');
INSERT INTO Grupos (Nombre) VALUES
('admin'), ('customer');
INSERT INTO UsuariosGrupos (IdUsuario, IdGrupo) VALUES
(1, 1), (2, 2);