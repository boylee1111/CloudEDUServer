USE [master]
GO

/****** Object:  Database [CloudEDU]    Script Date: 2013/7/29 16:15:58 ******/
CREATE DATABASE [CloudEDU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CloudEDU', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\CloudEDU.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CloudEDU_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\CloudEDU_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [CloudEDU] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CloudEDU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [CloudEDU] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [CloudEDU] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [CloudEDU] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [CloudEDU] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [CloudEDU] SET ARITHABORT OFF 
GO

ALTER DATABASE [CloudEDU] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [CloudEDU] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [CloudEDU] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [CloudEDU] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [CloudEDU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [CloudEDU] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [CloudEDU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [CloudEDU] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [CloudEDU] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [CloudEDU] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [CloudEDU] SET  DISABLE_BROKER 
GO

ALTER DATABASE [CloudEDU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [CloudEDU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [CloudEDU] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [CloudEDU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [CloudEDU] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [CloudEDU] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [CloudEDU] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [CloudEDU] SET RECOVERY FULL 
GO

ALTER DATABASE [CloudEDU] SET  MULTI_USER 
GO

ALTER DATABASE [CloudEDU] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [CloudEDU] SET DB_CHAINING OFF 
GO

ALTER DATABASE [CloudEDU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [CloudEDU] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [CloudEDU] SET  READ_WRITE 
GO

USE [CloudEDU]
GO

/****** Object:  Table [COURSE].[CATEGORY]    Script Date: 2013/7/29 16:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [COURSE].[CATEGORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CATE_NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [CloudEDU]
GO

/****** Object:  Table [COURSE].[COMMENT]    Script Date: 2013/7/29 16:16:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [COURSE].[COMMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_ID] [int] NOT NULL,
	[COURSE_ID] [int] NOT NULL,
	[CONTENT] [text] NOT NULL,
	[TITLE] [varchar](100) NULL,
	[TIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [COURSE].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK__COMMENT__CUSTOME__6E01572D] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [CUSTOMER].[CUSTOMER] ([ID])
GO

ALTER TABLE [COURSE].[COMMENT] CHECK CONSTRAINT [FK__COMMENT__CUSTOME__6E01572D]
GO

ALTER TABLE [COURSE].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_COMMENT_COURSE] FOREIGN KEY([COURSE_ID])
REFERENCES [COURSE].[COURSE] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [COURSE].[COMMENT] CHECK CONSTRAINT [FK_COMMENT_COURSE]
GO

USE [CloudEDU]
GO

/****** Object:  Table [COURSE].[COURSE]    Script Date: 2013/7/29 16:16:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [COURSE].[COURSE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PRICE] [money] NOT NULL,
	[RATE] [float] NULL,
	[TITLE] [varchar](50) NOT NULL,
	[INTRO] [text] NULL,
	[TEACHER] [int] NOT NULL,
	[CATEGORY] [int] NULL,
	[COURSE_STATUS] [nchar](10) NOT NULL,
	[PG] [int] NULL,
	[ICON_URL] [nvarchar](100) NULL,
	[START_TIME] [datetime] NOT NULL,
 CONSTRAINT [PK__COURSE__3214EC27A9E45847] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [COURSE].[COURSE] ADD  CONSTRAINT [DF__COURSE__PRICE__108B795B]  DEFAULT ((0.00)) FOR [PRICE]
GO

ALTER TABLE [COURSE].[COURSE] ADD  CONSTRAINT [DF__COURSE__RATE__117F9D94]  DEFAULT ((0)) FOR [RATE]
GO

ALTER TABLE [COURSE].[COURSE] ADD  CONSTRAINT [DF__COURSE__INTRO__1273C1CD]  DEFAULT ('NOT SET YET') FOR [INTRO]
GO

ALTER TABLE [COURSE].[COURSE] ADD  CONSTRAINT [DF__COURSE__COURSE_S__540C7B00]  DEFAULT ('PENDING') FOR [COURSE_STATUS]
GO

ALTER TABLE [COURSE].[COURSE]  WITH CHECK ADD  CONSTRAINT [FK_COURSE_CATEGORY] FOREIGN KEY([CATEGORY])
REFERENCES [COURSE].[CATEGORY] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO

ALTER TABLE [COURSE].[COURSE] CHECK CONSTRAINT [FK_COURSE_CATEGORY]
GO

ALTER TABLE [COURSE].[COURSE]  WITH CHECK ADD  CONSTRAINT [FK_COURSE_PG] FOREIGN KEY([PG])
REFERENCES [COURSE].[PARENT_GUIDE] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO

ALTER TABLE [COURSE].[COURSE] CHECK CONSTRAINT [FK_COURSE_PG]
GO

ALTER TABLE [COURSE].[COURSE]  WITH CHECK ADD  CONSTRAINT [FK_COURSE_TEACHER] FOREIGN KEY([TEACHER])
REFERENCES [CUSTOMER].[CUSTOMER] ([ID])
ON UPDATE CASCADE
GO

ALTER TABLE [COURSE].[COURSE] CHECK CONSTRAINT [FK_COURSE_TEACHER]
GO

ALTER TABLE [COURSE].[COURSE]  WITH CHECK ADD  CONSTRAINT [CK_COURSE_PRICEGTZERO] CHECK  (([price]>=(0)))
GO

ALTER TABLE [COURSE].[COURSE] CHECK CONSTRAINT [CK_COURSE_PRICEGTZERO]
GO

ALTER TABLE [COURSE].[COURSE]  WITH CHECK ADD  CONSTRAINT [CK_COURSE_STATUS] CHECK  (([COURSE_STATUS]='CANCEL' OR [COURSE_STATUS]='PENDING' OR [COURSE_STATUS]='OK'))
GO

ALTER TABLE [COURSE].[COURSE] CHECK CONSTRAINT [CK_COURSE_STATUS]
GO

USE [CloudEDU]
GO

/****** Object:  Table [COURSE].[DOCUMENT]    Script Date: 2013/7/29 16:17:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [COURSE].[DOCUMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LESSON_ID] [int] NOT NULL,
	[AUTHOR] [varchar](50) NULL,
	[TITLE] [varchar](50) NOT NULL,
	[CONTENT] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [COURSE].[DOCUMENT]  WITH CHECK ADD  CONSTRAINT [FK_DOCUMENT_LESSON] FOREIGN KEY([LESSON_ID])
REFERENCES [COURSE].[LESSON] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [COURSE].[DOCUMENT] CHECK CONSTRAINT [FK_DOCUMENT_LESSON]
GO

USE [CloudEDU]
GO

/****** Object:  Table [COURSE].[LESSON]    Script Date: 2013/7/29 16:17:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [COURSE].[LESSON](
	[COURSE_ID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CONTENT] [text] NULL,
	[TITLE] [varchar](50) NOT NULL,
	[NUMBER] [int] NOT NULL,
 CONSTRAINT [PK_LESSON_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [COURSE].[LESSON] ADD  DEFAULT ('NOT SET YET') FOR [CONTENT]
GO

ALTER TABLE [COURSE].[LESSON]  WITH CHECK ADD  CONSTRAINT [FK_LESSON_COURSE] FOREIGN KEY([COURSE_ID])
REFERENCES [COURSE].[COURSE] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [COURSE].[LESSON] CHECK CONSTRAINT [FK_LESSON_COURSE]
GO

ALTER TABLE [COURSE].[LESSON]  WITH CHECK ADD CHECK  (([NUMBER]>=(0)))
GO

USE [CloudEDU]
GO

/****** Object:  Table [COURSE].[PARENT_GUIDE]    Script Date: 2013/7/29 16:17:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [COURSE].[PARENT_GUIDE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RESTRICT_AGE] [int] NOT NULL,
	[DESCRIPTION] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [COURSE].[PARENT_GUIDE]  WITH CHECK ADD CHECK  (([RESTRICT_AGE]>=(0)))
GO

USE [CloudEDU]
GO

/****** Object:  Table [COURSE].[RECO_COURSE]    Script Date: 2013/7/29 16:17:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [COURSE].[RECO_COURSE](
	[COURSE_ID] [int] NOT NULL,
	[RECO_ID] [int] NOT NULL,
 CONSTRAINT [PK_RECOCOURSE_UPK] PRIMARY KEY CLUSTERED 
(
	[COURSE_ID] ASC,
	[RECO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [COURSE].[RECO_COURSE]  WITH CHECK ADD  CONSTRAINT [FK__RECO_COUR__COURS__4589517F] FOREIGN KEY([COURSE_ID])
REFERENCES [COURSE].[COURSE] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [COURSE].[RECO_COURSE] CHECK CONSTRAINT [FK__RECO_COUR__COURS__4589517F]
GO

ALTER TABLE [COURSE].[RECO_COURSE]  WITH CHECK ADD  CONSTRAINT [FK__RECO_COUR__RECO___467D75B8] FOREIGN KEY([RECO_ID])
REFERENCES [COURSE].[RECOMMENDATION] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [COURSE].[RECO_COURSE] CHECK CONSTRAINT [FK__RECO_COUR__RECO___467D75B8]
GO

USE [CloudEDU]
GO

/****** Object:  Table [COURSE].[RECOMMENDATION]    Script Date: 2013/7/29 16:17:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [COURSE].[RECOMMENDATION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](100) NOT NULL,
	[DESCRIPTION] [text] NULL,
	[ICON_URL] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

USE [CloudEDU]
GO

/****** Object:  Table [COURSE].[RES_TYPE]    Script Date: 2013/7/29 16:17:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [COURSE].[RES_TYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPTION] [nchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [CloudEDU]
GO

/****** Object:  Table [COURSE].[RESOURCE]    Script Date: 2013/7/29 16:17:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [COURSE].[RESOURCE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LESSON_ID] [int] NOT NULL,
	[TITLE] [varchar](50) NOT NULL,
	[INTRO] [text] NULL,
	[TYPE] [int] NOT NULL,
	[URL] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [COURSE].[RESOURCE]  WITH CHECK ADD  CONSTRAINT [FK_RESOURCE_LESSON] FOREIGN KEY([LESSON_ID])
REFERENCES [COURSE].[LESSON] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [COURSE].[RESOURCE] CHECK CONSTRAINT [FK_RESOURCE_LESSON]
GO

ALTER TABLE [COURSE].[RESOURCE]  WITH CHECK ADD  CONSTRAINT [FK_RESOURCE_TYPE] FOREIGN KEY([TYPE])
REFERENCES [COURSE].[RES_TYPE] ([ID])
GO

ALTER TABLE [COURSE].[RESOURCE] CHECK CONSTRAINT [FK_RESOURCE_TYPE]
GO

USE [CloudEDU]
GO

/****** Object:  Table [CUSTOMER].[ATTEND]    Script Date: 2013/7/29 16:17:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [CUSTOMER].[ATTEND](
	[CUSTOMER_ID] [int] NOT NULL,
	[COURSE_ID] [int] NOT NULL,
	[START_TIME] [datetime] NOT NULL,
	[CURRENT_LESSON] [int] NULL,
 CONSTRAINT [PK_ATTEND_UPK] PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_ID] ASC,
	[COURSE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CUSTOMER_ID] ASC,
	[COURSE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [CUSTOMER].[ATTEND]  WITH CHECK ADD  CONSTRAINT [FK_ATTEND_COURSE] FOREIGN KEY([COURSE_ID])
REFERENCES [COURSE].[COURSE] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [CUSTOMER].[ATTEND] CHECK CONSTRAINT [FK_ATTEND_COURSE]
GO

ALTER TABLE [CUSTOMER].[ATTEND]  WITH CHECK ADD  CONSTRAINT [FK_ATTEND_CURRENTLESSON] FOREIGN KEY([CURRENT_LESSON])
REFERENCES [COURSE].[LESSON] ([ID])
GO

ALTER TABLE [CUSTOMER].[ATTEND] CHECK CONSTRAINT [FK_ATTEND_CURRENTLESSON]
GO

ALTER TABLE [CUSTOMER].[ATTEND]  WITH CHECK ADD  CONSTRAINT [FK_ATTEND_CUSTOMER] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [CUSTOMER].[CUSTOMER] ([ID])
GO

ALTER TABLE [CUSTOMER].[ATTEND] CHECK CONSTRAINT [FK_ATTEND_CUSTOMER]
GO

USE [CloudEDU]
GO

/****** Object:  Table [CUSTOMER].[CUSTOMER]    Script Date: 2013/7/29 16:18:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [CUSTOMER].[CUSTOMER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](50) NOT NULL,
	[BALANCE] [money] NOT NULL,
	[EMAIL] [varchar](50) NULL,
	[DEGREE] [varchar](20) NULL,
	[LEARN_RATE] [float] NULL,
	[TEACH_RATE] [float] NULL,
	[BIRTHDAY] [date] NOT NULL,
 CONSTRAINT [PK__CUSTOMER__3214EC2745C7EB22] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__CUSTOMER__D9C1FA0096E8FC55] UNIQUE NONCLUSTERED 
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [CUSTOMER].[CUSTOMER] ADD  CONSTRAINT [DF__CUSTOMER__BALANC__2D27B809]  DEFAULT ((0.00)) FOR [BALANCE]
GO

ALTER TABLE [CUSTOMER].[CUSTOMER] ADD  DEFAULT ('2013-01-01') FOR [BIRTHDAY]
GO

ALTER TABLE [CUSTOMER].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [CK_CUSTOMER_BALANCEGTZERO] CHECK  (([balance]>=(0)))
GO

ALTER TABLE [CUSTOMER].[CUSTOMER] CHECK CONSTRAINT [CK_CUSTOMER_BALANCEGTZERO]
GO

ALTER TABLE [CUSTOMER].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [CK_CUSTOMER_DEGREE] CHECK  (([customer].[DEGREE]='Grad' OR [customer].[DEGREE]='Undergrad' OR [customer].[DEGREE]='Senior High' OR [customer].[DEGREE]='Junior High' OR [customer].[DEGREE]='Primary School or Lower'))
GO

ALTER TABLE [CUSTOMER].[CUSTOMER] CHECK CONSTRAINT [CK_CUSTOMER_DEGREE]
GO

USE [CloudEDU]
GO

/****** Object:  Table [CUSTOMER].[FAVORITE]    Script Date: 2013/7/29 16:18:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [CUSTOMER].[FAVORITE](
	[CUSTOMER_ID] [int] NOT NULL,
	[COURSE_ID] [int] NOT NULL,
 CONSTRAINT [PK_FAVORITE_UPK] PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_ID] ASC,
	[COURSE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CUSTOMER_ID] ASC,
	[COURSE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [CUSTOMER].[FAVORITE]  WITH CHECK ADD  CONSTRAINT [FK__FAVORITE__CUSTOM__68487DD7] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [CUSTOMER].[CUSTOMER] ([ID])
GO

ALTER TABLE [CUSTOMER].[FAVORITE] CHECK CONSTRAINT [FK__FAVORITE__CUSTOM__68487DD7]
GO

ALTER TABLE [CUSTOMER].[FAVORITE]  WITH CHECK ADD  CONSTRAINT [FK_FAVORITE_COURSE] FOREIGN KEY([COURSE_ID])
REFERENCES [COURSE].[COURSE] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [CUSTOMER].[FAVORITE] CHECK CONSTRAINT [FK_FAVORITE_COURSE]
GO

USE [CloudEDU]
GO

/****** Object:  Table [CUSTOMER].[NOTE]    Script Date: 2013/7/29 16:18:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [CUSTOMER].[NOTE](
	[TITLE] [varchar](50) NULL,
	[CONTENT] [text] NOT NULL,
	[LESSON_ID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DATE] [datetime] NOT NULL,
	[CUSTOMER_ID] [int] NULL,
	[SHARE] [bit] NOT NULL,
 CONSTRAINT [PK__NOTE__3214EC27D3076B9C] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [CUSTOMER].[NOTE] ADD  DEFAULT ((0)) FOR [SHARE]
GO

ALTER TABLE [CUSTOMER].[NOTE]  WITH CHECK ADD  CONSTRAINT [FK__NOTE__CUSTOMER_I__2334397B] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [CUSTOMER].[CUSTOMER] ([ID])
GO

ALTER TABLE [CUSTOMER].[NOTE] CHECK CONSTRAINT [FK__NOTE__CUSTOMER_I__2334397B]
GO

ALTER TABLE [CUSTOMER].[NOTE]  WITH CHECK ADD  CONSTRAINT [FK__NOTE__LESSON_ID__3A81B327] FOREIGN KEY([LESSON_ID])
REFERENCES [COURSE].[LESSON] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [CUSTOMER].[NOTE] CHECK CONSTRAINT [FK__NOTE__LESSON_ID__3A81B327]
GO

USE [CloudEDU]
GO

/****** Object:  Table [dbo].[OPR_LOG]    Script Date: 2013/7/29 16:18:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OPR_LOG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OPR] [nchar](50) NOT NULL,
	[OPR_TIME] [timestamp] NOT NULL,
	[MSG] [xml] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

USE [CloudEDU]
GO

/****** Object:  Table [MANAGER].[GRANTED]    Script Date: 2013/7/29 16:18:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MANAGER].[GRANTED](
	[MANAGER_ID] [int] NOT NULL,
	[PERMISSION] [int] NOT NULL,
 CONSTRAINT [PK_GRANTED_UPK] PRIMARY KEY CLUSTERED 
(
	[MANAGER_ID] ASC,
	[PERMISSION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [MANAGER].[GRANTED]  WITH CHECK ADD  CONSTRAINT [FK__GRANTED__MANAGER__4CA06362] FOREIGN KEY([MANAGER_ID])
REFERENCES [MANAGER].[MANAGER] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [MANAGER].[GRANTED] CHECK CONSTRAINT [FK__GRANTED__MANAGER__4CA06362]
GO

ALTER TABLE [MANAGER].[GRANTED]  WITH CHECK ADD  CONSTRAINT [FK__GRANTED__PERMISS__4D94879B] FOREIGN KEY([PERMISSION])
REFERENCES [MANAGER].[PERMISSION] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [MANAGER].[GRANTED] CHECK CONSTRAINT [FK__GRANTED__PERMISS__4D94879B]
GO

USE [CloudEDU]
GO

/****** Object:  Table [MANAGER].[MANAGER]    Script Date: 2013/7/29 16:18:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [MANAGER].[MANAGER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](50) NOT NULL,
	[MNGR_TYPE] [int] NULL,
 CONSTRAINT [PK__MANAGER__3214EC274D7A6D5F] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__MANAGER__D9C1FA002B78CFA8] UNIQUE NONCLUSTERED 
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [MANAGER].[MANAGER]  WITH CHECK ADD  CONSTRAINT [FK__MANAGER__MNGR_TY__44FF419A] FOREIGN KEY([MNGR_TYPE])
REFERENCES [MANAGER].[TYPE] ([ID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO

ALTER TABLE [MANAGER].[MANAGER] CHECK CONSTRAINT [FK__MANAGER__MNGR_TY__44FF419A]
GO

USE [CloudEDU]
GO

/****** Object:  Table [MANAGER].[PERMISSION]    Script Date: 2013/7/29 16:18:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MANAGER].[PERMISSION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nchar](20) NOT NULL,
	[TYPE] [nchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [CloudEDU]
GO

/****** Object:  Table [MANAGER].[TYPE]    Script Date: 2013/7/29 16:18:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [MANAGER].[TYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPTION] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [CloudEDU]
GO

/****** Object:  Table [TRSACTION].[SALEORDER]    Script Date: 2013/7/29 16:18:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [TRSACTION].[SALEORDER](
	[BUYER] [int] NOT NULL,
	[SALER] [int] NOT NULL,
	[PRICE] [money] NOT NULL,
	[COURSE] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TIME] [datetime] NOT NULL,
 CONSTRAINT [PK__SALEORDE__3214EC2748568CD4] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [TRSACTION].[SALEORDER] ADD  CONSTRAINT [DF__SALEORDER__PRICE__52593CB8]  DEFAULT ((0.00)) FOR [PRICE]
GO

ALTER TABLE [TRSACTION].[SALEORDER]  WITH CHECK ADD  CONSTRAINT [FK__SALEORDER__BUYER__5070F446] FOREIGN KEY([BUYER])
REFERENCES [CUSTOMER].[CUSTOMER] ([ID])
GO

ALTER TABLE [TRSACTION].[SALEORDER] CHECK CONSTRAINT [FK__SALEORDER__BUYER__5070F446]
GO

ALTER TABLE [TRSACTION].[SALEORDER]  WITH CHECK ADD  CONSTRAINT [FK__SALEORDER__COURS__534D60F1] FOREIGN KEY([COURSE])
REFERENCES [COURSE].[COURSE] ([ID])
GO

ALTER TABLE [TRSACTION].[SALEORDER] CHECK CONSTRAINT [FK__SALEORDER__COURS__534D60F1]
GO

ALTER TABLE [TRSACTION].[SALEORDER]  WITH CHECK ADD  CONSTRAINT [FK__SALEORDER__SALER__5165187F] FOREIGN KEY([SALER])
REFERENCES [CUSTOMER].[CUSTOMER] ([ID])
GO

ALTER TABLE [TRSACTION].[SALEORDER] CHECK CONSTRAINT [FK__SALEORDER__SALER__5165187F]
GO

ALTER TABLE [TRSACTION].[SALEORDER]  WITH CHECK ADD  CONSTRAINT [CK_SALESORDER_BUYERNOTSALER] CHECK  (([BUYER]<>[SALER]))
GO

ALTER TABLE [TRSACTION].[SALEORDER] CHECK CONSTRAINT [CK_SALESORDER_BUYERNOTSALER]
GO
