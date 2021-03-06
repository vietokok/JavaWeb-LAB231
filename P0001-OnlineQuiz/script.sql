USE [master]
GO
/****** Object:  Database [EasyCMS]    Script Date: 3/9/2020 5:20:02 PM ******/
CREATE DATABASE [EasyCMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EasyCMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EasyCMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EasyCMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EasyCMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EasyCMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EasyCMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EasyCMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EasyCMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EasyCMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EasyCMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EasyCMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [EasyCMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EasyCMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EasyCMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EasyCMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EasyCMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EasyCMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EasyCMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EasyCMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EasyCMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EasyCMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EasyCMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EasyCMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EasyCMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EasyCMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EasyCMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EasyCMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EasyCMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EasyCMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EasyCMS] SET  MULTI_USER 
GO
ALTER DATABASE [EasyCMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EasyCMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EasyCMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EasyCMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EasyCMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EasyCMS', N'ON'
GO
ALTER DATABASE [EasyCMS] SET QUERY_STORE = OFF
GO
USE [EasyCMS]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 3/9/2020 5:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](50) NULL,
	[opt1] [nvarchar](500) NULL,
	[opt2] [nvarchar](500) NULL,
	[opt3] [nvarchar](500) NULL,
	[opt4] [nvarchar](500) NULL,
	[answer] [nvarchar](500) NULL,
	[created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizHistory]    Script Date: 3/9/2020 5:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NULL,
	[numOfQuiz] [int] NULL,
	[correctAnswer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/9/2020 5:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (1, N'What is the capital of Vietnam?', N'Hanoi', N'Saigon', N'HCM', N'Lao Cai', N'1', CAST(N'2020-01-19T09:42:47.860' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (3, N'What is the name of my university?', N'HLU', N'FPT', N'NEU', N'HUST', N'2', CAST(N'2020-01-19T09:44:54.317' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (4, N'What is programing language?', N'English', N'Java', N'C', N'Python', N'234', CAST(N'2020-01-19T10:52:10.643' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (8, N'What song was writen by Vietnamese', N'Day by Day', N'Fake love', N'Hay trao cho anh', N'Passenger', N'3', CAST(N'2020-01-19T11:01:52.150' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (14, N'How far from My Dinh to FPT ?', N'5km', N'10km', N'20km', N'30km', N'4', CAST(N'2020-01-19T14:45:50.500' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (15, N'What is code of Java Lab Web', N'PRO192', N'LAB231', N'CSD201', N'Alice', N'2', CAST(N'2020-01-19T15:53:54.817' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (16, N'What is a America film?', N'Paradise', N'Avenger', N'Train To Busan', N'Transporter', N'24', CAST(N'2020-01-19T09:24:22.600' AS DateTime))
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuizHistory] ON 

INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (1, 5, 3, 2)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (2, 5, 6, 2)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (3, 1, 5, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (4, 1, 4, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (5, 1, 6, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (6, 1, 5, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (7, 1, 6, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (8, 1, 6, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (9, 1, 5, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (10, 1, 4, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (11, 1, 4, 1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (12, 1, 5, 1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (13, 1, 5, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (14, 1, 4, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (15, 1, 5, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (16, 1, 2, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (17, 1, 1, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (18, 1, 2, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (19, 1, 4, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (20, 1, 3, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (21, 1, 3, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (22, 1, 3, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (23, 6, 2, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (24, 6, 2, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (25, 6, 2, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (26, 6, 2, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (27, 6, 2, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (28, 6, 2, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (29, 6, 2, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (30, 6, 2, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (31, 6, 2, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (32, 1, 3, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (33, 1, 3, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (34, 1, 3, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (35, 1, 3, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (36, 1, 4, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (37, 1, 3, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (38, 1, 3, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (39, 1, 4, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (40, 1, 4, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (41, 1, 3, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (42, 1, 3, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (43, 1, 3, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (44, 1, 2, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (45, 1, 4, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (46, 1, 4, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (47, 1, 4, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (48, 1, 4, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (49, 1, 5, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (50, 1, 5, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (51, 1, 4, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (52, 1, 4, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (53, 1, 4, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (54, 1, 4, 0)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (55, 1, 4, -1)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer]) VALUES (56, 1, 4, 0)
SET IDENTITY_INSERT [dbo].[QuizHistory] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (1, N'Viet', N'123456', N'vietvk@gmail.com', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (2, N'Tuan', N'123456', N'tuandtt@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (3, N'Kien', N'123456', N'kiennm@gmail.com', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (4, N'Phong', N'12345678', N'phongbc@gmail.com', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (5, N'Hoang', N'12345678', N'hoangnm@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (6, N'vietokok', N'12345678', N'viet123@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Question] ADD  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [dbo].[QuizHistory]  WITH CHECK ADD  CONSTRAINT [fk_studentId_1] FOREIGN KEY([studentId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[QuizHistory] CHECK CONSTRAINT [fk_studentId_1]
GO
USE [master]
GO
ALTER DATABASE [EasyCMS] SET  READ_WRITE 
GO
