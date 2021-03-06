USE [master]
GO
/****** Object:  Database [eHorakelleEstate]    Script Date: 02/01/2014 22:16:53 ******/
CREATE DATABASE [eHorakelleEstate] ON  PRIMARY 
( NAME = N'CMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\eHorakelleEstate.mdf' , SIZE = 5376KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\eHorakelleEstate_log.ldf' , SIZE = 26816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eHorakelleEstate] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eHorakelleEstate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eHorakelleEstate] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [eHorakelleEstate] SET ANSI_NULLS OFF
GO
ALTER DATABASE [eHorakelleEstate] SET ANSI_PADDING OFF
GO
ALTER DATABASE [eHorakelleEstate] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [eHorakelleEstate] SET ARITHABORT OFF
GO
ALTER DATABASE [eHorakelleEstate] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [eHorakelleEstate] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [eHorakelleEstate] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [eHorakelleEstate] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [eHorakelleEstate] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [eHorakelleEstate] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [eHorakelleEstate] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [eHorakelleEstate] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [eHorakelleEstate] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [eHorakelleEstate] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [eHorakelleEstate] SET  DISABLE_BROKER
GO
ALTER DATABASE [eHorakelleEstate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [eHorakelleEstate] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [eHorakelleEstate] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [eHorakelleEstate] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [eHorakelleEstate] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [eHorakelleEstate] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [eHorakelleEstate] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [eHorakelleEstate] SET  READ_WRITE
GO
ALTER DATABASE [eHorakelleEstate] SET RECOVERY FULL
GO
ALTER DATABASE [eHorakelleEstate] SET  MULTI_USER
GO
ALTER DATABASE [eHorakelleEstate] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [eHorakelleEstate] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'eHorakelleEstate', N'ON'
GO
USE [eHorakelleEstate]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 02/01/2014 22:16:54 ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [cmsuser]    Script Date: 02/01/2014 22:16:54 ******/
CREATE USER [rizabud1_hsnava] FOR LOGIN [rizabud1_hsnava] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[VisitorId] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Tax] [decimal](18, 2) NOT NULL,
	[BillAmount] [decimal](18, 2) NOT NULL,
	[BookedDate] [datetime] NOT NULL,
	[PaidBy] [int] NOT NULL,
	[PaymentMade] [bit] NOT NULL,
	[Commision] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Invoices] ON
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (1, N'Inv       -001', 1, 2, CAST(572.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(572.00 AS Decimal(18, 2)), CAST(0x0000A1CA01030A70 AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (2, N'Inv       -002', 1, 2, CAST(390.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(390.00 AS Decimal(18, 2)), CAST(0x0000A1CA010A18E5 AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (3, N'Inv       -003', 1, 2, CAST(2860.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2860.00 AS Decimal(18, 2)), CAST(0x0000A1CB00F234D8 AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (4, N'Inv       -004', 1, 2, CAST(1157.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1157.00 AS Decimal(18, 2)), CAST(0x0000A1CB0116EE3E AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (5, N'Inv       -005', 1, 2, CAST(1157.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1157.00 AS Decimal(18, 2)), CAST(0x0000A1CB0116EEEA AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (6, N'Inv       -006', 1, 2, CAST(1653.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1629.00 AS Decimal(18, 2)), CAST(0x0000A1E6009EB18E AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (7, N'Inv       -007', 1, 2, CAST(572.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(568.00 AS Decimal(18, 2)), CAST(0x0000A1E600C72DFF AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (8, N'Inv-008', 1, 2, CAST(572.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(568.00 AS Decimal(18, 2)), CAST(0x0000A1E600CB3F7D AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (9, N'Inv-009', 1, 2, CAST(572.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(568.00 AS Decimal(18, 2)), CAST(0x0000A1E600D0F92E AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (10, N'Inv-010', 1, 2, CAST(608.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(602.00 AS Decimal(18, 2)), CAST(0x0000A1E600FB0A4D AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (11, N'Inv-011', 1, 2, CAST(1536.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1512.00 AS Decimal(18, 2)), CAST(0x0000A1E600FC281E AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (12, N'Inv-012', 1, 2, CAST(992.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(979.00 AS Decimal(18, 2)), CAST(0x0000A1E60104469A AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (13, N'Inv-013', 1, 2, CAST(677.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(667.00 AS Decimal(18, 2)), CAST(0x0000A1E6010D46B3 AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Invoices] ([Id], [InvoiceNo], [CompanyId], [VisitorId], [TotalAmount], [Discount], [Tax], [BillAmount], [BookedDate], [PaidBy], [PaymentMade], [Commision]) VALUES (14, N'Inv-014', 1, 2, CAST(3051.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(3036.00 AS Decimal(18, 2)), CAST(0x0000A1E601106AF1 AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Invoices] OFF
/****** Object:  Table [dbo].[InvoiceNumbers]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceNumbers](
	[Id] [int] NOT NULL,
	[InvoicePrefix] [nchar](10) NOT NULL,
	[InvoiceNo] [int] NOT NULL,
 CONSTRAINT [PK_InvoiceNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[InvoiceNumbers] ([Id], [InvoicePrefix], [InvoiceNo]) VALUES (1, N'Inv       ', 15)
/****** Object:  Table [dbo].[Groups]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Website] [nvarchar](100) NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Groups] ON
INSERT [dbo].[Groups] ([Id], [Name], [Website], [Created]) VALUES (12, N'Hospitality', NULL, CAST(0x0000A15A00F4BF3F AS DateTime))
SET IDENTITY_INSERT [dbo].[Groups] OFF
/****** Object:  Table [dbo].[Features]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Features](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Features] ON
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (1, N'WIFI', 1, 3, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (2, N'Spa', 1, 1, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (3, N'Play Ground', 1, 4, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (4, N'Boating', 1, 6, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (5, N'Swimming pool', 1, 2, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (6, N'Gym', 1, 5, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (7, N'Living room', 1, 7, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (8, N'Kitchen', 1, 8, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (9, N'Dining room', 1, 9, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (10, N'Toilet and bathroom', 1, 10, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (11, N'Terrace', 1, 11, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (12, N'Parking ', 1, 12, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (13, N'Fishing', 1, 13, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (14, N'Bar', 1, 15, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (15, N'Cable/Sat TV', 1, 14, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (16, N'AC rooms', 1, 16, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (17, N'Hot Water', 1, 17, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (18, N'Fully Furnished', 1, 18, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (19, N'Tennis court', 1, 19, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (20, N'Squash court', 1, 20, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (21, N'Mini super market', 1, 21, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (22, N'test2345678-un', 0, 22, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (23, N'sgtgsdgdsgsd', 0, 23, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (24, N'My feature', 0, 24, 4)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (25, N'My test123567894', 0, 25, 1)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (26, N'reyeryeyeryr', 0, 26, 5)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (27, N'5 luxury guest rooms', 0, 27, 6)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (28, N'Michelin star restaurant', 0, 28, 6)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (29, N'Rooftop cocktail bar', 0, 29, 6)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (30, N'Infinity pool', 0, 30, 6)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (31, N'24 hour front desk staff', 0, 31, 6)
INSERT [dbo].[Features] ([Id], [Name], [IsActive], [DisplayOrder], [GroupId]) VALUES (32, N'Free airport pick up/drop off service', 0, 32, 6)
SET IDENTITY_INSERT [dbo].[Features] OFF
/****** Object:  Table [dbo].[FeatureCategories]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeatureCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_FeatureCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[FeatureCategories] ON
INSERT [dbo].[FeatureCategories] ([Id], [Name], [DisplayOrder]) VALUES (6, N'Estate Facilities', 0)
INSERT [dbo].[FeatureCategories] ([Id], [Name], [DisplayOrder]) VALUES (7, N'Room Features', 0)
SET IDENTITY_INSERT [dbo].[FeatureCategories] OFF
/****** Object:  Table [dbo].[EmailNotifications]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailNotifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ToAddress] [nvarchar](100) NULL,
	[FromAddress] [nvarchar](100) NULL,
	[FromUserName] [nvarchar](50) NULL,
	[FromPassword] [nvarchar](50) NULL,
	[MailPort] [int] NULL,
	[Subject] [nvarchar](200) NULL,
	[Message] [nvarchar](max) NULL,
	[IsSend] [bit] NOT NULL,
	[GroupId] [int] NULL,
	[CompanyId] [int] NULL,
	[DivisionId] [int] NULL,
	[DepartmentId] [int] NULL,
	[SectionId] [int] NULL,
	[SentDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_EmailNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EmailNotifications] ON
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5431, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6827, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA99A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5432, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6831, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9A0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5433, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9A6 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5434, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6877, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9AC AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5435, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6888, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9B3 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5436, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9BA AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5437, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6934, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9C0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5438, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6942, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9C6 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5439, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6951, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9CC AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5440, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6960, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9D3 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5441, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6977, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9DB AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5442, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6982, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9E2 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5443, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7012, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9E8 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5444, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9EE AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5445, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7063, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9F4 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5446, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7075, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CA9FA AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5447, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7089, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA00 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5448, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA06 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5449, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6817, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA0C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5450, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6843, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA11 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5451, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6851, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA18 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5452, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6874, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA1D AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5453, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6897, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA23 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5454, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6907, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA28 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5455, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6991, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA2E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5456, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6994, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA33 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5457, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA38 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5458, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7066, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA3E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5459, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6943, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA44 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5460, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7026, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA49 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5461, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6969, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA4F AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5462, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6866, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA54 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5463, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6816, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA5A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5464, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6955, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA60 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5465, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6867, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA65 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5466, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6993, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA6B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5467, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA70 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5468, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6947, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA76 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5469, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7099, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA7C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5470, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7043, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA81 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5471, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7072, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA87 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5472, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA8E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5473, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6916, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA94 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5474, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6863, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAA9A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5475, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7038, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAA0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5476, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAA5 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5477, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAAB AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5478, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7056, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAB0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5479, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6889, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAB5 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5480, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6941, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAABA AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5481, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7037, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAC0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5482, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6865, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAC6 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5483, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAACC AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5484, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6893, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAD2 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5485, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAD7 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5486, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7096, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAADC AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5487, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6857, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAE2 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5488, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7011, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAE8 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5489, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAEE AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5490, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7070, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAF3 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5491, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7071, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAF9 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5492, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7069, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAAFF AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5493, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7062, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB04 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5494, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6885, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB0A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5495, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6968, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB10 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5496, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6859, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB16 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5497, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6807, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB1B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5498, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6989, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB21 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5499, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7014, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB26 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5500, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6975, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB2C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5501, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB32 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5502, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6996, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB3A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5503, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6914, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB40 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5504, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6848, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB46 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5505, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6922, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB4B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5506, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6992, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB51 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5507, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7065, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB56 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5508, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB5C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5509, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6979, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB62 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5510, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6806, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB68 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5511, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6808, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB6D AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5512, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6876, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB73 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5513, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB78 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5514, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6954, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB7E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5515, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7030, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB83 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5516, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7040, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB89 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5517, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB8F AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5518, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6822, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB94 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5519, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7091, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAB9A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5520, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6988, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABA0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5521, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7086, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABA6 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5522, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6927, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABAD AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5523, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6860, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABB2 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5524, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7067, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABB8 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5525, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6818, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABBD AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5526, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7035, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABC3 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5527, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6908, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABC8 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5528, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6839, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABCE AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5529, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7058, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABD4 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5530, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6923, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABDB AS DateTime), 12)
GO
print 'Processed 100 total records'
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5531, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7076, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABE1 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5532, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6829, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABE7 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5533, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6884, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABED AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5534, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6920, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABF3 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5535, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6950, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABF8 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5536, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6918, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CABFE AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5537, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7068, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC04 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5538, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6821, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC09 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5539, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6819, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC0F AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5540, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6811, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC16 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5541, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6917, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC1B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5542, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC21 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5543, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7039, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC27 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5544, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7041, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC2E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5545, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6836, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC34 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5546, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6931, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC3B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5547, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6939, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC41 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5548, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6919, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC47 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5549, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7082, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC4C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5550, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7053, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC52 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5551, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7054, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC58 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5552, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6964, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC5E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5553, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6832, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC63 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5554, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6935, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC69 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5555, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6872, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC6F AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5556, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6946, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC75 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5557, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6949, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC7A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5558, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6903, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC80 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5559, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7049, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC85 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5560, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6842, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC8B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5561, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6995, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAC9D AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5562, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6871, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACA3 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5563, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACA9 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5564, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6901, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACAE AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5565, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACB4 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5566, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6899, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACBA AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5567, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACC0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5568, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6905, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACC6 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5569, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACCC AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5570, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7006, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACD1 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5571, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7017, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACD7 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5572, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACDD AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5573, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6925, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACE4 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5574, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7094, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACEA AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5575, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACEF AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5576, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7027, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACF5 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5577, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6883, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CACFB AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5578, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6926, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD01 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5579, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6940, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD07 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5580, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6915, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD0C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5581, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6882, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD12 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5582, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6879, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD19 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5583, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7057, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD1F AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5584, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6868, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD26 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5585, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7036, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD2C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5586, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6833, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD32 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5587, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7050, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD38 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5588, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7051, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD3E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5589, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6944, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD44 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5590, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD4A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5591, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6999, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD50 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5592, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD57 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5593, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6972, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD5D AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5594, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7092, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD63 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5595, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6845, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD6A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5596, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6913, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD70 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5597, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7073, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD76 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5598, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD7C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5599, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD82 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5600, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7074, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD88 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5601, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6921, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD8E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5602, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6933, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD94 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5603, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7078, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAD9A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5604, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7015, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADA0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5605, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6938, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADA6 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5606, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADAC AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5607, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6976, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADB1 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5608, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6823, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADB7 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5609, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6894, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADBD AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5610, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6849, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADC3 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5611, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6898, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADC8 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5612, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7077, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADCE AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5613, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6924, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADD4 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5614, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7034, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADDA AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5615, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6910, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADE0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5616, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6967, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADE6 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5617, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6856, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADEC AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5618, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6815, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADF2 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5619, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6880, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADF8 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5620, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6830, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CADFE AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5621, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE04 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5622, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7047, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE0A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5623, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7093, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE10 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5624, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE16 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5625, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7090, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE1C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5626, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7081, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE22 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5627, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6983, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE28 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5628, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6936, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE2E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5629, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6962, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE33 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5630, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6986, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE39 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5631, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6930, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE3F AS DateTime), 12)
GO
print 'Processed 200 total records'
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5632, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6825, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE45 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5633, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6810, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE4B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5634, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6886, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE51 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5635, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6971, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE57 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5636, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE5E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5637, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6820, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE64 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5638, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE6B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5639, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7009, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE72 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5640, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7052, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE78 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5641, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7083, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE7D AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5642, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6945, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE83 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5643, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7044, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE8A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5644, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6952, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE90 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5645, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6881, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE97 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5646, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6953, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAE9E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5647, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEA4 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5648, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7087, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEAA AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5649, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6853, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEB0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5650, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6887, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEB7 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5651, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6858, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEBD AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5652, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6984, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEC3 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5653, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7042, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEC9 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5654, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7025, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAED0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5655, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6813, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAED6 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5656, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6864, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEDC AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5657, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6909, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEE2 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5658, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6878, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEE9 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5659, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6852, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEF0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5660, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6973, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEF7 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5661, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6854, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAEFD AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5662, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7048, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF03 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5663, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6956, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF09 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5664, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6837, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF10 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5665, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7061, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF18 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5666, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6841, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF1E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5667, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6896, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF25 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5668, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6892, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF2B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5669, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6861, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF33 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5670, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6965, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF3A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5671, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF41 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5672, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6929, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF47 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5673, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6937, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF4F AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5674, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7098, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF55 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5675, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF5B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5676, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7088, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF61 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5677, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6824, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF67 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5678, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6826, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF6D AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5679, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6834, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF74 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5680, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6855, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF7A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5681, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6891, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF80 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5682, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7004, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF86 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5683, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF8C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5684, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7033, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF93 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5685, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7045, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAF99 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5686, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7055, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFA0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5687, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7079, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFA9 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5688, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7029, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFB1 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5689, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFB9 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5690, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6987, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFBF AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5691, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6911, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFC5 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5692, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6895, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFCC AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5693, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6814, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFD3 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5694, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6958, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFDA AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5695, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6959, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFE1 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5696, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6840, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFE7 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5697, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6890, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFEE AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5698, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7059, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFF5 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5699, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6912, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CAFFB AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5700, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7084, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB002 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5701, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6963, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB008 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5702, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6966, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB00F AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5703, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB015 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5704, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7046, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB01C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5705, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7097, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB022 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5706, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB029 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5707, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6828, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB02F AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5708, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6961, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB035 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5709, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6997, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB03C AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5710, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7028, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB042 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5711, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6838, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB048 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5712, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6948, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB04E AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5713, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6809, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB055 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5714, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7060, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB05B AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5715, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6974, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB062 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5716, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6928, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB069 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5717, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB06F AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5718, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6957, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB076 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5719, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB07D AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5720, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6985, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB084 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5721, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6873, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB08A AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5722, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7013, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB091 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5723, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7010, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB098 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5724, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6869, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB09F AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5725, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6932, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0A5 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5726, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0AC AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5727, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7007, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0B3 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5728, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6978, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0B9 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5729, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6862, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0C0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5730, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6846, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0C6 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5731, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6980, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0CD AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5732, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6981, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0D4 AS DateTime), 12)
GO
print 'Processed 300 total records'
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5733, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6998, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0DB AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5734, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7018, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0E1 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5735, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6990, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0E8 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5736, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7085, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0F0 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5737, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6904, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0F6 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5738, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7031, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB0FD AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5739, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 7106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB104 AS DateTime), 12)
INSERT [dbo].[EmailNotifications] ([Id], [UniqueId], [EmployeeId], [ToAddress], [FromAddress], [FromUserName], [FromPassword], [MailPort], [Subject], [Message], [IsSend], [GroupId], [CompanyId], [DivisionId], [DepartmentId], [SectionId], [SentDate], [CreatedDate], [UserId]) VALUES (5740, N'a9969914-f8f0-43ef-93e7-af07dfbf6d75', 6812, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, 36, 0, 0, 0, NULL, CAST(0x0000A15B006CB10A AS DateTime), 12)
SET IDENTITY_INSERT [dbo].[EmailNotifications] OFF
/****** Object:  Table [dbo].[EmailAttachments]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[AttachmentPath] [nvarchar](250) NOT NULL,
	[Attachment] [image] NOT NULL,
 CONSTRAINT [PK_EmailAttachments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DistrictImages]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistrictImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[ImageName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_DistrictImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DistrictImages] ON
INSERT [dbo].[DistrictImages] ([Id], [DistrictId], [ImageName], [Description]) VALUES (1, 1, N'nature1.jpg', N'Lake')
SET IDENTITY_INSERT [dbo].[DistrictImages] OFF
/****** Object:  Table [dbo].[Dinings]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dinings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FoodId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[MealType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dining] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dinings] ON
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (1, 1, 1, CAST(20.00 AS Decimal(18, 2)), N'Lunch. BF')
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (2, 2, 1, CAST(50.00 AS Decimal(18, 2)), N'Lunch. BF & dinner')
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (3, 4, 0, CAST(245.00 AS Decimal(18, 2)), N'Lunch, Break fast')
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (4, 3, 14, CAST(12.00 AS Decimal(18, 2)), N'Lunch, Break fast')
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (5, 2, 24, CAST(13.00 AS Decimal(18, 2)), N'2qrwddsd')
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (6, 4, 25, CAST(232.00 AS Decimal(18, 2)), N'VegetRIAN')
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (7, 2, 25, CAST(23.00 AS Decimal(18, 2)), N'wrqwrw r')
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (8, 5, 25, CAST(35.00 AS Decimal(18, 2)), N'dfe we re')
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (9, 4, 14, CAST(12.00 AS Decimal(18, 2)), N'w rqwrwq tqt wey ywey ete t')
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (10, 4, 14, CAST(23.00 AS Decimal(18, 2)), N'test')
INSERT [dbo].[Dinings] ([Id], [FoodId], [PropertyId], [Price], [MealType]) VALUES (11, 4, 14, CAST(12.00 AS Decimal(18, 2)), N'test food, lunch, Break fast')
SET IDENTITY_INSERT [dbo].[Dinings] OFF
/****** Object:  Table [dbo].[Designations]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Designations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Designations] ON
INSERT [dbo].[Designations] ([Id], [Name], [DisplayOrder]) VALUES (255, N'Farmer', 2)
INSERT [dbo].[Designations] ([Id], [Name], [DisplayOrder]) VALUES (256, N'Fisher man', 1)
INSERT [dbo].[Designations] ([Id], [Name], [DisplayOrder]) VALUES (258, N'test erer', 1)
INSERT [dbo].[Designations] ([Id], [Name], [DisplayOrder]) VALUES (259, N'tester', 1)
INSERT [dbo].[Designations] ([Id], [Name], [DisplayOrder]) VALUES (260, N'345435 54tfsd', 1)
SET IDENTITY_INSERT [dbo].[Designations] OFF
/****** Object:  Table [dbo].[Customers]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [int] NULL,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[Gender] [int] NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Street] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[Country] [int] NULL,
	[Zip] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Mobile] [nvarchar](250) NULL,
	[Fax] [nvarchar](250) NULL,
	[Remarks] [nvarchar](400) NULL,
	[Active] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[DateOfBirth] [datetime] NULL,
	[DateOfJoin] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT [dbo].[Customers] ([CustomerId], [Title], [FirstName], [LastName], [Gender], [Email], [Address], [Street], [City], [Country], [Zip], [Phone], [Mobile], [Fax], [Remarks], [Active], [Created], [Modified], [DateOfBirth], [DateOfJoin], [UserId]) VALUES (2, 39, N'Navaseelan', N'N', NULL, N'navaseelan4u@gmail.com', N'72/E', N'Peter', N'Ragama', 210, N'11011', N'0112 9868989', N'+94774475196', NULL, NULL, 1, CAST(0x0000A1CA00DE1BE8 AS DateTime), NULL, CAST(0x0000720B00000000 AS DateTime), NULL, 27)
SET IDENTITY_INSERT [dbo].[Customers] OFF
/****** Object:  Table [dbo].[Cuisines]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cuisines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FoodType] [nvarchar](25) NOT NULL,
	[Foods] [nvarchar](250) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[ImageName] [varchar](50) NULL,
 CONSTRAINT [PK_Cuisine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cuisines] ON
INSERT [dbo].[Cuisines] ([Id], [FoodType], [Foods], [DisplayOrder], [ImageName]) VALUES (1, N'Vegetarian', N'Vege Fried Rice, Vege Chopsy', 2, NULL)
INSERT [dbo].[Cuisines] ([Id], [FoodType], [Foods], [DisplayOrder], [ImageName]) VALUES (2, N'Non-Vege', N'Chicken Fried Rice, Buriyani, Chopsy', 1, N'IMG_3777.JPG')
INSERT [dbo].[Cuisines] ([Id], [FoodType], [Foods], [DisplayOrder], [ImageName]) VALUES (3, N'Thai food', N'Thai food', 3, NULL)
INSERT [dbo].[Cuisines] ([Id], [FoodType], [Foods], [DisplayOrder], [ImageName]) VALUES (4, N'Chinees', N'Noodles,Prawn Fry ', 4, NULL)
INSERT [dbo].[Cuisines] ([Id], [FoodType], [Foods], [DisplayOrder], [ImageName]) VALUES (5, N'test rtrttt', N'', 5, NULL)
SET IDENTITY_INSERT [dbo].[Cuisines] OFF
/****** Object:  Table [dbo].[Countries]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Article] [nvarchar](max) NULL,
	[Region_Id] [int] NULL,
 CONSTRAINT [PK_Countries_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Countries] ON
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (8, N'Afghanistan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (9, N'Albania', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (10, N'Algeria', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (11, N'Andorra', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (12, N'Angola', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (13, N'Antigua and Barbuda', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (14, N'Argentinia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (15, N'Armenia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (16, N'Australia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (17, N'Austria', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (18, N'Azerbaijan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (19, N'Bahamas', N'The', NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (20, N'Bahrain', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (21, N'Bangladesh', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (22, N'Barbados', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (23, N'Belarus', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (24, N'Belgium', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (25, N'Belize', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (26, N'Benin', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (27, N'Bermuda', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (28, N'Bhutan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (29, N'Bolivia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (30, N'Bosnia and Herzegovina', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (31, N'Botswana', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (32, N'Brazil', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (33, N'Brunei Darussalam', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (34, N'Bulgaria', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (35, N'Burkina Faso', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (36, N'Burundi', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (37, N'Cambodia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (38, N'Cameroon', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (39, N'Canada', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (40, N'Cape Verde', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (41, N'Cayman Islands', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (42, N'Central African Republic', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (43, N'Chad', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (44, N'Chile', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (45, N'China', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (46, N'Colombia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (47, N'Comoros', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (48, N'Congo', N'Democratic Republic of the ', NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (49, N'Congo', N'Republic of the ', NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (50, N'Costa Rica', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (51, N'Cote d''Ivoire', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (52, N'Croatia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (53, N'Cuba', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (54, N'Cyprus', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (55, N'Czech Republic', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (56, N'Denmark', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (57, N'Djibouti', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (58, N'Dominica', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (59, N'Dominican Republic', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (60, N'Ecuador', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (61, N'Egypt', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (62, N'El Salvador', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (63, N'Equatorial Guinea', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (64, N'Eritrea', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (65, N'Estonia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (66, N'Ethiopia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (67, N'Falkland Islands', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (68, N'Faroe Islands', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (69, N'Fiji', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (70, N'Finland', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (71, N'France', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (72, N'French Polynesia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (73, N'Gabon', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (74, N'Gambia', N'The', NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (75, N'Georgia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (76, N'Germany', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (77, N'Ghana', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (78, N'Greece', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (79, N'Greenland', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (80, N'Grenada', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (81, N'Guadeloupe', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (82, N'Guatemala', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (83, N'Guinea', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (84, N'Guinea-Bissau', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (85, N'Guyana', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (86, N'Haiti', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (87, N'Honduras', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (88, N'Hong Kong', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (89, N'Hungary', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (90, N'Iceland', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (91, N'India', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (92, N'Indonesia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (93, N'Iran', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (94, N'Iraq', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (95, N'Ireland', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (96, N'Isle of Man', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (97, N'Israel', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (98, N'Italy', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (99, N'Jamaica', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (100, N'Japan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (101, N'Jordan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (102, N'Kazakhstan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (103, N'Kenya', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (104, N'Kiribati', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (105, N'Korea', N'North', NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (106, N'Korea', N'South', NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (107, N'Kuwait', NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (108, N'Kyrgyzstan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (109, N'Laos', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (110, N'Latvia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (111, N'Lebanon', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (112, N'Lesotho', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (113, N'Liberia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (114, N'Libya', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (115, N'Liechtenstein', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (116, N'Lithuania', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (117, N'Luxembourg', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (118, N'Macau', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (119, N'Macedonia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (120, N'Madagascar', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (121, N'Malawi', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (122, N'Malaysia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (123, N'Maldives', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (124, N'Mali', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (125, N'Malta', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (126, N'Marshall Islands', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (127, N'Martinique', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (128, N'Mauritania', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (129, N'Mauritius', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (130, N'Mexico', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (131, N'Micronesia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (132, N'Moldova', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (133, N'Monaco', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (134, N'Mongolia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (135, N'Montenegro', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (136, N'Morocco', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (137, N'Mozambique', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (138, N'Myanmar', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (139, N'Namibia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (140, N'Nauru', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (141, N'Nepal', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (142, N'Netherlands', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (143, N'New Caledonia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (144, N'New Zealand', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (145, N'Nicaragua', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (146, N'Niger', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (147, N'Nigeria', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (148, N'Norway', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (149, N'Oman', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (150, N'Pakistan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (151, N'Palau', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (152, N'Palestinian Territories', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (153, N'Panama', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (154, N'Papua New Guinea', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (155, N'Paraguay', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (156, N'Peru', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (157, N'Philippines', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (158, N'Poland', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (159, N'Portugal', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (160, N'Puerto Rico', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (161, N'Qatar', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (162, N'Réunion', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (163, N'Romania', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (164, N'Russia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (165, N'Rwanda', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (166, N'Saint Barthélemy', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (167, N'Saint Helena', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (168, N'Saint Kitts and Nevis', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (169, N'Saint Lucia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (170, N'Saint Martin', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (171, N'Saint Vincent and the Grenadines', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (172, N'Samoa', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (173, N'San Marino', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (174, N'Sao Tome and Principe', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (175, N'Saudi Arabia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (176, N'Senegal', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (177, N'Serbia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (178, N'Seychelles', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (179, N'Sierra Leone', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (180, N'Singapore', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (181, N'Slovakia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (182, N'Slovenia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (183, N'Solomon Islands', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (184, N'Somalia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (185, N'South Africa', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (186, N'South Georgia and South Sandwich Islands', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (187, N'Spain', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (189, N'Sudan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (190, N'Suriname', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (191, N'Swaziland', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (192, N'Sweden', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (193, N'Switzerland', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (194, N'Syria', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (195, N'Taiwan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (196, N'Tajikistan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (197, N'Tanzania', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (198, N'Thailand', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (199, N'Timor-Leste', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (200, N'Togo', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (201, N'Tonga', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (202, N'Trinidad and Tobago', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (203, N'Tunisia', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (204, N'Turkey', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (205, N'Turkmenistan', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (206, N'Tuvalu', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (207, N'U.S. Virgin Islands', NULL, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Article], [Region_Id]) VALUES (210, N'Srilanka', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
print 'Processed 200 total records'
/****** Object:  Table [dbo].[CompanyProfiles]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyProfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Web] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Street] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[Country] [int] NULL,
	[Zip] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Fax] [nvarchar](250) NULL,
	[Remarks] [nvarchar](400) NULL,
	[VATRegNo] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_CompanyProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyProfiles] ON
INSERT [dbo].[CompanyProfiles] ([Id], [Name], [Email], [Web], [Address], [Street], [City], [Country], [Zip], [Phone], [Fax], [Remarks], [VATRegNo], [Active], [Created], [Modified], [CreatedBy]) VALUES (1, N'GlobalSpices', N'navaseelan4u@gmail.com', N'http://globalspices.com.au/', N'a', N'a', N'a', 13, N'1313', N'90304024020', N'21421', N'test.................', N'erg234', 1, CAST(0x0000A1DB00000000 AS DateTime), CAST(0x0000A1E600C68D3A AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CompanyProfiles] OFF
/****** Object:  Table [dbo].[Companies]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Website] [nvarchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [int] NULL,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[Gender] [int] NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Street] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[Country] [int] NULL,
	[Zip] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Mobile] [nvarchar](250) NULL,
	[Fax] [nvarchar](250) NULL,
	[Remarks] [nvarchar](400) NULL,
	[Active] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[DateOfBirth] [datetime] NULL,
	[DateOfJoin] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON
INSERT [dbo].[Clients] ([ClientId], [Title], [FirstName], [LastName], [Gender], [Email], [Address], [Street], [City], [Country], [Zip], [Phone], [Mobile], [Fax], [Remarks], [Active], [Created], [Modified], [DateOfBirth], [DateOfJoin], [UserId]) VALUES (1, NULL, N'Navaseelan', N'N', NULL, N'navaseelan@ezeroonetech.com', N'72/e', N'Ragama', N'erwre', 210, NULL, N'12412412444', N'24414421445', N'ttetwe', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Clients] ([ClientId], [Title], [FirstName], [LastName], [Gender], [Email], [Address], [Street], [City], [Country], [Zip], [Phone], [Mobile], [Fax], [Remarks], [Active], [Created], [Modified], [DateOfBirth], [DateOfJoin], [UserId]) VALUES (2, NULL, N'Navaseelan', N'n', NULL, N'navaseelan@ezeroonetech.com', N'72/e', N'fqw', N'rwqrwq', 210, NULL, N'12412412444', N'123456786464', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Clients] ([ClientId], [Title], [FirstName], [LastName], [Gender], [Email], [Address], [Street], [City], [Country], [Zip], [Phone], [Mobile], [Fax], [Remarks], [Active], [Created], [Modified], [DateOfBirth], [DateOfJoin], [UserId]) VALUES (3, NULL, N'Navaseelan', N'N', NULL, N'navaseelan@ezeroonetech.com', N'72/e', N'Ragama', N'email', 210, NULL, N'12412412444', N'24414421445', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Clients] ([ClientId], [Title], [FirstName], [LastName], [Gender], [Email], [Address], [Street], [City], [Country], [Zip], [Phone], [Mobile], [Fax], [Remarks], [Active], [Created], [Modified], [DateOfBirth], [DateOfJoin], [UserId]) VALUES (4, NULL, N'Nava', N'S', NULL, N'navaseelan@ezeroonetech.com', N'ewr', N'rwqrq', N'email', 210, NULL, N'32243664363', N'2424242525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Clients] OFF
/****** Object:  Table [dbo].[Bookings]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[VisitorId] [int] NOT NULL,
	[DateFrom] [datetime] NOT NULL,
	[DateTo] [datetime] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Tax] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON
INSERT [dbo].[Bookings] ([Id], [PropertyId], [CustomerId], [VisitorId], [DateFrom], [DateTo], [Amount], [Discount], [Tax]) VALUES (1, 1, 1, 0, CAST(0x0000A1B900000000 AS DateTime), CAST(0x0000A1F600000000 AS DateTime), CAST(2400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Bookings] ([Id], [PropertyId], [CustomerId], [VisitorId], [DateFrom], [DateTo], [Amount], [Discount], [Tax]) VALUES (2, 1, 1, 29, CAST(0x0000A23000000000 AS DateTime), CAST(0x0000A23800000000 AS DateTime), CAST(9600.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Bookings] ([Id], [PropertyId], [CustomerId], [VisitorId], [DateFrom], [DateTo], [Amount], [Discount], [Tax]) VALUES (3, 4, 27, 35, CAST(0x0000A2A800000000 AS DateTime), CAST(0x0000A2A900000000 AS DateTime), CAST(1440.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Bookings] OFF
/****** Object:  Table [dbo].[BookingCarts]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingCarts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingCartId] [uniqueidentifier] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[VisitorId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DateFrom] [datetime] NOT NULL,
	[DateTo] [datetime] NOT NULL,
 CONSTRAINT [PK_BookingCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beds]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BedName] [nvarchar](100) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[Occupancy] [int] NOT NULL,
 CONSTRAINT [PK_Beds] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BedRooms]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BedRooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[BedId] [int] NOT NULL,
 CONSTRAINT [PK_BedRooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BannerImages]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BannerImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[ImageDescription] [varchar](100) NOT NULL,
	[PlaceName] [varchar](100) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Distance] [nvarchar](50) NULL,
	[Lat] [decimal](18, 0) NULL,
	[Lon] [decimal](18, 0) NULL,
	[PlaceUrl] [nvarchar](50) NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_BannerImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BannerImages] ON
INSERT [dbo].[BannerImages] ([Id], [ImageName], [ImageDescription], [PlaceName], [Location], [Distance], [Lat], [Lon], [PlaceUrl], [DisplayOrder]) VALUES (5, N'demo_image_03.jpg', N'3 adults can use', N'Master Bed room', N'3 adults can use', NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, 0)
INSERT [dbo].[BannerImages] ([Id], [ImageName], [ImageDescription], [PlaceName], [Location], [Distance], [Lat], [Lon], [PlaceUrl], [DisplayOrder]) VALUES (6, N'demo_image_01.jpg', N'Delicious  Food', N'Dining table', N'Delicious  Food', NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, 0)
INSERT [dbo].[BannerImages] ([Id], [ImageName], [ImageDescription], [PlaceName], [Location], [Distance], [Lat], [Lon], [PlaceUrl], [DisplayOrder]) VALUES (7, N'demo_image_04.jpg', N'4 Adults can use', N'King size bed', N'Test', NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, 0)
SET IDENTITY_INSERT [dbo].[BannerImages] OFF
/****** Object:  Table [dbo].[AccommodationTypes]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccommodationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_AccommodationTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccommodationTypes] ON
INSERT [dbo].[AccommodationTypes] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (1, N'House', 1, 5)
INSERT [dbo].[AccommodationTypes] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (2, N'Apartment', 1, 1)
INSERT [dbo].[AccommodationTypes] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (3, N'Villa', 1, 2)
INSERT [dbo].[AccommodationTypes] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (4, N'Bungalow', 1, 3)
INSERT [dbo].[AccommodationTypes] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (7, N'test rwrwr', 0, 4)
SET IDENTITY_INSERT [dbo].[AccommodationTypes] OFF
/****** Object:  Table [dbo].[AccommodationStandards]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccommodationStandards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_AccommodationStandards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccommodationStandards] ON
INSERT [dbo].[AccommodationStandards] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (1, N'Basic', 1, 1)
INSERT [dbo].[AccommodationStandards] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (2, N'Standard', 1, 3)
INSERT [dbo].[AccommodationStandards] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (3, N'Superiour', 1, 5)
INSERT [dbo].[AccommodationStandards] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (4, N'Semi- Luxury', 1, 4)
INSERT [dbo].[AccommodationStandards] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (5, N'Luxury', 1, 2)
INSERT [dbo].[AccommodationStandards] ([Id], [Name], [IsActive], [DisplayOrder]) VALUES (6, N'test rrr', 0, 6)
SET IDENTITY_INSERT [dbo].[AccommodationStandards] OFF
/****** Object:  Table [dbo].[YoutubeUrls]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YoutubeUrls](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[Url] [nvarchar](100) NULL,
 CONSTRAINT [PK_YoutubeUrls] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitors]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitors](
	[VisitorId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [int] NULL,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[Gender] [int] NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Street] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[Country] [int] NULL,
	[Zip] [nvarchar](50) NULL,
	[Phone] [nvarchar](250) NULL,
	[Mobile] [nvarchar](250) NULL,
	[Fax] [nvarchar](250) NULL,
	[Remarks] [nvarchar](400) NULL,
	[Active] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[DateOfBirth] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Visitor] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisitorReviews]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitorReviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VisitorId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[Comments] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ReviewComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VisitorReviews] ON
INSERT [dbo].[VisitorReviews] ([Id], [VisitorId], [PropertyId], [Comments]) VALUES (1, 30, 21, N'My name is billa')
INSERT [dbo].[VisitorReviews] ([Id], [VisitorId], [PropertyId], [Comments]) VALUES (2, 35, 21, N'The critical issues with SOAP vs. REST are performance, scalability and adding new APIs.  Once you''ve pulled down a SOAP WSDL file and generated proxies to call it and built your client with those definitions, it''s a pain in the butt when that SOAP WSDL changes.  REST is entirely different, enabling REST service providers to add new APIs and new versions of APIs easily without disrupting clients that are using the existing ones.

')
SET IDENTITY_INSERT [dbo].[VisitorReviews] OFF
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UsersInRoles_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UsersInRoles] ON
INSERT [dbo].[UsersInRoles] ([Id], [RoleId], [UserId]) VALUES (10, 1, 16)
INSERT [dbo].[UsersInRoles] ([Id], [RoleId], [UserId]) VALUES (11, 1, 17)
SET IDENTITY_INSERT [dbo].[UsersInRoles] OFF
/****** Object:  Table [dbo].[UsersCompanies]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersCompanies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UsersCompanies] ON
INSERT [dbo].[UsersCompanies] ([Id], [Company], [IsActive]) VALUES (1, N'LECS', 1)
SET IDENTITY_INSERT [dbo].[UsersCompanies] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[IsEmailActivated] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_CompanyId] ON [dbo].[Users] 
(
	[CompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Settings_Id] ON [dbo].[Users] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [IsEmailActivated], [Active], [Created], [CompanyId], [RoleId]) VALUES (27, N'navaseelan4u@gmail.com', N'f5d1278e8109edd94e1e4197e04873b9', N'Navaseelan', N'N', 1, 1, CAST(0x0000A1CA00DAF216 AS DateTime), 1, 1)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [IsEmailActivated], [Active], [Created], [CompanyId], [RoleId]) VALUES (29, N'navaseelan@ezeroonetech2.com', N'f5d1278e8109edd94e1e4197e04873b9', N'Navaseelan', N'N', 1, 1, CAST(0x0000A214015E1469 AS DateTime), 1, 3)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [IsEmailActivated], [Active], [Created], [CompanyId], [RoleId]) VALUES (30, N'navaseelan@ezeroonetech3.com', N'f5d1278e8109edd94e1e4197e04873b9', N'Navaseelan', N'N', 1, 1, CAST(0x0000A22A01064649 AS DateTime), 1, 3)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [IsEmailActivated], [Active], [Created], [CompanyId], [RoleId]) VALUES (31, N'navaseelan@ezeroonetech4.com', N'f5d1278e8109edd94e1e4197e04873b9', N'Navaseelan', N'n', 0, 0, CAST(0x0000A22A0108E59A AS DateTime), 1, 3)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [IsEmailActivated], [Active], [Created], [CompanyId], [RoleId]) VALUES (32, N'navaseelan@ezeroonete1ch.com', N'f5d1278e8109edd94e1e4197e04873b9', N'Navaseelan', N'N', 1, 1, CAST(0x0000A22A0109343F AS DateTime), 1, 2)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [IsEmailActivated], [Active], [Created], [CompanyId], [RoleId]) VALUES (33, N'navaseelanw44u@gmail.com', N'f5d1278e8109edd94e1e4197e04873b9', N'Navaseelan', N'n', 0, 0, CAST(0x0000A245014C458C AS DateTime), 1, 3)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [IsEmailActivated], [Active], [Created], [CompanyId], [RoleId]) VALUES (34, N'navaseelan@ezeroonetech.com', N'f5d1278e8109edd94e1e4197e04873b9', N'Nava', N'S', 1, 1, CAST(0x0000A24501522F93 AS DateTime), 1, 2)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [IsEmailActivated], [Active], [Created], [CompanyId], [RoleId]) VALUES (35, N'navaseelan4u@hotmail.com', N'f5d1278e8109edd94e1e4197e04873b9', N'Navaseelan', N'N', 1, 1, CAST(0x0000A24800C3D004 AS DateTime), 1, 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[UserRoles]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON
INSERT [dbo].[UserRoles] ([Id], [RoleName], [IsActive]) VALUES (1, N'Administrator', 1)
INSERT [dbo].[UserRoles] ([Id], [RoleName], [IsActive]) VALUES (2, N'Power Users', 1)
INSERT [dbo].[UserRoles] ([Id], [RoleName], [IsActive]) VALUES (3, N'Basic Users', 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
/****** Object:  Table [dbo].[UserMenuPermission]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMenuPermission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[MenuId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsViewed] [bit] NOT NULL,
	[IsSave] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[IsUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_UserMenuPermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserMenuPermission] ON
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (0, 0, 2, 1, 0, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (2, 0, 5, 1, 0, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (3, 0, 7, 1, 0, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (4, 0, 3, 1, 0, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (5, 0, 4, 2, 0, 1, 0, 1)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (6, 0, 4, 1, 0, 1, 0, 1)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (7, 0, 2, 2, 0, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (8, 0, 6, 1, 0, 1, 0, 1)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (9, 0, 6, 2, 0, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (10, 0, 8, 1, 1, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (11, 0, 8, 1, 1, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (12, 0, 11, 1, 1, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (13, 0, 11, 1, 1, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (14, 0, 2, 3, 1, 1, 0, 0)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (15, 0, 3, 3, 1, 1, 0, 1)
INSERT [dbo].[UserMenuPermission] ([Id], [UserId], [MenuId], [RoleId], [IsViewed], [IsSave], [IsDelete], [IsUpdate]) VALUES (16, 0, 4, 3, 1, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[UserMenuPermission] OFF
/****** Object:  Table [dbo].[UserLogs]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogs](
	[LoggedId] [uniqueidentifier] NOT NULL,
	[UserId] [int] NULL,
	[LoggedDate] [datetime] NULL,
	[LogOff] [datetime] NULL,
 CONSTRAINT [PK_UserLogs] PRIMARY KEY CLUSTERED 
(
	[LoggedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TravelBies]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TravelBies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_TravelBy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TravelBies] ON
INSERT [dbo].[TravelBies] ([Id], [Name], [DisplayOrder]) VALUES (1, N'By Cycle', 1)
INSERT [dbo].[TravelBies] ([Id], [Name], [DisplayOrder]) VALUES (2, N'By Motor Bike', 2)
INSERT [dbo].[TravelBies] ([Id], [Name], [DisplayOrder]) VALUES (7, N'By Walk', 1)
INSERT [dbo].[TravelBies] ([Id], [Name], [DisplayOrder]) VALUES (8, N'by tuk tuk', 0)
SET IDENTITY_INSERT [dbo].[TravelBies] OFF
/****** Object:  Table [dbo].[Translators]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ImageName] [nvarchar](100) NULL,
	[Language] [nvarchar](50) NOT NULL,
	[Landline] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Translators] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Translators] ON
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (1, 4, N'nava', NULL, N'Tamil', N'12412214', N'etewrere', 1)
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (2, 4, N'seelan', NULL, N'english', N'1234567', N'12345678', 1)
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (3, 14, N'Gampha resort', NULL, N'Tamil', N'12412214', N'12345678', 1)
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (4, 14, N'seelan-edit done', NULL, N'english', N'12412214', N'12345678', 1)
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (5, 1, N'Naavase', NULL, N'Tamil', N'12412214', N'12345678', 1)
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (6, 1, N'Seelan', NULL, N'english', N'1234567', N'244144214', 1)
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (7, 14, N'seelan-edit', NULL, N'english', N'12412214', N'12345678', 1)
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (8, 24, N'nvadad', NULL, N'Tamil', N'12412214', N'21215255', 1)
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (9, 14, N'nava', N'20130929_171602.jpg', N'wetewtewtewt', N'12412214', N'24414421445', 1)
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (10, 25, N'HTC', N'settai-movie-stills-10.jpg', N'english', N'1234567445', N'24414421445', 1)
INSERT [dbo].[Translators] ([Id], [PropertyId], [Name], [ImageName], [Language], [Landline], [Mobile], [IsActive]) VALUES (11, 25, N'Blue Waters-edited', N'fishermen1.jpg', N'sadsad', N'asdsa', N'asdsa', 1)
SET IDENTITY_INSERT [dbo].[Translators] OFF
/****** Object:  Table [dbo].[Transactions]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Tax] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (1, 2, 9, 2, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(390.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (2, 3, 17, 10, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2860.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (3, 4, 13, 2, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(572.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (4, 4, 9, 3, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(585.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (5, 5, 13, 2, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(572.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (6, 5, 9, 3, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(585.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (7, 6, 9, 4, CAST(12.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(780.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (8, 6, 24, 3, CAST(9.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(720.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (9, 6, 8, 1, CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(140.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (10, 6, 19, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (11, 7, 13, 2, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(572.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (12, 8, 16, 2, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(572.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (13, 9, 15, 2, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(572.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (14, 10, 17, 2, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(572.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (15, 10, 7, 1, CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (16, 10, 10, 2, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (17, 11, 9, 2, CAST(6.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(390.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (18, 11, 8, 3, CAST(9.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(420.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (19, 11, 25, 3, CAST(9.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(726.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (20, 12, 17, 2, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(572.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (21, 12, 8, 3, CAST(9.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(420.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (22, 13, 13, 2, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(572.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (23, 13, 19, 3, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (24, 13, 21, 3, CAST(6.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (25, 14, 9, 3, CAST(9.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(585.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [InvoiceId], [ItemId], [Quantity], [Discount], [Tax], [Total]) VALUES (26, 14, 22, 2, CAST(6.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2466.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
/****** Object:  Table [dbo].[Titles]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Titles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Titles] ON
INSERT [dbo].[Titles] ([Id], [Name]) VALUES (39, N'Mr.')
INSERT [dbo].[Titles] ([Id], [Name]) VALUES (42, N'Ms.')
INSERT [dbo].[Titles] ([Id], [Name]) VALUES (43, N'Mrs.')
INSERT [dbo].[Titles] ([Id], [Name]) VALUES (44, N'Dr.')
INSERT [dbo].[Titles] ([Id], [Name]) VALUES (56, N'Hon.')
INSERT [dbo].[Titles] ([Id], [Name]) VALUES (62, N'Prof.')
INSERT [dbo].[Titles] ([Id], [Name]) VALUES (70, N'Rev.')
SET IDENTITY_INSERT [dbo].[Titles] OFF
/****** Object:  Table [dbo].[Taxes]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Taxes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[IsIncluded] [bit] NOT NULL,
 CONSTRAINT [PK_Tax] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Taxes] ON
INSERT [dbo].[Taxes] ([Id], [Name], [Value], [IsIncluded]) VALUES (1, N'GST', CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Taxes] ([Id], [Name], [Value], [IsIncluded]) VALUES (2, N'Tax2', CAST(2.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[Taxes] ([Id], [Name], [Value], [IsIncluded]) VALUES (3, N'Tax3', CAST(1.80 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[Taxes] OFF
/****** Object:  Table [dbo].[Rooms]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Occupancy] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DisplayPrice] [decimal](18, 2) NOT NULL,
	[Squarefeet] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Tax] [decimal](18, 2) NOT NULL,
	[VideoUrl] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Rooms] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON
INSERT [dbo].[Rooms] ([Id], [PropertyId], [Name], [Occupancy], [Description], [DisplayPrice], [Squarefeet], [Discount], [Tax], [VideoUrl], [IsActive]) VALUES (1, 30, N'Luxury Room', 1, N'test', CAST(200.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, 1)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
/****** Object:  Table [dbo].[RoomImages]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[ImageDescription] [varchar](100) NOT NULL,
	[ImagePath] [varchar](200) NULL,
	[DefaultImage] [bit] NULL,
 CONSTRAINT [PK_RoomImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RoomImages] ON
INSERT [dbo].[RoomImages] ([Id], [RoomId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (1, 1, N'room1', N'nava.jpg', 0)
INSERT [dbo].[RoomImages] ([Id], [RoomId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (2, 1, N'room3', N'1549407_459350420833021_532166752_n.jpg', 0)
SET IDENTITY_INSERT [dbo].[RoomImages] OFF
/****** Object:  Table [dbo].[RoomFeatures]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomFeatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
 CONSTRAINT [PK_RoomFeatures_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (2, N'Client')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (3, N'Visitor')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (4, N'All')
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[Regions]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Regions] ON
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (1, N'Africa')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (2, N'Asia')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (3, N'Australia & the Pacific')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (4, N'Europe')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (5, N'Middle East')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (6, N'The Americas')
SET IDENTITY_INSERT [dbo].[Regions] OFF
/****** Object:  Table [dbo].[Recommendations]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recommendations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Profession] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[PhotoUrl] [nvarchar](100) NULL,
	[Comments] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Recommendations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Recommendations] ON
INSERT [dbo].[Recommendations] ([Id], [Name], [Profession], [Email], [PhotoUrl], [Comments]) VALUES (1, N'Navaseelan', N'Professor', N'navaseelan4u@gmail.com', N'nava.jpg', N' this is good booking site')
SET IDENTITY_INSERT [dbo].[Recommendations] OFF
/****** Object:  Table [dbo].[PurposeOfVisitings]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurposeOfVisitings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurposeOfVisit] [nvarchar](50) NULL,
 CONSTRAINT [PK_PurposeOfVisiting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PurposeOfVisitings] ON
INSERT [dbo].[PurposeOfVisitings] ([Id], [PurposeOfVisit]) VALUES (1, N'Vacation')
INSERT [dbo].[PurposeOfVisitings] ([Id], [PurposeOfVisit]) VALUES (2, N'Business')
SET IDENTITY_INSERT [dbo].[PurposeOfVisitings] OFF
/****** Object:  Table [dbo].[PropertyImages]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[ImageDescription] [varchar](100) NOT NULL,
	[ImagePath] [varchar](200) NULL,
	[DefaultImage] [bit] NULL,
 CONSTRAINT [PK_PropertyImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyImages] ON
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (2, 1, N'Hall', N'room_0.jpg', 1)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (3, 1, N'Bath room', N'room_1.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (4, 1, N'Bed Room', N'room_2.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (5, 1, N'Room5', N'room_3.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (6, 2, N'Hall', N'house1.jpg', 1)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (7, 3, N'Bath room', N'house2.jpg', 1)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (8, 2, N'Bed Room', N'house3.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (9, 3, N'Room5', N'house4.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (11, 4, N'bed room eww', N'double_room.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (12, 4, N'bed room', N'4.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (15, 24, N'test', N'nava.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (16, 1, N'adad', N'profile_Settai_Movie_Stillse747d8ca14b922571ccfe18f7f2b597a.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (17, 1, N'dasda', N'settai-movie-stills-10.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (18, 1, N'sadasd', N'Tie.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (19, 1, N'asdsad', N'tumblr_lkks2bZqnF1qfrfde.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (20, 1, N'asdsad', N'SuitLook2.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (21, 25, N'fs', N'tumblr_lkks2bZqnF1qfrfde.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (22, 25, N'ererere', N'1557671_447971528637577_1186567984_n.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (23, 25, N'erfgxdggxd', N'400_F_43590884_LVlDmCvv5VH3hUcZieyzmHXcGqr18HMK.jpg', 0)
INSERT [dbo].[PropertyImages] ([Id], [PropertyId], [ImageDescription], [ImagePath], [DefaultImage]) VALUES (24, 30, N'Horakelle', N'demo_image_05.jpg', 0)
SET IDENTITY_INSERT [dbo].[PropertyImages] OFF
/****** Object:  Table [dbo].[PropertyFeatures]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyFeatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
 CONSTRAINT [PK_PropertyFeatures_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Properties]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Properties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[AccommodationType] [int] NOT NULL,
	[AccommodationStandard] [int] NOT NULL,
	[DisplayPrice] [decimal](18, 2) NOT NULL,
	[NoOfRooms] [int] NOT NULL,
	[Squarefeet] [decimal](18, 2) NULL,
	[ActiveFrom] [datetime] NULL,
	[ActiveTo] [datetime] NULL,
	[IsPromotion] [bit] NULL,
	[PromotionDescription] [nvarchar](max) NULL,
	[PromotionAmount] [decimal](18, 2) NULL,
	[PromotionType] [int] NULL,
	[ShowOnSliderBanner] [bit] NULL,
	[ClientId] [int] NULL,
	[Discount] [decimal](18, 2) NULL,
	[Tax] [decimal](18, 2) NULL,
	[Country] [int] NULL,
	[MainCity] [int] NULL,
	[MainCityName] [nvarchar](50) NULL,
	[Adderss] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Street] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[LandLinePrimary] [nvarchar](100) NULL,
	[MobilePrimary] [nvarchar](100) NULL,
	[LandLineSecondary] [nvarchar](50) NULL,
	[MobileSecondary] [nvarchar](50) NULL,
	[ContactPerson1] [nvarchar](100) NULL,
	[ImageName] [nvarchar](100) NULL,
	[MealImage] [nvarchar](100) NULL,
	[ContactPerson2] [nvarchar](100) NULL,
	[Latitude] [decimal](18, 10) NULL,
	[Longitude] [decimal](18, 10) NULL,
	[RouteTo] [nvarchar](500) NULL,
	[MainTown] [nvarchar](100) NULL,
	[DistanceFromMainTown] [decimal](18, 0) NULL,
	[SearchKeys] [varchar](max) NULL,
	[Features] [nvarchar](250) NULL,
	[Interests] [nvarchar](250) NULL,
	[CompanyId] [int] NULL,
	[OwnerDesignation] [nvarchar](100) NULL,
	[AboutOwner] [nvarchar](250) NULL,
	[Location] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[Website] [nvarchar](100) NULL,
	[VideoUrl] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsApproved] [bit] NOT NULL,
	[IsPosted] [bit] NOT NULL,
	[PoliceReport] [nvarchar](100) NULL,
	[GSReport] [nvarchar](100) NULL,
	[RoomRate] [decimal](18, 2) NULL,
	[RoomRateForChild] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Properties] ON
INSERT [dbo].[Properties] ([Id], [Name], [Description], [AccommodationType], [AccommodationStandard], [DisplayPrice], [NoOfRooms], [Squarefeet], [ActiveFrom], [ActiveTo], [IsPromotion], [PromotionDescription], [PromotionAmount], [PromotionType], [ShowOnSliderBanner], [ClientId], [Discount], [Tax], [Country], [MainCity], [MainCityName], [Adderss], [City], [Street], [ZipCode], [Fax], [LandLinePrimary], [MobilePrimary], [LandLineSecondary], [MobileSecondary], [ContactPerson1], [ImageName], [MealImage], [ContactPerson2], [Latitude], [Longitude], [RouteTo], [MainTown], [DistanceFromMainTown], [SearchKeys], [Features], [Interests], [CompanyId], [OwnerDesignation], [AboutOwner], [Location], [Email], [Website], [VideoUrl], [IsActive], [IsApproved], [IsPosted], [PoliceReport], [GSReport], [RoomRate], [RoomRateForChild]) VALUES (30, N'Horakelle Estate', N'this is a nice place to relax..', 0, 0, CAST(1213.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A2C100BF4786 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, 0, NULL, N'Dunagaha', N'Sri lanka', N'qweqwe', NULL, NULL, N'13131414', N'35353536', NULL, NULL, N'seelan', NULL, NULL, NULL, CAST(7.0800000000 AS Decimal(18, 10)), CAST(79.9700000000 AS Decimal(18, 10)), NULL, NULL, NULL, NULL, N'5 luxury guest rooms,michelin star restaurant,rooftop cocktail bar,infinity pool,24 hour front desk staff,free airport pick up/drop off service', NULL, 1, N'', NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Properties] OFF
/****** Object:  Table [dbo].[PointOfInterests]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PointOfInterests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PointOfInterests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PointOfInterests] ON
INSERT [dbo].[PointOfInterests] ([Id], [Name], [IsActive]) VALUES (1, N'Cultural', 1)
INSERT [dbo].[PointOfInterests] ([Id], [Name], [IsActive]) VALUES (2, N'Nature', 1)
INSERT [dbo].[PointOfInterests] ([Id], [Name], [IsActive]) VALUES (3, N'Time & People', 1)
SET IDENTITY_INSERT [dbo].[PointOfInterests] OFF
/****** Object:  Table [dbo].[Places]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[PlaceName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Distance] [decimal](18, 2) NOT NULL,
	[Lat] [decimal](18, 10) NOT NULL,
	[Long] [decimal](18, 10) NOT NULL,
	[TimeTake] [nchar](10) NOT NULL,
	[TravelBy] [int] NOT NULL,
	[PoiId] [int] NOT NULL,
 CONSTRAINT [PK_Places] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Places] ON
INSERT [dbo].[Places] ([Id], [PropertyId], [PlaceName], [Description], [Distance], [Lat], [Long], [TimeTake], [TravelBy], [PoiId]) VALUES (1, 1, N'Viharamaha devi park', NULL, CAST(5.00 AS Decimal(18, 2)), CAST(6.9137482808 AS Decimal(18, 10)), CAST(79.8561859131 AS Decimal(18, 10)), N'20Min     ', 3, 1)
INSERT [dbo].[Places] ([Id], [PropertyId], [PlaceName], [Description], [Distance], [Lat], [Long], [TimeTake], [TravelBy], [PoiId]) VALUES (2, 1, N'Galle face', NULL, CAST(7.00 AS Decimal(18, 2)), CAST(6.9314922144 AS Decimal(18, 10)), CAST(79.8422169685 AS Decimal(18, 10)), N'45Min     ', 5, 1)
INSERT [dbo].[Places] ([Id], [PropertyId], [PlaceName], [Description], [Distance], [Lat], [Long], [TimeTake], [TravelBy], [PoiId]) VALUES (5, 12, N'Siva Temple', NULL, CAST(0.00 AS Decimal(18, 2)), CAST(7.4300000000 AS Decimal(18, 10)), CAST(81.5100000000 AS Decimal(18, 10)), N'1 hr      ', 1, 1)
INSERT [dbo].[Places] ([Id], [PropertyId], [PlaceName], [Description], [Distance], [Lat], [Long], [TimeTake], [TravelBy], [PoiId]) VALUES (6, 5, N'Siva Temple', NULL, CAST(2.00 AS Decimal(18, 2)), CAST(7.1100000000 AS Decimal(18, 10)), CAST(80.8200000000 AS Decimal(18, 10)), N'45        ', 2, 1)
INSERT [dbo].[Places] ([Id], [PropertyId], [PlaceName], [Description], [Distance], [Lat], [Long], [TimeTake], [TravelBy], [PoiId]) VALUES (7, 4, N'test', NULL, CAST(2.00 AS Decimal(18, 2)), CAST(7.1300000000 AS Decimal(18, 10)), CAST(80.4600000000 AS Decimal(18, 10)), N'1 hr      ', 2, 1)
INSERT [dbo].[Places] ([Id], [PropertyId], [PlaceName], [Description], [Distance], [Lat], [Long], [TimeTake], [TravelBy], [PoiId]) VALUES (8, 4, N'test r', NULL, CAST(2.00 AS Decimal(18, 2)), CAST(7.1300000000 AS Decimal(18, 10)), CAST(80.4600000000 AS Decimal(18, 10)), N'1 hr      ', 2, 1)
INSERT [dbo].[Places] ([Id], [PropertyId], [PlaceName], [Description], [Distance], [Lat], [Long], [TimeTake], [TravelBy], [PoiId]) VALUES (9, 14, N'Siva Temple wrqwr', NULL, CAST(4.00 AS Decimal(18, 2)), CAST(6.8700000000 AS Decimal(18, 10)), CAST(79.9400000000 AS Decimal(18, 10)), N'34        ', 3, 1)
INSERT [dbo].[Places] ([Id], [PropertyId], [PlaceName], [Description], [Distance], [Lat], [Long], [TimeTake], [TravelBy], [PoiId]) VALUES (10, 14, N'Test', NULL, CAST(12.00 AS Decimal(18, 2)), CAST(6.9100000000 AS Decimal(18, 10)), CAST(79.8600000000 AS Decimal(18, 10)), N'1 hr      ', 3, 1)
INSERT [dbo].[Places] ([Id], [PropertyId], [PlaceName], [Description], [Distance], [Lat], [Long], [TimeTake], [TravelBy], [PoiId]) VALUES (11, 24, N'etssdasfuads', NULL, CAST(12.00 AS Decimal(18, 2)), CAST(6.9700000000 AS Decimal(18, 10)), CAST(79.9900000000 AS Decimal(18, 10)), N'45        ', 3, 1)
INSERT [dbo].[Places] ([Id], [PropertyId], [PlaceName], [Description], [Distance], [Lat], [Long], [TimeTake], [TravelBy], [PoiId]) VALUES (12, 14, N'Siva Temple', N'eerwe rr werewr ', CAST(33.00 AS Decimal(18, 2)), CAST(6.9400000000 AS Decimal(18, 10)), CAST(80.0300000000 AS Decimal(18, 10)), N'45        ', 3, 1)
SET IDENTITY_INSERT [dbo].[Places] OFF
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentTypes](
	[Id] [int] NOT NULL,
	[PayBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PaymentTypes] ([Id], [PayBy]) VALUES (1, N'Cash')
INSERT [dbo].[PaymentTypes] ([Id], [PayBy]) VALUES (2, N'Paypal')
INSERT [dbo].[PaymentTypes] ([Id], [PayBy]) VALUES (3, N'Credit Card')
/****** Object:  Table [dbo].[PasswordResetTokens]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordResetTokens](
	[TokenId] [int] IDENTITY(1,1) NOT NULL,
	[EncryptedForm] [nvarchar](max) NULL,
 CONSTRAINT [PK_PasswordResetTokens] PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[IsRead] [bit] NOT NULL,
	[Company] [nvarchar](max) NULL,
	[Weblink] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](100) NOT NULL,
	[Url] [nvarchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsParent] [bit] NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Menus] ON
INSERT [dbo].[Menus] ([Id], [MenuName], [Url], [IsActive], [IsParent]) VALUES (2, N'Add Category', N'url', 1, 0)
INSERT [dbo].[Menus] ([Id], [MenuName], [Url], [IsActive], [IsParent]) VALUES (3, N'Add Items', N'url', 1, 0)
INSERT [dbo].[Menus] ([Id], [MenuName], [Url], [IsActive], [IsParent]) VALUES (4, N'Create Users', N'url', 1, 0)
INSERT [dbo].[Menus] ([Id], [MenuName], [Url], [IsActive], [IsParent]) VALUES (5, N'Assign Permission', N'url', 1, 0)
INSERT [dbo].[Menus] ([Id], [MenuName], [Url], [IsActive], [IsParent]) VALUES (6, N'Delete Customer', N'url', 1, 0)
INSERT [dbo].[Menus] ([Id], [MenuName], [Url], [IsActive], [IsParent]) VALUES (7, N'Accept Returns', N'url', 1, 0)
SET IDENTITY_INSERT [dbo].[Menus] OFF
/****** Object:  Table [dbo].[MainCities]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainCities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[Latitude] [decimal](18, 10) NULL,
	[Longitude] [decimal](18, 10) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_MainCities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MainCities] ON
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (1, N'Ampara', 1, CAST(7.2833000000 AS Decimal(18, 10)), CAST(81.6667000000 AS Decimal(18, 10)), N'Ampara (Sinhala: අම්පාර, Tamil: அம்பாறை) is the main town of Ampara District, governed by an Urban Council. It''s located in the Eastern Province, Sri Lanka, about 360 km from the capital city of Colombo. It was a part of the domain of Kavantissa (2nd century BCE) and was then known as "Ambaragama", which over the years changed to Ambara to Ampara.[citation needed]Most of the civilians in the town are Sinhala. In 2001, there were 20,152 people in the town limit and 96% of them were Sinhalese. Buddhism was the predominant religion, practiced by 93%. This was a hunters'' resting place during British colonial days (late 1890s and early 1900). During the development of the Galoya scheme from 1949 by the late Prime Minister D.S. Senanayake, Ampara was transformed into a town. Initially it was the residence for the construction workers of Inginiyagala Dam. Later it became the main administrative town of the Galoya Valley.')
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (2, N'Anuradhapura', 1, CAST(8.3138540000 AS Decimal(18, 10)), CAST(80.4164030000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (3, N'Badulla', 1, CAST(6.9838740000 AS Decimal(18, 10)), CAST(81.0569570000 AS Decimal(18, 10)), N'nf utiutituij')
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (4, N'Batticaloa', 1, CAST(7.7156810000 AS Decimal(18, 10)), CAST(81.7000870000 AS Decimal(18, 10)), N' twtwetewtew ew  trjtrer trrertre yy trrter utr re tryer reter tert u rtut turyiytiyur  eueue')
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (5, N'Colombo', 1, CAST(6.9265920000 AS Decimal(18, 10)), CAST(79.8602630000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (6, N'Galle', 1, CAST(6.0325280000 AS Decimal(18, 10)), CAST(80.2189060000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (7, N'Gampaha', 1, CAST(7.0878781426 AS Decimal(18, 10)), CAST(80.0125808688 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (8, N'Hambantota', 1, CAST(6.1234500000 AS Decimal(18, 10)), CAST(81.1210300000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (9, N'Jaffna', 1, CAST(9.6661220000 AS Decimal(18, 10)), CAST(80.0082780000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (10, N'Kalutara', 1, CAST(6.5792240000 AS Decimal(18, 10)), CAST(79.9647290000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (11, N'Kandy', 1, CAST(7.2836590000 AS Decimal(18, 10)), CAST(80.6381030000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (12, N'Kegalle', 1, CAST(7.1204053000 AS Decimal(18, 10)), CAST(80.3213106000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (13, N'Kilinochchi', 1, CAST(9.3802886000 AS Decimal(18, 10)), CAST(80.3769999000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (14, N'Kurunegala', 1, CAST(7.4833333000 AS Decimal(18, 10)), CAST(80.3666667000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (15, N'Mannar', 1, CAST(8.8360396000 AS Decimal(18, 10)), CAST(80.0534923000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (16, N'Matale', 1, CAST(7.4678170000 AS Decimal(18, 10)), CAST(80.6241530000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (17, N'Matara', 1, CAST(5.9493050000 AS Decimal(18, 10)), CAST(80.5353470000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (18, N'Moneragala', 1, CAST(6.8746198061 AS Decimal(18, 10)), CAST(81.3674926758 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (19, N'Mullaitivu', 1, CAST(9.2670911000 AS Decimal(18, 10)), CAST(80.8142480000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (20, N'Nuwara Eliya', 1, CAST(6.9656650000 AS Decimal(18, 10)), CAST(80.7862470000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (21, N'Polonnaruwa', 1, CAST(7.9328570000 AS Decimal(18, 10)), CAST(81.0080870000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (22, N'Puttalam', 1, CAST(8.0344930000 AS Decimal(18, 10)), CAST(79.8356290000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (23, N'Ratnapura', 1, CAST(6.6930440000 AS Decimal(18, 10)), CAST(80.3861470000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (24, N'Trincomalee', 1, CAST(8.5696120000 AS Decimal(18, 10)), CAST(81.2331250000 AS Decimal(18, 10)), NULL)
INSERT [dbo].[MainCities] ([Id], [City], [IsActive], [Latitude], [Longitude], [Description]) VALUES (25, N'Vavuniya', 1, CAST(8.7546480000 AS Decimal(18, 10)), CAST(80.4945950000 AS Decimal(18, 10)), NULL)
SET IDENTITY_INSERT [dbo].[MainCities] OFF
/****** Object:  Table [dbo].[Locations]    Script Date: 02/01/2014 22:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Region_Id] [int] NULL,
	[Country_Id] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Country_Id] ON [dbo].[Locations] 
(
	[Country_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Region_Id] ON [dbo].[Locations] 
(
	[Region_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF_Invoices_CompanyId]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF_Invoices_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_Invoices_PaymentMade]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF_Invoices_PaymentMade]  DEFAULT ((0)) FOR [PaymentMade]
GO
/****** Object:  Default [DF_Invoices_Commision]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF_Invoices_Commision]  DEFAULT ((0)) FOR [Commision]
GO
/****** Object:  Default [DF_Features_IsActive]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Features] ADD  CONSTRAINT [DF_Features_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Features_DisplayOrder]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Features] ADD  CONSTRAINT [DF_Features_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_Features_GroupId]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Features] ADD  CONSTRAINT [DF_Features_GroupId]  DEFAULT ((1)) FOR [GroupId]
GO
/****** Object:  Default [DF_FeatureCategories_DisplayOrder]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[FeatureCategories] ADD  CONSTRAINT [DF_FeatureCategories_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_Designations_DisplayOrder]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Designations] ADD  CONSTRAINT [DF_Designations_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_Cuisines_DisplayOrder]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Cuisines] ADD  CONSTRAINT [DF_Cuisines_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_CompanyProfile_CreatedBy]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[CompanyProfiles] ADD  CONSTRAINT [DF_CompanyProfile_CreatedBy]  DEFAULT ((1)) FOR [CreatedBy]
GO
/****** Object:  Default [DF_Companies_GrousId]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Companies] ADD  CONSTRAINT [DF_Companies_GrousId]  DEFAULT ((0)) FOR [GroupId]
GO
/****** Object:  Default [DF_BannerImages_DisplayOrder]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[BannerImages] ADD  CONSTRAINT [DF_BannerImages_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_AccommodationTypes_IsActive]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[AccommodationTypes] ADD  CONSTRAINT [DF_AccommodationTypes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_AccommodationTypes_DisplayOrder]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[AccommodationTypes] ADD  CONSTRAINT [DF_AccommodationTypes_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_AccommodationStandards_IsActive]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[AccommodationStandards] ADD  CONSTRAINT [DF_AccommodationStandards_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_AccommodationStandards_DisplayOrder]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[AccommodationStandards] ADD  CONSTRAINT [DF_AccommodationStandards_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_TravelBies_DisplayOrder]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[TravelBies] ADD  CONSTRAINT [DF_TravelBies_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_Rooms_PropertyId]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF_Rooms_PropertyId]  DEFAULT ((0)) FOR [PropertyId]
GO
/****** Object:  Default [DF_Rooms_Occupancy]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF_Rooms_Occupancy]  DEFAULT ((1)) FOR [Occupancy]
GO
/****** Object:  Default [DF_Rooms_DisplayPrice]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF_Rooms_DisplayPrice]  DEFAULT ((0)) FOR [DisplayPrice]
GO
/****** Object:  Default [DF_Rooms_Squarefeet]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF_Rooms_Squarefeet]  DEFAULT ((0)) FOR [Squarefeet]
GO
/****** Object:  Default [DF_Rooms_Discount]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF_Rooms_Discount]  DEFAULT ((0)) FOR [Discount]
GO
/****** Object:  Default [DF_Rooms_Tax]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF_Rooms_Tax]  DEFAULT ((0)) FOR [Tax]
GO
/****** Object:  Default [DF_Room_IsActive]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF_Room_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Property_PromotionAmount]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Properties] ADD  CONSTRAINT [DF_Property_PromotionAmount]  DEFAULT ((0)) FOR [PromotionAmount]
GO
/****** Object:  Default [DF_Property_PromotionType]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Properties] ADD  CONSTRAINT [DF_Property_PromotionType]  DEFAULT ((1)) FOR [PromotionType]
GO
/****** Object:  Default [DF_Property_ShowOnSliderBanner]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Properties] ADD  CONSTRAINT [DF_Property_ShowOnSliderBanner]  DEFAULT ((1)) FOR [ShowOnSliderBanner]
GO
/****** Object:  Default [DF_Property_IsActive]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Properties] ADD  CONSTRAINT [DF_Property_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Properties_IsApproved]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Properties] ADD  CONSTRAINT [DF_Properties_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
/****** Object:  Default [DF_Properties_IsPosted]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Properties] ADD  CONSTRAINT [DF_Properties_IsPosted]  DEFAULT ((0)) FOR [IsPosted]
GO
/****** Object:  Default [DF_PointOfInterests_IsActive]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[PointOfInterests] ADD  CONSTRAINT [DF_PointOfInterests_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Places_PoiId]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Places] ADD  CONSTRAINT [DF_Places_PoiId]  DEFAULT ((1)) FOR [PoiId]
GO
/****** Object:  Default [DF_MainCities_IsActive]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[MainCities] ADD  CONSTRAINT [DF_MainCities_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  ForeignKey [FK_Locations_Regions_Region_Id]    Script Date: 02/01/2014 22:16:57 ******/
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Regions_Region_Id] FOREIGN KEY([Region_Id])
REFERENCES [dbo].[Regions] ([Id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Regions_Region_Id]
GO
