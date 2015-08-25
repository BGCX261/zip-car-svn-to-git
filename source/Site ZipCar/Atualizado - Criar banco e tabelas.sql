USE [master]
GO
/****** Object:  Database [ZipCar]    Script Date: 04/04/2012 10:23:53 ******/

/*
CREATE DATABASE [ZipCar] ON  PRIMARY 
( NAME = N'ZipCar', FILENAME = N'C:\Users\0059263\Desktop\ZipCar\ZipCar.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ZipCar_log', FILENAME = N'C:\Users\0059263\Desktop\ZipCar\ZipCar_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
*/

CREATE DATABASE [ZipCar] ON  PRIMARY 
( NAME = N'ZipCar', FILENAME = N'C:\Temp\ZipCar.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ZipCar_log', FILENAME = N'C:\Temp\ZipCar_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [ZipCar] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZipCar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZipCar] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ZipCar] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ZipCar] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ZipCar] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ZipCar] SET ARITHABORT OFF
GO
ALTER DATABASE [ZipCar] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ZipCar] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ZipCar] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ZipCar] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ZipCar] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ZipCar] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ZipCar] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ZipCar] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ZipCar] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ZipCar] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ZipCar] SET  DISABLE_BROKER
GO
ALTER DATABASE [ZipCar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ZipCar] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ZipCar] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ZipCar] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ZipCar] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ZipCar] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ZipCar] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ZipCar] SET  READ_WRITE
GO
ALTER DATABASE [ZipCar] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ZipCar] SET  MULTI_USER
GO
ALTER DATABASE [ZipCar] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ZipCar] SET DB_CHAINING OFF
GO
USE [ZipCar]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 04/04/2012 10:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[CPFCNPJ] [varchar](18) NOT NULL,
	[pesTip] [varchar](1) NOT NULL,
	[datanasc] [date] NOT NULL,
	[carteiraNum]  [varchar](11) NOT NULL,
	[carteiraVal]  [date] NOT NULL,
	[carteiraCat]  [varchar](1) NOT NULL,
	[numCartao] [varchar](16) NOT NULL,
	[cartaoVal]  [date] NOT NULL,
	[telefoneRes] [varchar](12) NOT NULL,
	[telefoneCel] [varchar](12) NOT NULL,
	[status] [varchar](1) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[uf] [varchar](2) NOT NULL,
	[logradouro] [varchar](100) NOT NULL,
	[numero] [int] NOT NULL,
	[complemento] [varchar](100) NULL,
	[bairro] [varchar](50) NOT NULL,
	[cep] [varchar](10) NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 04/04/2012 10:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] NOT NULL,
	[descricao] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Garagem]    Script Date: 04/04/2012 10:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Garagem](
	[idGaragem] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[cidade] [varchar](100) NOT NULL,
	[bairro] [varchar](100) NOT NULL,
	[cep] [varchar](10) NOT NULL,
	[logradouro] [varchar](100) NOT NULL,
	[num] [int] NOT NULL,
	[complemento] [varchar](100) NULL,
	[capacidade] [int] NULL,
	[latitude] [varchar](15) NULL,
	[longitude] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[idGaragem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 04/04/2012 10:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[usuario] [varchar](30) NOT NULL,
	[senha] [nchar](10) NOT NULL,
	[idCliente] [int] NOT NULL,
	[tipo]      [int] NOT NULL,   
 constraint [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carro]    Script Date: 04/04/2012 10:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carro](
	[idCarro] [int] NOT NULL,
	[idCategoria] [int] NOT NULL,
	[marca] [varchar](100) NOT NULL,
	[modelo] [varchar](100) NOT NULL,
	[ano] [int] NOT NULL,
	[placa] [varchar](8) NOT NULL,
	[renavam] [varchar](9) NOT NULL,
	[cor] [varchar](20) NOT NULL,
	[ar] [varchar](1) NOT NULL,
	[direcao] [varchar](1) NOT NULL,
	[4portas] [varchar](1) NOT NULL,
	[gps] [varchar](1) NOT NULL,
	[valorloc] [decimal](5,2) NOT NULL,
	[URLimagem] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCarro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente_aluga_Carro]    Script Date: 04/04/2012 10:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente_aluga_Carro](
	[idCliente] [int] NOT NULL,
	[idCarro] [int] NOT NULL,
	[dataHoraRetirado] [datetime] NOT NULL,
	[dataHoraDevolvido] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC,
	[idCarro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carro_has_Garagem]    Script Date: 04/04/2012 10:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carro_has_Garagem](
	[idGaragem] [int] NOT NULL,
	[idCarro] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idGaragem] ASC,
	[idCarro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Table_1_idCliente]    Script Date: 04/04/2012 10:23:55 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_idCliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Table_1_idCliente]
GO
/****** Object:  ForeignKey [Fk_idCategoria]    Script Date: 04/04/2012 10:23:55 ******/
ALTER TABLE [dbo].[Carro]  WITH CHECK ADD  CONSTRAINT [Fk_idCategoria] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Carro] CHECK CONSTRAINT [Fk_idCategoria]
GO
/****** Object:  ForeignKey [fk_Cliente_has_Carro_Carro1]    Script Date: 04/04/2012 10:23:55 ******/
ALTER TABLE [dbo].[Cliente_aluga_Carro]  WITH CHECK ADD  CONSTRAINT [fk_Cliente_has_Carro_Carro1] FOREIGN KEY([idCarro])
REFERENCES [dbo].[Carro] ([idCarro])
GO
ALTER TABLE [dbo].[Cliente_aluga_Carro] CHECK CONSTRAINT [fk_Cliente_has_Carro_Carro1]
GO
/****** Object:  ForeignKey [fk_Cliente_has_Carro_Cliente1]    Script Date: 04/04/2012 10:23:55 ******/
ALTER TABLE [dbo].[Cliente_aluga_Carro]  WITH CHECK ADD  CONSTRAINT [fk_Cliente_has_Carro_Cliente1] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Cliente_aluga_Carro] CHECK CONSTRAINT [fk_Cliente_has_Carro_Cliente1]
GO
/****** Object:  ForeignKey [fk_Carro_has_Garagem_Carro1]    Script Date: 04/04/2012 10:23:55 ******/
ALTER TABLE [dbo].[Carro_has_Garagem]  WITH CHECK ADD  CONSTRAINT [fk_Carro_has_Garagem_Carro1] FOREIGN KEY([idCarro])
REFERENCES [dbo].[Carro] ([idCarro])
GO
ALTER TABLE [dbo].[Carro_has_Garagem] CHECK CONSTRAINT [fk_Carro_has_Garagem_Carro1]
GO
/****** Object:  ForeignKey [fk_Carro_has_Garagem_Garagem1]    Script Date: 04/04/2012 10:23:55 ******/
ALTER TABLE [dbo].[Carro_has_Garagem]  WITH CHECK ADD  CONSTRAINT [fk_Carro_has_Garagem_Garagem1] FOREIGN KEY([idGaragem])
REFERENCES [dbo].[Garagem] ([idGaragem])
GO
ALTER TABLE [dbo].[Carro_has_Garagem] CHECK CONSTRAINT [fk_Carro_has_Garagem_Garagem1]
GO
