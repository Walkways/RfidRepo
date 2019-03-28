USE [master]
GO
/****** Object:  Database [RfidDB]    Script Date: 26/03/2019 14:21:06 ******/
CREATE DATABASE [RfidDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RfidDB', FILENAME = N'C:\Users\admin\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\RfidDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RfidDB_log', FILENAME = N'C:\Users\admin\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\RfidDB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RfidDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RfidDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RfidDB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [RfidDB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [RfidDB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [RfidDB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [RfidDB] SET ARITHABORT ON 
GO
ALTER DATABASE [RfidDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RfidDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RfidDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RfidDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RfidDB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [RfidDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [RfidDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RfidDB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [RfidDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RfidDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RfidDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RfidDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RfidDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RfidDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RfidDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RfidDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RfidDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RfidDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RfidDB] SET  MULTI_USER 
GO
ALTER DATABASE [RfidDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RfidDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RfidDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RfidDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RfidDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RfidDB] SET QUERY_STORE = OFF
GO
USE [RfidDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [RfidDB]
GO
/****** Object:  Table [dbo].[abonnement]    Script Date: 26/03/2019 14:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[abonnement](
	[id_abonnement] [int] IDENTITY(1,1) NOT NULL,
	[date_fin] [datetime] NOT NULL,
	[solde] [int] NOT NULL,
	[id_type_abonnement] [int] NOT NULL,
 CONSTRAINT [abonnement_PK] PRIMARY KEY CLUSTERED 
(
	[id_abonnement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adresse]    Script Date: 26/03/2019 14:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adresse](
	[id_adresse] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [varchar](255) NOT NULL,
	[complement] [varchar](50) NOT NULL,
	[cp] [varchar](10) NOT NULL,
	[ville] [varchar](255) NOT NULL,
 CONSTRAINT [adresse_PK] PRIMARY KEY CLUSTERED 
(
	[id_adresse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[app_role]    Script Date: 26/03/2019 14:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[app_role](
	[id_app_role] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
 CONSTRAINT [app_role_PK] PRIMARY KEY CLUSTERED 
(
	[id_app_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[badge]    Script Date: 26/03/2019 14:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[badge](
	[id_badge] [int] IDENTITY(1,1) NOT NULL,
	[uid] [varchar](50) NOT NULL,
 CONSTRAINT [badge_PK] PRIMARY KEY CLUSTERED 
(
	[id_badge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cours]    Script Date: 26/03/2019 14:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cours](
	[id_cours] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [varchar](50) NOT NULL,
	[max_participant] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[id_type_cours] [int],
 CONSTRAINT [cours_PK] PRIMARY KEY CLUSTERED 
(
	[id_cours] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecteur]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecteur](
	[id_lecteur] [int] IDENTITY(1,1) NOT NULL,
	[localisation] [varchar](255) NOT NULL,
 CONSTRAINT [lecteur_PK] PRIMARY KEY CLUSTERED 
(
	[id_lecteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[motif]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[motif](
	[id_motif] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [varchar](2545) NOT NULL,
 CONSTRAINT [motif_PK] PRIMARY KEY CLUSTERED 
(
	[id_motif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mouvement]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mouvement](
	[id_mouvement] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[uid_pass] [varchar](255) NOT NULL,
	[id_type_mouvement] [int] NOT NULL,
	[id_users] [int] NULL,
	[id_lecteur] [int] NOT NULL,
 CONSTRAINT [mouvement_PK] PRIMARY KEY CLUSTERED 
(
	[id_mouvement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [varchar](255) NOT NULL,
 CONSTRAINT [role_PK] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_abonnement]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_abonnement](
	[id_type_abonnement] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[solde_initial] [int] NOT NULL,
	[duree] [varchar](50) NOT NULL,
 CONSTRAINT [type_abonnement_PK] PRIMARY KEY CLUSTERED 
(
	[id_type_abonnement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_cours]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_cours](
	[id_type_cours] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [varchar](255) NOT NULL,
 CONSTRAINT [type_cours_PK] PRIMARY KEY CLUSTERED 
(
	[id_type_cours] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_mouvement]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_mouvement](
	[id_type_mouvement] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [varchar](255) NOT NULL,
 CONSTRAINT [type_mouvement_PK] PRIMARY KEY CLUSTERED 
(
	[id_type_mouvement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id_users] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[prenom] [varchar](50) NOT NULL,
	[passe] [varchar](100) NOT NULL,
	[tel] [varchar](10) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[actif] [bit] NOT NULL,
	[id_adresse] [int] NOT NULL,
 CONSTRAINT [users_PK] PRIMARY KEY CLUSTERED 
(
	[id_users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_abonnement]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_abonnement](
	[id_abonnement] [int] NOT NULL,
	[id_users] [int] NOT NULL,
	[date_debut] [datetime] NOT NULL,
	[date_fin] [datetime] NOT NULL,
 CONSTRAINT [users_abonnement_PK] PRIMARY KEY CLUSTERED 
(
	[id_abonnement] ASC,
	[id_users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_app_role]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_app_role](
	[id_app_role] [int] NOT NULL,
	[id_users] [int] NOT NULL,
 CONSTRAINT [users_app_role_PK] PRIMARY KEY CLUSTERED 
(
	[id_app_role] ASC,
	[id_users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_badge_motif]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_badge_motif](
	[id_motif] [int] NOT NULL,
	[id_badge] [int] NOT NULL,
	[id_users] [int] NOT NULL,
	[date_affectation] [datetime] NOT NULL,
	[date_retour] [datetime] NOT NULL,
 CONSTRAINT [users_badge_motif_PK] PRIMARY KEY CLUSTERED 
(
	[id_motif] ASC,
	[id_badge] ASC,
	[id_users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_cours_role]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_cours_role](
	[id_users] [int] NOT NULL,
	[id_cours] [int] NOT NULL,
	[id_role] [int] NOT NULL,
 CONSTRAINT [users_cours_role_PK] PRIMARY KEY CLUSTERED 
(
	[id_users] ASC,
	[id_cours] ASC,
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_role]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_role](
	[id_role] [int] NOT NULL,
	[id_users] [int] NOT NULL,
 CONSTRAINT [users_role_PK] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC,
	[id_users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_type_cours]    Script Date: 26/03/2019 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_type_cours](
	[id_type_cours] [int] NOT NULL,
	[id_users] [int] NOT NULL,
 CONSTRAINT [users_type_cours_PK] PRIMARY KEY CLUSTERED 
(
	[id_type_cours] ASC,
	[id_users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[adresse] ON 

INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1, N'495-1449 Etiam Rd.', N'Bretagne', N'67213', N'Saint-Malo')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (2, N'972-5190 Ac Av.', N'NO', N'56038', N'Roubaix')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (3, N'422-4200 A, Av.', N'Midi-Pyrénées', N'06820', N'Toulouse')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (4, N'1777 Feugiat Road', N'Midi-Pyrénées', N'30292', N'Albi')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (5, N'P.O. Box 705, 6189 Vel Rd.', N'Île-de-France', N'15126', N'Vitry-sur-Seine')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (6, N'Ap #665-4284 Felis. Street', N'Aquitaine', N'03615', N'Périgueux')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (7, N'8215 Donec St.', N'CE', N'25125', N'Blois')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (8, N'7037 Curabitur St.', N'NO', N'18200', N'Liévin')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (9, N'442-826 Nunc. Av.', N'NO', N'08351', N'Lens')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (10, N'979-9824 Morbi Av.', N'AL', N'36212', N'Mulhouse')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (11, N'834-2142 Euismod Ave', N'CE', N'98694', N'Tours')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (12, N'934 Ultricies Av.', N'HA', N'13932', N'Rouen')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (13, N'P.O. Box 344, 7050 Risus Road', N'IL', N'76431', N'Saint-Denis')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (14, N'205-4827 Eleifend Rd.', N'Île-de-France', N'88237', N'Aubervilliers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (15, N'Ap #167-7096 Parturient Street', N'Provence-Alpes-Côte d''Azur', N'97244', N'Avignon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (16, N'Ap #865-2901 Suscipit, Av.', N'LO', N'93786', N'Metz')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (17, N'Ap #591-6431 Ultrices Rd.', N'Pays de la Loire', N'74790', N'Saumur')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (18, N'P.O. Box 568, 111 Morbi Av.', N'AQ', N'91240', N'Saint-Médard-en-Jalles')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (19, N'526-183 Dictum Av.', N'IL', N'75000', N'Vitry-sur-Seine')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (20, N'6320 Lacus. Rd.', N'Limousin', N'46238', N'Brive-la-Gaillarde')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (21, N'882-6899 Nunc Rd.', N'Limousin', N'22982', N'Brive-la-Gaillarde')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (22, N'5298 Risus. St.', N'Centre', N'42320', N'Chartres')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (23, N'866-7670 Feugiat. Rd.', N'Centre', N'91622', N'Bourges')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (24, N'948 Lectus Av.', N'AL', N'95463', N'Schiltigheim')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (25, N'Ap #580-687 Duis Rd.', N'Île-de-France', N'36756', N'Colombes')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (26, N'419-3616 Non, St.', N'Provence-Alpes-Côte d''Azur', N'55441', N'Nice')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (27, N'P.O. Box 762, 7636 Eu St.', N'Provence-Alpes-Côte d''Azur', N'29717', N'Istres')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (28, N'3800 Sem Avenue', N'Languedoc-Roussillon', N'52949', N'Perpignan')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (29, N'P.O. Box 823, 4273 Donec St.', N'Centre', N'77182', N'Châteauroux')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (30, N'Ap #208-7915 Luctus, Road', N'LO', N'90484', N'Metz')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (31, N'Ap #697-7563 Vitae Street', N'MI', N'70476', N'Rodez')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (32, N'8228 Luctus, St.', N'Île-de-France', N'02250', N'Vitry-sur-Seine')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (33, N'Ap #430-4215 Mattis. Rd.', N'PA', N'79202', N'Angers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (34, N'575-8217 Erat Rd.', N'Languedoc-Roussillon', N'01726', N'Alès')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (35, N'P.O. Box 175, 4105 Cras St.', N'PR', N'31408', N'Le Cannet')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (36, N'929-6637 Molestie Av.', N'AQ', N'11116', N'Mérignac')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (37, N'8154 Tempus St.', N'Île-de-France', N'03651', N'Boulogne-Billancourt')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (38, N'331-2178 Arcu. Rd.', N'NO', N'27676', N'Lens')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (39, N'P.O. Box 123, 2080 Ipsum Ave', N'LI', N'89327', N'Limoges')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (40, N'P.O. Box 882, 9256 Gravida Rd.', N'Languedoc-Roussillon', N'19231', N'Sète')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (41, N'Ap #949-4638 Bibendum. Street', N'Franche-Comté', N'30081', N'Besançon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (42, N'9364 Justo Rd.', N'BA', N'68952', N'Saint-Lô')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (43, N'660-9754 Sed Rd.', N'Midi-Pyrénées', N'55780', N'Colomiers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (44, N'5213 Aliquam Ave', N'Nord-Pas-de-Calais', N'33104', N'Liévin')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (45, N'Ap #566-4242 Luctus St.', N'MI', N'56367', N'Toulouse')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (46, N'295 Eget Road', N'IL', N'89852', N'Courbevoie')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (47, N'Ap #723-4580 Nulla Av.', N'Midi-Pyrénées', N'16283', N'Castres')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (48, N'Ap #332-2104 Egestas. St.', N'Île-de-France', N'74468', N'Créteil')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (49, N'334 Erat Rd.', N'IL', N'48808', N'Nanterre')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (50, N'9586 Interdum. Rd.', N'Aquitaine', N'85411', N'Mérignac')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (51, N'946-541 Laoreet, Rd.', N'PA', N'79272', N'Le Mans')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (52, N'3630 Mus. Road', N'PI', N'48347', N'Laon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (53, N'719-1805 Tincidunt. Road', N'Île-de-France', N'75176', N'Asnières-sur-Seine')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (54, N'698-4815 Dapibus St.', N'BA', N'62666', N'Saint-Lô')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (55, N'Ap #594-8534 Posuere Rd.', N'Aquitaine', N'37493', N'Agen')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (56, N'475-1607 Vestibulum St.', N'Centre', N'79192', N'Joué-lès-Tours')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (57, N'6051 Quis Rd.', N'AQ', N'74193', N'Mérignac')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (58, N'1227 Dictum Rd.', N'IL', N'64765', N'Noisy-le-Grand')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (59, N'4026 Ante. Avenue', N'IL', N'20395', N'Aubervilliers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (60, N'P.O. Box 692, 4170 Mauris Av.', N'CE', N'65758', N'Joué-lès-Tours')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (61, N'228 Eu Road', N'AQ', N'36815', N'Périgueux')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (62, N'3757 Sed Av.', N'CE', N'40990', N'Blois')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (63, N'400-2176 Vestibulum Rd.', N'Nord-Pas-de-Calais', N'48757', N'Maubeuge')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (64, N'P.O. Box 441, 7841 Sem Road', N'NO', N'87698', N'Liévin')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (65, N'867-778 Venenatis St.', N'Picardie', N'36253', N'Laon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (66, N'4453 Libero Road', N'NO', N'46784', N'Villeneuve-d''Ascq')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (67, N'P.O. Box 309, 4183 Velit Av.', N'IL', N'43939', N'Vitry-sur-Seine')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (68, N'890-3302 Vitae, Av.', N'Corse', N'39085', N'Ajaccio')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (69, N'P.O. Box 648, 4822 Amet, St.', N'Midi-Pyrénées', N'40672', N'Rodez')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (70, N'4285 Quisque St.', N'Limousin', N'11819', N'Brive-la-Gaillarde')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (71, N'P.O. Box 471, 1702 Enim Rd.', N'BA', N'05949', N'Cherbourg-Octeville')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (72, N'Ap #108-3196 Euismod Avenue', N'Provence-Alpes-Côte d''Azur', N'51349', N'Hyères')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (73, N'537-9143 Nunc Rd.', N'IL', N'79579', N'Versailles')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (74, N'617-4917 Et St.', N'Poitou-Charentes', N'13836', N'Niort')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (75, N'6690 Donec Av.', N'Nord-Pas-de-Calais', N'45815', N'Lille')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (76, N'Ap #139-7112 Morbi St.', N'Provence-Alpes-Côte d''Azur', N'20553', N'Nice')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (77, N'P.O. Box 558, 4712 Sed, Rd.', N'Auvergne', N'07138', N'Vichy')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (78, N'1671 Pede. St.', N'BO', N'61062', N'Nevers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (79, N'Ap #563-4573 Massa. Rd.', N'IL', N'01738', N'Versailles')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (80, N'6596 Sed St.', N'NO', N'30440', N'Maubeuge')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (81, N'P.O. Box 577, 5643 Magna. Rd.', N'Centre', N'88497', N'Vierzon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (82, N'428-731 Est. Road', N'Aquitaine', N'48845', N'Talence')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (83, N'P.O. Box 531, 7016 Eu Street', N'Midi-Pyrénées', N'63841', N'Colomiers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (84, N'358-6066 Porttitor Av.', N'Auvergne', N'35852', N'Le Puy-en-Velay')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (85, N'388-3880 Duis Rd.', N'Île-de-France', N'34844', N'Rueil-Malmaison')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (86, N'Ap #723-3318 Lacinia St.', N'Centre', N'05252', N'Châteauroux')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (87, N'P.O. Box 659, 4422 Ultrices St.', N'Alsace', N'85333', N'Mulhouse')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (88, N'600-2603 Et, Street', N'LA', N'76712', N'Alès')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (89, N'375-8247 Nunc Street', N'LO', N'76399', N'Épinal')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (90, N'7995 At Ave', N'Franche-Comté', N'82804', N'Pontarlier')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (91, N'Ap #593-3821 Mauris Road', N'AU', N'88754', N'Montluçon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (92, N'P.O. Box 246, 1907 Vestibulum. St.', N'BR', N'98046', N'Saint-Brieuc')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (93, N'P.O. Box 913, 6057 Mauris Avenue', N'Bourgogne', N'00327', N'Mâcon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (94, N'Ap #267-6526 Hendrerit St.', N'LA', N'87539', N'Carcassonne')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (95, N'P.O. Box 163, 5164 Mauris Avenue', N'BR', N'14525', N'Rennes')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (96, N'Ap #651-6969 Libero Ave', N'LO', N'07971', N'Montigny-lès-Metz')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (97, N'P.O. Box 250, 4720 Elit Street', N'Nord-Pas-de-Calais', N'61259', N'Dunkerque')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (98, N'Ap #561-2780 Tellus, St.', N'PR', N'95230', N'Antibes')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (99, N'3022 Velit. St.', N'Poitou-Charentes', N'86386', N'Niort')
GO
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1001, N'495-1449 Etiam Rd.', N'Bretagne', N'67213', N'Saint-Malo')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1002, N'972-5190 Ac Av.', N'NO', N'56038', N'Roubaix')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1003, N'422-4200 A, Av.', N'Midi-Pyrénées', N'06820', N'Toulouse')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1004, N'1777 Feugiat Road', N'Midi-Pyrénées', N'30292', N'Albi')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1005, N'P.O. Box 705, 6189 Vel Rd.', N'Île-de-France', N'15126', N'Vitry-sur-Seine')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1006, N'Ap #665-4284 Felis. Street', N'Aquitaine', N'03615', N'Périgueux')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1007, N'8215 Donec St.', N'CE', N'25125', N'Blois')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1008, N'7037 Curabitur St.', N'NO', N'18200', N'Liévin')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1009, N'442-826 Nunc. Av.', N'NO', N'08351', N'Lens')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1010, N'979-9824 Morbi Av.', N'AL', N'36212', N'Mulhouse')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1011, N'834-2142 Euismod Ave', N'CE', N'98694', N'Tours')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1012, N'934 Ultricies Av.', N'HA', N'13932', N'Rouen')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1013, N'P.O. Box 344, 7050 Risus Road', N'IL', N'76431', N'Saint-Denis')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1014, N'205-4827 Eleifend Rd.', N'Île-de-France', N'88237', N'Aubervilliers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1015, N'Ap #167-7096 Parturient Street', N'Provence-Alpes-Côte d''Azur', N'97244', N'Avignon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1016, N'Ap #865-2901 Suscipit, Av.', N'LO', N'93786', N'Metz')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1017, N'Ap #591-6431 Ultrices Rd.', N'Pays de la Loire', N'74790', N'Saumur')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1018, N'P.O. Box 568, 111 Morbi Av.', N'AQ', N'91240', N'Saint-Médard-en-Jalles')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1019, N'526-183 Dictum Av.', N'IL', N'75000', N'Vitry-sur-Seine')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1020, N'6320 Lacus. Rd.', N'Limousin', N'46238', N'Brive-la-Gaillarde')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1021, N'882-6899 Nunc Rd.', N'Limousin', N'22982', N'Brive-la-Gaillarde')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1022, N'5298 Risus. St.', N'Centre', N'42320', N'Chartres')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1023, N'866-7670 Feugiat. Rd.', N'Centre', N'91622', N'Bourges')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1024, N'948 Lectus Av.', N'AL', N'95463', N'Schiltigheim')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1025, N'Ap #580-687 Duis Rd.', N'Île-de-France', N'36756', N'Colombes')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1026, N'419-3616 Non, St.', N'Provence-Alpes-Côte d''Azur', N'55441', N'Nice')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1027, N'P.O. Box 762, 7636 Eu St.', N'Provence-Alpes-Côte d''Azur', N'29717', N'Istres')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1028, N'3800 Sem Avenue', N'Languedoc-Roussillon', N'52949', N'Perpignan')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1029, N'P.O. Box 823, 4273 Donec St.', N'Centre', N'77182', N'Châteauroux')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1030, N'Ap #208-7915 Luctus, Road', N'LO', N'90484', N'Metz')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1031, N'Ap #697-7563 Vitae Street', N'MI', N'70476', N'Rodez')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1032, N'8228 Luctus, St.', N'Île-de-France', N'02250', N'Vitry-sur-Seine')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1033, N'Ap #430-4215 Mattis. Rd.', N'PA', N'79202', N'Angers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1034, N'575-8217 Erat Rd.', N'Languedoc-Roussillon', N'01726', N'Alès')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1035, N'P.O. Box 175, 4105 Cras St.', N'PR', N'31408', N'Le Cannet')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1036, N'929-6637 Molestie Av.', N'AQ', N'11116', N'Mérignac')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1037, N'8154 Tempus St.', N'Île-de-France', N'03651', N'Boulogne-Billancourt')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1038, N'331-2178 Arcu. Rd.', N'NO', N'27676', N'Lens')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1039, N'P.O. Box 123, 2080 Ipsum Ave', N'LI', N'89327', N'Limoges')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1040, N'P.O. Box 882, 9256 Gravida Rd.', N'Languedoc-Roussillon', N'19231', N'Sète')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1041, N'Ap #949-4638 Bibendum. Street', N'Franche-Comté', N'30081', N'Besançon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1042, N'9364 Justo Rd.', N'BA', N'68952', N'Saint-Lô')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1043, N'660-9754 Sed Rd.', N'Midi-Pyrénées', N'55780', N'Colomiers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1044, N'5213 Aliquam Ave', N'Nord-Pas-de-Calais', N'33104', N'Liévin')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1045, N'Ap #566-4242 Luctus St.', N'MI', N'56367', N'Toulouse')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1046, N'295 Eget Road', N'IL', N'89852', N'Courbevoie')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1047, N'Ap #723-4580 Nulla Av.', N'Midi-Pyrénées', N'16283', N'Castres')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1048, N'Ap #332-2104 Egestas. St.', N'Île-de-France', N'74468', N'Créteil')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1049, N'334 Erat Rd.', N'IL', N'48808', N'Nanterre')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1050, N'9586 Interdum. Rd.', N'Aquitaine', N'85411', N'Mérignac')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1051, N'946-541 Laoreet, Rd.', N'PA', N'79272', N'Le Mans')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1052, N'3630 Mus. Road', N'PI', N'48347', N'Laon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1053, N'719-1805 Tincidunt. Road', N'Île-de-France', N'75176', N'Asnières-sur-Seine')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1054, N'698-4815 Dapibus St.', N'BA', N'62666', N'Saint-Lô')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1055, N'Ap #594-8534 Posuere Rd.', N'Aquitaine', N'37493', N'Agen')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1056, N'475-1607 Vestibulum St.', N'Centre', N'79192', N'Joué-lès-Tours')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1057, N'6051 Quis Rd.', N'AQ', N'74193', N'Mérignac')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1058, N'1227 Dictum Rd.', N'IL', N'64765', N'Noisy-le-Grand')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1059, N'4026 Ante. Avenue', N'IL', N'20395', N'Aubervilliers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1060, N'P.O. Box 692, 4170 Mauris Av.', N'CE', N'65758', N'Joué-lès-Tours')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1061, N'228 Eu Road', N'AQ', N'36815', N'Périgueux')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1062, N'3757 Sed Av.', N'CE', N'40990', N'Blois')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1063, N'400-2176 Vestibulum Rd.', N'Nord-Pas-de-Calais', N'48757', N'Maubeuge')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1064, N'P.O. Box 441, 7841 Sem Road', N'NO', N'87698', N'Liévin')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1065, N'867-778 Venenatis St.', N'Picardie', N'36253', N'Laon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1066, N'4453 Libero Road', N'NO', N'46784', N'Villeneuve-d''Ascq')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1067, N'P.O. Box 309, 4183 Velit Av.', N'IL', N'43939', N'Vitry-sur-Seine')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1068, N'890-3302 Vitae, Av.', N'Corse', N'39085', N'Ajaccio')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1069, N'P.O. Box 648, 4822 Amet, St.', N'Midi-Pyrénées', N'40672', N'Rodez')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1070, N'4285 Quisque St.', N'Limousin', N'11819', N'Brive-la-Gaillarde')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1071, N'P.O. Box 471, 1702 Enim Rd.', N'BA', N'05949', N'Cherbourg-Octeville')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1072, N'Ap #108-3196 Euismod Avenue', N'Provence-Alpes-Côte d''Azur', N'51349', N'Hyères')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1073, N'537-9143 Nunc Rd.', N'IL', N'79579', N'Versailles')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1074, N'617-4917 Et St.', N'Poitou-Charentes', N'13836', N'Niort')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1075, N'6690 Donec Av.', N'Nord-Pas-de-Calais', N'45815', N'Lille')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1076, N'Ap #139-7112 Morbi St.', N'Provence-Alpes-Côte d''Azur', N'20553', N'Nice')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1077, N'P.O. Box 558, 4712 Sed, Rd.', N'Auvergne', N'07138', N'Vichy')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1078, N'1671 Pede. St.', N'BO', N'61062', N'Nevers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1079, N'Ap #563-4573 Massa. Rd.', N'IL', N'01738', N'Versailles')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1080, N'6596 Sed St.', N'NO', N'30440', N'Maubeuge')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1081, N'P.O. Box 577, 5643 Magna. Rd.', N'Centre', N'88497', N'Vierzon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1082, N'428-731 Est. Road', N'Aquitaine', N'48845', N'Talence')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1083, N'P.O. Box 531, 7016 Eu Street', N'Midi-Pyrénées', N'63841', N'Colomiers')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1084, N'358-6066 Porttitor Av.', N'Auvergne', N'35852', N'Le Puy-en-Velay')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1085, N'388-3880 Duis Rd.', N'Île-de-France', N'34844', N'Rueil-Malmaison')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1086, N'Ap #723-3318 Lacinia St.', N'Centre', N'05252', N'Châteauroux')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1087, N'P.O. Box 659, 4422 Ultrices St.', N'Alsace', N'85333', N'Mulhouse')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1088, N'600-2603 Et, Street', N'LA', N'76712', N'Alès')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1089, N'375-8247 Nunc Street', N'LO', N'76399', N'Épinal')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1090, N'7995 At Ave', N'Franche-Comté', N'82804', N'Pontarlier')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1091, N'Ap #593-3821 Mauris Road', N'AU', N'88754', N'Montluçon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1092, N'P.O. Box 246, 1907 Vestibulum. St.', N'BR', N'98046', N'Saint-Brieuc')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1093, N'P.O. Box 913, 6057 Mauris Avenue', N'Bourgogne', N'00327', N'Mâcon')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1094, N'Ap #267-6526 Hendrerit St.', N'LA', N'87539', N'Carcassonne')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1095, N'P.O. Box 163, 5164 Mauris Avenue', N'BR', N'14525', N'Rennes')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1096, N'Ap #651-6969 Libero Ave', N'LO', N'07971', N'Montigny-lès-Metz')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1097, N'P.O. Box 250, 4720 Elit Street', N'Nord-Pas-de-Calais', N'61259', N'Dunkerque')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1098, N'Ap #561-2780 Tellus, St.', N'PR', N'95230', N'Antibes')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1099, N'3022 Velit. St.', N'Poitou-Charentes', N'86386', N'Niort')
INSERT [dbo].[adresse] ([id_adresse], [libelle], [complement], [cp], [ville]) VALUES (1100, N'859-1478 Dolor. Rd.', N'IL', N'19779', N'Drancy')
GO
SET IDENTITY_INSERT [dbo].[adresse] OFF
SET IDENTITY_INSERT [dbo].[app_role] ON 

INSERT [dbo].[app_role] ([id_app_role], [nom]) VALUES (1, N'admin')
INSERT [dbo].[app_role] ([id_app_role], [nom]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[app_role] OFF
SET IDENTITY_INSERT [dbo].[Cours] ON 

INSERT [dbo].[Cours] ([id_cours], [libelle], [max_participant], [date], [id_type_cours]) VALUES (1, N'initiation fitness', 20, CAST(N'2019-04-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Cours] ([id_cours], [libelle], [max_participant], [date], [id_type_cours]) VALUES (2, N'musculation niveau 2', 12, CAST(N'2019-05-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Cours] ([id_cours], [libelle], [max_participant], [date], [id_type_cours]) VALUES (10, N'muscu33', 15, CAST(N'2019-05-14T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Cours] ([id_cours], [libelle], [max_participant], [date], [id_type_cours]) VALUES (15, N'Ma muscu', 20, CAST(N'2019-05-14T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Cours] ([id_cours], [libelle], [max_participant], [date], [id_type_cours]) VALUES (25, N'musculation niveau 2', 12, CAST(N'2019-05-14T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Cours] ([id_cours], [libelle], [max_participant], [date], [id_type_cours]) VALUES (26, N'musculation niveau 2', 12, CAST(N'2019-05-14T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Cours] ([id_cours], [libelle], [max_participant], [date], [id_type_cours]) VALUES (27, N'musculation niveau 2', 12, CAST(N'2019-05-14T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Cours] ([id_cours], [libelle], [max_participant], [date], [id_type_cours]) VALUES (28, N'muscu23', 12, CAST(N'2019-05-14T00:00:00.000' AS DateTime), 10)
SET IDENTITY_INSERT [dbo].[Cours] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id_role], [libelle]) VALUES (1, N'client')
INSERT [dbo].[role] ([id_role], [libelle]) VALUES (2, N'professeur')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[type_cours] ON 

INSERT [dbo].[type_cours] ([id_type_cours], [libelle]) VALUES (1, N'Musculation')
INSERT [dbo].[type_cours] ([id_type_cours], [libelle]) VALUES (2, N'Fitness')
INSERT [dbo].[type_cours] ([id_type_cours], [libelle]) VALUES (3, N'Natation')
INSERT [dbo].[type_cours] ([id_type_cours], [libelle]) VALUES (5, N'Autre')
INSERT [dbo].[type_cours] ([id_type_cours], [libelle]) VALUES (10, N'liiib')
SET IDENTITY_INSERT [dbo].[type_cours] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (11, N'Shields', N'Zachery', N'$2a$10$1FqAPvOCOz1S9X5CPrMAu.fs/7Th3Zb2ZVQD1WbJTchGO/zpKSdAm', N'0342964583', N'natoque.penatibus.et@sapienimperdietornare.ca', 1, 28)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (12, N'Osborne', N'Tiger', N'CWM00DOY8DD', N'0454579593', N'natoque.penatibus.et@mattisornarelectus.co.uk', 0, 94)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (13, N'Dotson', N'Erasmus', N'MNY05BSC9ZX', N'0819751100', N'Curae@aliquamerosturpis.net', 1, 37)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (14, N'Tran', N'Walter', N'GWL69PAO3WP', N'0449375456', N'Nam.tempor.diam@Duis.org', 0, 2)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (15, N'Mcpherson', N'Bradley', N'NVO79CND1BY', N'0110676064', N'ac.urna.Ut@sed.net', 1, 52)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (16, N'Holmes', N'Emma', N'DQJ05JJD4OG', N'0113588769', N'ac.eleifend@urnaNuncquis.net', 0, 92)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (17, N'Burke', N'Merrill', N'COI27KEG9ZR', N'0901101321', N'fringilla.est@tempusnon.org', 1, 56)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (18, N'Weber', N'Miranda', N'GFV54RSJ2YI', N'0684273440', N'sem.molestie@ante.com', 0, 7)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (19, N'Wilcox', N'Amanda', N'JIV39YMP3VY', N'0762486022', N'Ut.sagittis@metuseuerat.net', 1, 90)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (20, N'Melendez', N'Abel', N'MDI28KWT4MP', N'0177324538', N'cursus.Nunc@Duisacarcu.ca', 0, 41)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (21, N'Bowers', N'Tyler', N'VYH99IPG5GJ', N'0990793587', N'metus@Infaucibus.edu', 1, 95)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (22, N'Carlson', N'Brynne', N'ARM39QYD2PX', N'0921022724', N'sem@dolorelit.edu', 0, 72)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (23, N'Gallegos', N'Chester', N'MHC14KCZ0WB', N'0479716677', N'eget.volutpat.ornare@adipiscingenimmi.ca', 1, 56)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (24, N'Snider', N'Roanna', N'KOY55ERW8OT', N'0481996206', N'arcu@adipiscingnonluctus.com', 0, 39)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (25, N'Larsen', N'Quinn', N'PYL50AAJ6KL', N'0600308710', N'augue.malesuada.malesuada@ultricessitamet.ca', 1, 49)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (26, N'Norman', N'Lunea', N'EMN19MPJ5LR', N'0584641125', N'pede.ultrices.a@egetmetusIn.com', 0, 49)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (27, N'Knowles', N'Wanda', N'XCU35QSF0CD', N'0274148921', N'orci@necquamCurabitur.ca', 1, 31)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (28, N'Frye', N'Brett', N'SFO01CDF6PP', N'0525951794', N'vitae@commodoipsumSuspendisse.ca', 0, 78)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (29, N'Simmons', N'Renee', N'BZQ08ROL8AK', N'0530502582', N'tempus.risus@convallisestvitae.co.uk', 1, 91)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (30, N'Harper', N'Audra', N'LOV56OJO4XX', N'0872162958', N'adipiscing@Vestibulumanteipsum.co.uk', 0, 81)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (31, N'Estrada', N'Leo', N'XRT58FOI2LW', N'0597475379', N'diam@aliquetdiam.edu', 1, 57)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (32, N'Hooper', N'Dennis', N'IQW62UBC3MH', N'0652791291', N'nulla.In@nonmagnaNam.com', 0, 2)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (33, N'Neal', N'Yen', N'VCQ43LQC4MN', N'0412772757', N'vel.turpis@necmollis.ca', 1, 3)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (34, N'Freeman', N'Chaim', N'DNQ17ZTU9BY', N'0718107310', N'scelerisque.lorem@fames.net', 0, 69)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (35, N'Rose', N'Chaim', N'CTE91GCI7AQ', N'0246097779', N'luctus@blanditNamnulla.com', 1, 42)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (36, N'Dale', N'Aubrey', N'MPM48KWQ4BE', N'0816684747', N'Mauris.magna@fermentumconvallisligula.ca', 0, 88)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (37, N'Stuart', N'Gay', N'AYC54NQQ0RA', N'0170507326', N'ridiculus.mus@Proin.org', 1, 8)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (38, N'Silva', N'Dahlia', N'BER56FID4EX', N'0109647187', N'ante.dictum.cursus@diamPellentesquehabitant.ca', 0, 3)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (39, N'Levine', N'Duncan', N'FOI78WIV1EH', N'0329542018', N'ligula@Fuscediamnunc.ca', 1, 17)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (40, N'Rollins', N'Lee', N'CNW39FSI7UK', N'0696709296', N'enim.nec.tempus@sociis.org', 0, 70)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (41, N'Dawson', N'Channing', N'ZYV10VZK7HZ', N'0982629083', N'et@molestiedapibusligula.org', 1, 97)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (42, N'Morales', N'Geraldine', N'GQV66NPM9WP', N'0588327710', N'purus.in.molestie@adipiscingelit.com', 0, 40)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (43, N'Taylor', N'Ferris', N'UTL38JKW8ER', N'0911482166', N'diam.luctus.lobortis@volutpatNulla.edu', 1, 89)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (44, N'Shannon', N'Yetta', N'ZRT65GGG6SE', N'0994459974', N'amet.ultricies@loremsemper.org', 0, 89)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (45, N'Davidson', N'Wesley', N'JPY44VZL4GC', N'0375135519', N'rutrum.non.hendrerit@Phasellus.net', 1, 32)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (46, N'Rush', N'Miranda', N'QTR18MWH8NS', N'0595499898', N'nec.urna.suscipit@loremloremluctus.edu', 0, 26)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (47, N'Schmidt', N'Dustin', N'KMN01QFX4TT', N'0574602838', N'diam@aliquetodio.org', 1, 86)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (48, N'Crosby', N'Rosalyn', N'FPW56YCZ1LN', N'0711649541', N'Duis.gravida.Praesent@lobortis.net', 0, 69)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (49, N'Calderon', N'Cassidy', N'SSF04LEX0OH', N'0370621183', N'tincidunt.congue.turpis@estNunclaoreet.ca', 1, 71)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (50, N'Webster', N'Odessa', N'PUD34MSP4JU', N'0993102082', N'Aliquam.ornare@ornareIn.com', 0, 61)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (51, N'Hicks', N'Maxine', N'RHL43UKT5VR', N'0587955082', N'cubilia.Curae.Donec@nectempusscelerisque.net', 1, 39)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (52, N'Santiago', N'Joshua', N'MLP14IIF5SV', N'0627415073', N'lectus@erat.net', 0, 72)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (53, N'Cummings', N'Gretchen', N'JNT27CNI9KA', N'0607152537', N'sit.amet.lorem@risusQuisquelibero.com', 1, 98)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (54, N'Cortez', N'Brennan', N'PET43ICP3MK', N'0373213812', N'vel.turpis@ultricessitamet.org', 0, 81)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (55, N'Mills', N'Nora', N'ZNZ69ZLF3LT', N'0786910990', N'velit.Quisque.varius@penatibusetmagnis.co.uk', 1, 90)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (56, N'Richardson', N'Georgia', N'YWX78DNS7RK', N'0911667162', N'Cras.pellentesque.Sed@molestieSed.org', 0, 47)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (57, N'Buckner', N'Wesley', N'FPX41NZZ7YM', N'0183054477', N'leo.Cras.vehicula@sapienimperdiet.edu', 1, 60)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (58, N'Hogan', N'Perry', N'RWY35NNQ3LF', N'0570600624', N'nibh.Quisque@arcu.com', 0, 25)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (59, N'Bright', N'Keefe', N'JNX70YKM5LA', N'0245640794', N'euismod@porttitorvulputateposuere.co.uk', 1, 7)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (60, N'Bentley', N'Yasir', N'TKQ40NEI0LD', N'0422524493', N'Phasellus.fermentum.convallis@sagittisNullam.edu', 0, 51)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (61, N'Lyons', N'Carla', N'TRN11LCO9IU', N'0716901959', N'ante@Integerin.co.uk', 1, 30)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (62, N'James', N'Charissa', N'EQK62XEO4BM', N'0122582735', N'laoreet.libero@rhoncusDonecest.edu', 0, 86)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (63, N'Zimmerman', N'Kasper', N'HYR78UJP3EU', N'0933008283', N'dolor@Etiam.net', 1, 75)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (64, N'Stevenson', N'Susan', N'HLR38ROQ9GZ', N'0614993844', N'id@facilisi.com', 0, 67)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (65, N'Vasquez', N'Jarrod', N'VXL14VAJ1TP', N'0494793640', N'magna.et.ipsum@ligulaconsectetuerrhoncus.edu', 1, 55)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (66, N'Brennan', N'MacKensie', N'CNN50FGD7LT', N'0420867591', N'enim@ultricesVivamus.edu', 0, 38)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (67, N'Strong', N'Brendan', N'BTB74MTW2YM', N'0166351027', N'adipiscing@vitae.ca', 1, 24)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (68, N'Ayala', N'Iris', N'KDE19AZU2ZQ', N'0305588256', N'volutpat@Maecenaslibero.com', 0, 73)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (69, N'Acevedo', N'Alika', N'GPM69FTP2MN', N'0452244352', N'parturient.montes.nascetur@idliberoDonec.com', 1, 26)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (70, N'Carney', N'Yoshio', N'QOA02XNV5BK', N'0833884667', N'in.lobortis.tellus@sedorcilobortis.net', 0, 34)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (71, N'Guerrero', N'Teegan', N'TPG73LFG0UH', N'0129805307', N'a@ut.com', 1, 49)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (72, N'Butler', N'Rigel', N'LAJ39NWN7TZ', N'0251739502', N'vitae.semper@adipiscing.edu', 0, 83)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (73, N'Barton', N'Harper', N'XGZ98BKH7BT', N'0680261203', N'ullamcorper@Curabiturmassa.co.uk', 1, 9)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (74, N'Payne', N'Wang', N'FZG33QUN1PI', N'0112995513', N'Nam@Donecat.com', 0, 47)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (75, N'Chen', N'Cara', N'JRS22LNH1BD', N'0603776694', N'sagittis.felis.Donec@elitpellentesquea.com', 1, 82)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (76, N'Macdonald', N'Venus', N'QMV01KJQ1IB', N'0699179797', N'ultricies.ornare@sapiencursusin.org', 0, 14)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (77, N'Duran', N'Kaden', N'UKZ43SHR8IH', N'0343897531', N'lorem@enim.org', 1, 4)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (78, N'Yates', N'Kaitlin', N'LCM53NBC8DD', N'0617702083', N'consectetuer@euelit.co.uk', 0, 19)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (79, N'Booth', N'Hayley', N'WPA43PWI1PE', N'0498997211', N'in@molestie.edu', 1, 65)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (80, N'Craig', N'Jeremy', N'RPS45ZGM4UH', N'0964582696', N'Etiam@etmagnisdis.ca', 0, 31)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (81, N'Castillo', N'Leilani', N'ECK58ZJL6TL', N'0159704131', N'nibh@semperNam.org', 1, 90)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (82, N'Keller', N'Keefe', N'OFI74FEJ3FW', N'0907424325', N'amet.faucibus@aliquetPhasellusfermentum.edu', 0, 70)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (83, N'Mosley', N'Ila', N'YYU95OGH7FA', N'0225139587', N'pharetra@dolorvitaedolor.com', 1, 12)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (84, N'Stein', N'Fletcher', N'SNB81KCK9EE', N'0269235428', N'eu@Pellentesqueut.ca', 0, 6)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (85, N'Simpson', N'Jonah', N'UNH43KBA9EH', N'0782995417', N'ut.sem@etrisus.net', 1, 20)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (86, N'Hewitt', N'Fritz', N'UYH79GRM0BR', N'0954074563', N'arcu.Curabitur.ut@semutcursus.org', 0, 24)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (87, N'Rodriquez', N'Quincy', N'FJJ86AQJ5PH', N'0354870171', N'ligula@posuereat.edu', 1, 22)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (88, N'Cummings', N'Sopoline', N'WRN14UJQ0AC', N'0381628637', N'nulla.at@Curabituregestasnunc.org', 0, 83)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (89, N'Maldonado', N'Regan', N'LXO45MEU1HC', N'0824355664', N'ut@Mauris.com', 1, 42)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (90, N'Kirby', N'Ronan', N'HKR23WSW7JV', N'0969822252', N'metus@ultriciesdignissimlacus.org', 0, 15)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (91, N'Baxter', N'Serina', N'KJQ60KPH2BP', N'0408532353', N'egestas@nullamagnamalesuada.net', 1, 81)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (92, N'Gallegos', N'Selma', N'BUY50OHA0OW', N'0841880722', N'luctus.et.ultrices@tempusmauris.net', 0, 78)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (93, N'Baxter', N'Hilel', N'ZLP37CGI4MG', N'0478291020', N'vehicula.et@ultriciesdignissimlacus.com', 1, 2)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (94, N'Burton', N'Wayne', N'NSW05FVZ8OY', N'0840696740', N'ac.risus@ultriciesdignissim.edu', 0, 33)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (95, N'Rowe', N'Nathan', N'KAE37CSH3BG', N'0916245962', N'nascetur.ridiculus.mus@vitae.com', 1, 5)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (96, N'Craig', N'Hop', N'TPV73IQZ0LU', N'0842845214', N'mus@odio.edu', 0, 9)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (97, N'Tanner', N'Bell', N'IPB53RTW1ST', N'0637828100', N'sem@lobortis.net', 1, 3)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (98, N'Powers', N'Ali', N'DNS96HYE9BX', N'0206096722', N'ipsum.Phasellus.vitae@fringillaDonec.co.uk', 0, 99)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (99, N'Bryant', N'Andrew', N'VRX92OIS7GW', N'0273945839', N'ac.tellus.Suspendisse@Nuncmaurissapien.ca', 1, 28)
INSERT [dbo].[users] ([id_users], [nom], [prenom], [passe], [tel], [email], [actif], [id_adresse]) VALUES (100, N'Mason', N'Kevyn', N'EQB72TWY9WV', N'0793214996', N'sed@maurisrhoncus.org', 0, 31)
SET IDENTITY_INSERT [dbo].[users] OFF
INSERT [dbo].[users_app_role] ([id_app_role], [id_users]) VALUES (1, 11)
INSERT [dbo].[users_app_role] ([id_app_role], [id_users]) VALUES (1, 13)
INSERT [dbo].[users_app_role] ([id_app_role], [id_users]) VALUES (2, 11)
INSERT [dbo].[users_app_role] ([id_app_role], [id_users]) VALUES (2, 12)
INSERT [dbo].[users_app_role] ([id_app_role], [id_users]) VALUES (2, 13)
INSERT [dbo].[users_cours_role] ([id_users], [id_cours], [id_role]) VALUES (11, 1, 2)
INSERT [dbo].[users_cours_role] ([id_users], [id_cours], [id_role]) VALUES (12, 1, 1)
INSERT [dbo].[users_cours_role] ([id_users], [id_cours], [id_role]) VALUES (13, 2, 1)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 11)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 12)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 13)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 14)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 15)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 16)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 17)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 18)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 19)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 20)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 21)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 22)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 23)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 24)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 25)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 26)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 27)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 28)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 29)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 30)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 31)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 32)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 33)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 34)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 35)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 36)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 37)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 38)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 39)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 40)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 41)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 42)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 43)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 44)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 45)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 46)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 47)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 48)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 49)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 50)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 51)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 52)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 53)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 54)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 55)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 56)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 57)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 58)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 59)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 60)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 61)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 62)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 63)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 64)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 65)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 66)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 67)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 68)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 69)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 70)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 71)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 72)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 73)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 74)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 75)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 76)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 77)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 78)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 79)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 80)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 81)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 82)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 83)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 84)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 85)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 86)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 87)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 88)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 89)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 90)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 91)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 92)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 93)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 94)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 95)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 96)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 97)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 98)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 99)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (1, 100)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (2, 11)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (2, 12)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (2, 13)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (2, 14)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (2, 15)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (2, 16)
INSERT [dbo].[users_role] ([id_role], [id_users]) VALUES (2, 17)
INSERT [dbo].[users_type_cours] ([id_type_cours], [id_users]) VALUES (1, 11)
INSERT [dbo].[users_type_cours] ([id_type_cours], [id_users]) VALUES (1, 12)
INSERT [dbo].[users_type_cours] ([id_type_cours], [id_users]) VALUES (2, 13)
INSERT [dbo].[users_type_cours] ([id_type_cours], [id_users]) VALUES (2, 14)
ALTER TABLE [dbo].[abonnement]  WITH CHECK ADD  CONSTRAINT [abonnement_type_abonnement_FK] FOREIGN KEY([id_type_abonnement])
REFERENCES [dbo].[type_abonnement] ([id_type_abonnement])
GO
ALTER TABLE [dbo].[abonnement] CHECK CONSTRAINT [abonnement_type_abonnement_FK]
GO
ALTER TABLE [dbo].[Cours]  WITH CHECK ADD  CONSTRAINT [cours_type_cours_FK] FOREIGN KEY([id_type_cours])
REFERENCES [dbo].[type_cours] ([id_type_cours])  ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cours] CHECK CONSTRAINT [cours_type_cours_FK]
GO
ALTER TABLE [dbo].[mouvement]  WITH CHECK ADD  CONSTRAINT [mouvement_lecteur1_FK] FOREIGN KEY([id_lecteur])
REFERENCES [dbo].[lecteur] ([id_lecteur])
GO
ALTER TABLE [dbo].[mouvement] CHECK CONSTRAINT [mouvement_lecteur1_FK]
GO
ALTER TABLE [dbo].[mouvement]  WITH CHECK ADD  CONSTRAINT [mouvement_type_mouvement_FK] FOREIGN KEY([id_type_mouvement])
REFERENCES [dbo].[type_mouvement] ([id_type_mouvement])
GO
ALTER TABLE [dbo].[mouvement] CHECK CONSTRAINT [mouvement_type_mouvement_FK]
GO
ALTER TABLE [dbo].[mouvement]  WITH CHECK ADD  CONSTRAINT [mouvement_users0_FK] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id_users])
GO
ALTER TABLE [dbo].[mouvement] CHECK CONSTRAINT [mouvement_users0_FK]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [users_adresse_FK] FOREIGN KEY([id_adresse])
REFERENCES [dbo].[adresse] ([id_adresse])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [users_adresse_FK]
GO
ALTER TABLE [dbo].[users_abonnement]  WITH CHECK ADD  CONSTRAINT [users_abonnement_abonnement_FK] FOREIGN KEY([id_abonnement])
REFERENCES [dbo].[abonnement] ([id_abonnement])
GO
ALTER TABLE [dbo].[users_abonnement] CHECK CONSTRAINT [users_abonnement_abonnement_FK]
GO
ALTER TABLE [dbo].[users_abonnement]  WITH CHECK ADD  CONSTRAINT [users_abonnement_users0_FK] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id_users])
GO
ALTER TABLE [dbo].[users_abonnement] CHECK CONSTRAINT [users_abonnement_users0_FK]
GO
ALTER TABLE [dbo].[users_app_role]  WITH CHECK ADD  CONSTRAINT [users_app_role_app_role_FK] FOREIGN KEY([id_app_role])
REFERENCES [dbo].[app_role] ([id_app_role])
GO
ALTER TABLE [dbo].[users_app_role] CHECK CONSTRAINT [users_app_role_app_role_FK]
GO
ALTER TABLE [dbo].[users_app_role]  WITH CHECK ADD  CONSTRAINT [users_app_role_users0_FK] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id_users])
GO
ALTER TABLE [dbo].[users_app_role] CHECK CONSTRAINT [users_app_role_users0_FK]
GO
ALTER TABLE [dbo].[users_badge_motif]  WITH CHECK ADD  CONSTRAINT [users_badge_motif_badge0_FK] FOREIGN KEY([id_badge])
REFERENCES [dbo].[badge] ([id_badge])
GO
ALTER TABLE [dbo].[users_badge_motif] CHECK CONSTRAINT [users_badge_motif_badge0_FK]
GO
ALTER TABLE [dbo].[users_badge_motif]  WITH CHECK ADD  CONSTRAINT [users_badge_motif_motif_FK] FOREIGN KEY([id_motif])
REFERENCES [dbo].[motif] ([id_motif])
GO
ALTER TABLE [dbo].[users_badge_motif] CHECK CONSTRAINT [users_badge_motif_motif_FK]
GO
ALTER TABLE [dbo].[users_badge_motif]  WITH CHECK ADD  CONSTRAINT [users_badge_motif_users1_FK] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id_users])
GO
ALTER TABLE [dbo].[users_badge_motif] CHECK CONSTRAINT [users_badge_motif_users1_FK]
GO
ALTER TABLE [dbo].[users_cours_role]  WITH CHECK ADD  CONSTRAINT [users_cours_role_cours0_FK] FOREIGN KEY([id_cours])
REFERENCES [dbo].[Cours] ([id_cours])
GO
ALTER TABLE [dbo].[users_cours_role] CHECK CONSTRAINT [users_cours_role_cours0_FK]
GO
ALTER TABLE [dbo].[users_cours_role]  WITH CHECK ADD  CONSTRAINT [users_cours_role_role1_FK] FOREIGN KEY([id_role])
REFERENCES [dbo].[role] ([id_role])
GO
ALTER TABLE [dbo].[users_cours_role] CHECK CONSTRAINT [users_cours_role_role1_FK]
GO
ALTER TABLE [dbo].[users_cours_role]  WITH CHECK ADD  CONSTRAINT [users_cours_role_users_FK] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id_users])
GO
ALTER TABLE [dbo].[users_cours_role] CHECK CONSTRAINT [users_cours_role_users_FK]
GO
ALTER TABLE [dbo].[users_role]  WITH CHECK ADD  CONSTRAINT [users_role_role_FK] FOREIGN KEY([id_role])
REFERENCES [dbo].[role] ([id_role])
GO
ALTER TABLE [dbo].[users_role] CHECK CONSTRAINT [users_role_role_FK]
GO
ALTER TABLE [dbo].[users_role]  WITH CHECK ADD  CONSTRAINT [users_role_users0_FK] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id_users])
GO
ALTER TABLE [dbo].[users_role] CHECK CONSTRAINT [users_role_users0_FK]
GO
ALTER TABLE [dbo].[users_type_cours]  WITH CHECK ADD  CONSTRAINT [users_type_cours_type_cours_FK] FOREIGN KEY([id_type_cours])
REFERENCES [dbo].[type_cours] ([id_type_cours])
GO
ALTER TABLE [dbo].[users_type_cours] CHECK CONSTRAINT [users_type_cours_type_cours_FK]
GO
ALTER TABLE [dbo].[users_type_cours]  WITH CHECK ADD  CONSTRAINT [users_type_cours_users0_FK] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id_users])
GO
ALTER TABLE [dbo].[users_type_cours] CHECK CONSTRAINT [users_type_cours_users0_FK]
GO
USE [master]
GO
ALTER DATABASE [RfidDB] SET  READ_WRITE 
GO
