USE [master]
GO
/****** Object:  Database [SocialMedia]    Script Date: 21/06/2015 21:03:56 ******/
CREATE DATABASE [SocialMedia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UsersQuestion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\UsersQuestion.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UsersQuestion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\UsersQuestion_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SocialMedia] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialMedia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialMedia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialMedia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialMedia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialMedia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialMedia] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialMedia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocialMedia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialMedia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialMedia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialMedia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialMedia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialMedia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialMedia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialMedia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialMedia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SocialMedia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialMedia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialMedia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialMedia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialMedia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialMedia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialMedia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialMedia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SocialMedia] SET  MULTI_USER 
GO
ALTER DATABASE [SocialMedia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialMedia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialMedia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialMedia] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SocialMedia] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SocialMedia]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 21/06/2015 21:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [text] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 21/06/2015 21:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoriesTags]    Script Date: 21/06/2015 21:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesTags](
	[CategoriesID] [int] NOT NULL,
	[TagsID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 21/06/2015 21:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [text] NULL,
	[CategoryId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionsTags]    Script Date: 21/06/2015 21:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionsTags](
	[QuestionsId] [int] NOT NULL,
	[TagsId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 21/06/2015 21:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 21/06/2015 21:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Votes]    Script Date: 21/06/2015 21:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[AnswerId] [int] NOT NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Users1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Users1]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Questions] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Questions]
GO
ALTER TABLE [dbo].[CategoriesTags]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesTags_Categories] FOREIGN KEY([CategoriesID])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[CategoriesTags] CHECK CONSTRAINT [FK_CategoriesTags_Categories]
GO
ALTER TABLE [dbo].[CategoriesTags]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesTags_Tags] FOREIGN KEY([TagsID])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[CategoriesTags] CHECK CONSTRAINT [FK_CategoriesTags_Tags]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Users1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Users1]
GO
ALTER TABLE [dbo].[QuestionsTags]  WITH CHECK ADD  CONSTRAINT [FK_QuestionsTags_Questions1] FOREIGN KEY([QuestionsId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[QuestionsTags] CHECK CONSTRAINT [FK_QuestionsTags_Questions1]
GO
ALTER TABLE [dbo].[QuestionsTags]  WITH CHECK ADD  CONSTRAINT [FK_QuestionsTags_Tags1] FOREIGN KEY([TagsId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[QuestionsTags] CHECK CONSTRAINT [FK_QuestionsTags_Tags1]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Answers1] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answers] ([Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Answers1]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Users1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Users1]
GO
USE [master]
GO
ALTER DATABASE [SocialMedia] SET  READ_WRITE 
GO
