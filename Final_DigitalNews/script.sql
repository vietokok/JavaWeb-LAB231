USE [master]
GO
/****** Object:  Database [Digital]    Script Date: 3/9/2020 5:20:46 PM ******/
CREATE DATABASE [Digital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Digital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Digital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Digital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Digital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Digital] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Digital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Digital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Digital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Digital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Digital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Digital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Digital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Digital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Digital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Digital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Digital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Digital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Digital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Digital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Digital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Digital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Digital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Digital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Digital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Digital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Digital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Digital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Digital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Digital] SET RECOVERY FULL 
GO
ALTER DATABASE [Digital] SET  MULTI_USER 
GO
ALTER DATABASE [Digital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Digital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Digital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Digital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Digital] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Digital', N'ON'
GO
ALTER DATABASE [Digital] SET QUERY_STORE = OFF
GO
USE [Digital]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 3/9/2020 5:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[id] [int] NOT NULL,
	[title] [nvarchar](255) NULL,
	[image] [varchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[author] [nvarchar](255) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (1, N'Making security feeds smarter via machine learning', N'i1.jpg', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', CAST(N'2020-03-06T00:00:00.000' AS DateTime), N'Cristiano Ronaldo')
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (2, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ', N'3.jpg', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', CAST(N'2020-03-03T00:00:00.000' AS DateTime), N'Lionel Messi')
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (3, N'Elevenia tawark an laynan Mokado', N'3.jpg', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', CAST(N'2020-03-03T00:00:00.000' AS DateTime), N'David Beckham')
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (4, N'News was successfully deployed in 1,231 milliseconds.', N'4.jpg', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', CAST(N'2020-03-04T00:00:00.000' AS DateTime), N'Yasuo')
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (5, N'Visiting unvisited references', N'5.jpg', N'making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', CAST(N'2019-03-04T00:00:00.000' AS DateTime), N'Netbeans')
USE [master]
GO
ALTER DATABASE [Digital] SET  READ_WRITE 
GO
