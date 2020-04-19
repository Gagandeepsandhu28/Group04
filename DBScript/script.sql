USE [master]
GO
/****** Object:  Database [Week6DB]    Script Date: 4/19/2020 3:25:08 PM ******/
CREATE DATABASE [Week6DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Week6DB', FILENAME = N'D:\rdsdbdata\DATA\Week6DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Week6DB_log', FILENAME = N'D:\rdsdbdata\DATA\Week6DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Week6DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Week6DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Week6DB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Week6DB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Week6DB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Week6DB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Week6DB] SET ARITHABORT ON 
GO
ALTER DATABASE [Week6DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Week6DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Week6DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Week6DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Week6DB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Week6DB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Week6DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Week6DB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [Week6DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Week6DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Week6DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Week6DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Week6DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Week6DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Week6DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Week6DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Week6DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Week6DB] SET RECOVERY FULL 
GO
ALTER DATABASE [Week6DB] SET  MULTI_USER 
GO
ALTER DATABASE [Week6DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Week6DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Week6DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Week6DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Week6DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Week6DB] SET QUERY_STORE = OFF
GO
USE [Week6DB]
GO
/****** Object:  User [dba]    Script Date: 4/19/2020 3:25:09 PM ******/
CREATE USER [dba] FOR LOGIN [dba] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dba]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin_config]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_config](
	[config_id] [int] NULL,
	[config_userid] [varchar](50) NULL,
	[config_pwd_hash] [varchar](max) NULL,
	[config_pwd_salt] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [varchar](255) NULL,
	[ContactSubject] [varchar](255) NULL,
	[ContactEmail] [varchar](255) NULL,
	[ContactMessage] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delivery_register]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery_register](
	[delivery_id] [int] IDENTITY(100,1) NOT NULL,
	[delivery_login_id] [varchar](255) NULL,
	[delivery_pwd_hash] [varchar](max) NULL,
	[delivery_pwd_salt] [varchar](max) NULL,
	[delivery_user_firstname] [varchar](255) NULL,
	[delivery_user_lastname] [varchar](255) NULL,
	[delivery_user_address] [varchar](255) NULL,
	[delivery_user_city] [varchar](255) NULL,
	[delivery_user_province] [varchar](255) NULL,
	[delivery_user_postalcode] [varchar](10) NULL,
	[delivery_user_phoneno] [varchar](25) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pizza_cart]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pizza_cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[cart_session_id] [varchar](250) NULL,
	[cart_menu_id] [int] NULL,
	[cart_store_id] [int] NULL,
	[cart_menu] [varchar](255) NULL,
	[cart_qty] [int] NULL,
	[cart_menu_price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pizza_store]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pizza_store](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [varchar](250) NULL,
	[store_image] [varchar](250) NULL,
	[store_delivery_time] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pizza_store_menu]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pizza_store_menu](
	[pizza_menu_id] [int] IDENTITY(1,1) NOT NULL,
	[pizza_store_id] [int] NULL,
	[pizza_menu] [varchar](75) NULL,
	[pizza_menu_description] [varchar](250) NULL,
	[pizza_menu_price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_login]    Script Date: 4/19/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_login](
	[tbl_id] [int] IDENTITY(1,1) NOT NULL,
	[user_login_id] [varchar](50) NULL,
	[user_login_pwd] [varchar](100) NULL,
	[user_login_role] [varchar](25) NULL,
	[user_email_id] [varchar](50) NULL,
	[user_phone_no] [varchar](20) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[admin_config] ([config_id], [config_userid], [config_pwd_hash], [config_pwd_salt]) VALUES (1, N'admin', N'ygan3Pe4mlnH5lG0ZdvzpFY/ouODmMQG+iOg2WoJCYLgsIoXUC2tUrTQKXAY3A3ssgR+3n7Jplwa6vGv+omnhgiZJr4Be9mEwVAYr5IyWxYz0Oy+Z+lagtyql+QethJSo3ziKDDflv7dcleF85Hl1ZXdswZnT+FcP1wPL+onXGBujFl6egCAXgKJox4/iK9sk2kAs9NDhiTwbNiAOBl9lmvQv+UCbizfPTWQWkfVkRQyY8B2OpexaTt1jkCLwZkh/0JcZ/pa4tX/iDZA8RBjk6/RQcFQ74wwlitWhM+X9yJolBQ6qX8/s3OQaEyU0cOtfS5TkyOVLaRY16sRt/x4ZA==', N'toPA/PERLRiLzaTUppBPE5OrFf3StjN99xo9N49h7mGXQFVZXoljBruO2Emt2kJy0EOWMIy2671g5FAfS/X5Kg==')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0a312930-7161-495c-b32a-debca8073800', N'gagan_abc@gmail.com', N'GAGAN_ABC@GMAIL.COM', N'gagan_abc@gmail.com', N'GAGAN_ABC@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOn7UfKyUxMxUgIOIF89+NRykEvClMxgOLAxNKQjk44yYNpilh2DHSWuW7qjAFJbQw==', N'WRUB5ADJ5LF6IF4NBKNNT33HWAKLYDXM', N'cb1cce54-8d42-46d8-8e28-f49e3133b3a1', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0e44e658-e363-4210-a0f1-2ee4a9f250f6', N'sjagani3229@conestogac.on.ca', N'SJAGANI3229@CONESTOGAC.ON.CA', N'sjagani3229@conestogac.on.ca', N'SJAGANI3229@CONESTOGAC.ON.CA', 1, N'AQAAAAEAACcQAAAAEN2t1sqXmmBM9O32PZ82oCWMDgUjzvB8WiPa1bpSfzyS/QfSenyI1kGHAzHlFIj56Q==', N'NBKIKIAOYLIY4JRRANCTU4WK2DL2PNM5', N'd39b7bfc-6da3-4448-8c4e-e4d4abef221a', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'67b87db8-b285-4314-8da8-ba6967da5133', N'snjagani110@gmail.com', N'SNJAGANI110@GMAIL.COM', N'snjagani110@gmail.com', N'SNJAGANI110@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEHScQEU16HwbzbZSTVveoB5E2xXuD+mAkTQnZkSJ7HvB76oIZNats/EEQ0lQron0Dg==', N'YPOF5WQAMD2WOIXOOJBKEMYKA3AA3TNT', N'04ac16d1-c704-4b22-a429-3ba42c900d7a', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd40a2927-5d5d-4713-8d69-0fbd3f85fd31', N'gagan_abc1@gmail.com', N'GAGAN_ABC1@GMAIL.COM', N'gagan_abc1@gmail.com', N'GAGAN_ABC1@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEB6JNeQrA7qLOu2hIKU1Ake0/gK59YYWk1bswxX3AYy6Sd3oKI7ZJTv68qWGR6c+eA==', N'RANAR74GJSBCOLLRUIGHPAJGMMVFFNMC', N'7a407041-cd18-45d4-9eab-0e10a24dbcaf', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[ContactUs] ON 
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (1, N'Sibtain Jagani', N'Test Data 2', N'sjagani3229@conestogac.on.ca', N'5555')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (2, N'Sibtain Jagani', N'Test Message 22 ', N'sjagani3229@conestogac.on.ca', N'sccc')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (3, N'Sibtain Jagani', N'Best Product Advice Requried', N'sjagani3229@conestogac.on.ca', N'skkk')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (4, N'Sibtain Jagani', N'Test Message - Sibtain', N'sjagani3229@conestogac.on.ca', N'kkkk')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (5, N'Sibtain Jagani', N'Test Data 2', N'sjagani3229@conestogac.on.ca', N'llll')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (6, N'Sibtain Jagani', N'asd', N'sjagani3229@conestogac.on.ca', N'sfsdf - now')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (7, N'Sibtain Jagani - 222', N'asdf 333', N'sjagani3229@conestogac.on.ca', N'Test Idiot')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (8, N'ada', N'KKKK', N'sibtain.bca@gmaiL.com', N'KKKK')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (9, N'Sibtain Jagani', N'Test Message', N'sjagani3229@conestogac.on.ca', N',,lll')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (10, N'Sibtain Jagani', N'asdf 333', N'sjagani3229@conestogac.on.ca', N'kkk')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (11, N'Sibtain Jagani', N'asdf 333', N'sjagani3229@conestogac.on.ca', N'kkk')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (12, N'Sibtain Jagani', N'Test Data 2', N'sjagani3229@conestogac.on.ca', N'kkk')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (13, N'Sibtain Jagani', N'Test Data 2', N'sjagani3229@conestogac.on.ca', N'lkk')
GO
INSERT [dbo].[ContactUs] ([Id], [ContactName], [ContactSubject], [ContactEmail], [ContactMessage]) VALUES (14, N'Sib', N'Hi', N'sjagani3229@conestogac.on.ca', N'Tes')
GO
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
GO
SET IDENTITY_INSERT [dbo].[delivery_register] ON 
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (100, N'sibtain.bca@gmail.com', N'Tu7cvmpBsQQoVQNa1yr4uc4wkDPProZqIHDrzupQqWCIUQ0XsHFKFglxqjTfjt3hcfGjMQ+g4mBrKVacmgbfCTN/+MFUFIi75v64uiv/hMLPmKLmELNXxHRvnWHaMvy+/My3FkrHz1SdDQ7Be0XGs7tTaG4J7Bu4sDdOosORb63yFZ8uvN7bo27BJ4SnvZxpt6hAvCWEBMO267LG9JAmJ1Uok84MFEop8Tn42fbxkA9L2U691ba3UE7mEX5+1pzdnh31eekT58o2qaX+yf07dQqXchITvZ8OCjV1YWgM0QmqwO6ypyKLoYuOXmvjFTU8zc3aM/+kEzkh4cRn18mWCQ==', N'F687XPZpdrOaHYbZB0q1E3P0X1QgRJFlckmaUmAriQ+wZAIugdi7Q/zVW1vXnIdl2mAOXnb9pNqXR0OYr7Nd9w==', N'Sibtain', N'Jagani', N'69 Cardill Crescent', N'Waterloo', N'Ontario', N'N2L 3Y7', N'2267513612')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (101, N'sibtain.bca1@gmail.com', N'gA0uAdHqSWBTDoZYfTaaddOkGaNfnzd6HaWd5JRjOiH43FUgNSwiIULwY2kGQONkS4O1xdz8m8+zZxV+zcc56QygLxTnTeVplZ/SQjwlejJ/nh8RXs+omaZb1DDVepQd0plMQ+RPaETvN3V4CrvzM4la2kb0ylmx2+XakOgFFRU9HBs4QrbLaGSA7cmEBmS4zdYfWnAT5Dv24n7pCyZ+pcHw+pP76YaQXaTpSHQuJzXd6IpHsfRtIstt2U6GNqOie0JKWafD6FyM5+3636kvXWuqn3zoV8qMKo3DtI0WIjwsTd/Z6CESdvNLJzfU8UrTuGf6MzbxQNh0euGtOepZIQ==', N'0fi32Y1t9zlxt/6oE++J2lmGxEAV75IrgPY51RM/dRkzkwqrjSlREVLNA3o0oKPv2epr6HmHR+9Bb7TlbAwOfw==', N'kkj', N'kkk', N'69 Cardill Crescent', N'', N'Ontario', N'N2L 3Y7', N'2267513612')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (102, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (103, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (104, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (105, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (106, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (107, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (108, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (109, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (110, N'gagan@gmail.com', N'Q17ae6KvnhchgfxgxSU76yjJCsVV4MWVR+Cb7bCI/rvDGMhJc+craKWO138dVxGiryaJbJMjAmBs0gbV7b8tk70FLhHfWXzyaQoslzLNhAB8N6UrJV9Ty6MQcdnt0SYP8VCQqQ9HQSZiCYz9T/4A0BxGMJghSAXXKriEHfM7aRvmX53mooBpTT9Xsbq0vPtB156tVVeY9lpy8NXkig+bD7YpqvUjCEl67LDb8j3Q2PPZIrXjNHgLQBndGQBUydVgbS78clHQoP+xNiN2HBGSWXZOVU45hOdtTmfdjvGQhEBtPyUjgL84qsAQmvlpFk2730982OFS/SD6afcGxUi+lg==', N'Nwx3tknhfZN4hQO9rc/YiCECV108kZaBGPyxKRALU7UfzE2/kA9LiDJrUb3QHjtRgePobRiipme3zvL9yqihrg==', N'Gagan', N'Sandhu', N'54 Shady Glen Street', N'Kitchener', N'ON', N'N25 TG6', N'3678764577')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (111, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (112, N'gagan1@gmail.com', N'TE2N3OCLoXsEJ1idD3Xf4d1NwaymkIJzEFkkbGTtccqS/kznUmCTx93DIaKgINifQQ/9ToBP4jAgipS+X7RIJ/4BDraNW3Y45NizAkxfM0ULZBDmoD/G06Mqwru3ewwTP+KQal3W43aOKsony4o/Tit7qld4fBSSG2rJTDJASHFQVcYPB3kN6PnTrZsMXdFlefRA4m+Z7Hv8E5Pm4/A45/VXzBSFxoTVZfSss0T7hmHoRijvo0CmlL/UBl2INCB+biBNjYkwJFcszHaV/8Qc/0nhfsd9ODmN1Ku8fBHjHFh7MAdqSKqUlbppP7vd07g+L4ICHmxxztWEfY3dA6X2WQ==', N'cOMbf71xzEwVMpUvnFr5wuDIRQG0aWmOm4ulLjdap2FPdsfPOdSBBUsn2EMTy3Aesa/x3jh5Fj6EdAtyk5dYbA==', N'Gagan1', N'Sidhu', N'11 Ella Street', N'Kitchener', N'ON', N'N25 67T', N'6794569900')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (113, N'gagan12@gmail.com', N'C1Pp3GomdC45GYJjhZkMFKbvTIvK/DYZ08lvfMIGU/9VuObeZvY1xO/sBkAKbrRHeZCMIglVXFJbi3OZDYY9CP69XXr0r6fPSb3PmKpAhz9mrutxU69nC+CprRfP9yq2MUZAMwmhNfI4mUPHuBm6qKzDukZzQ4Uhi4L02KZ3Syh3KZdhzi2u9lon2Ax/Z2XC/ojYgY7Iq7hMbhVEV+ULdmSlk5JbhVwdnnjOrSVrMPW/vDMzkPOnHUQdZwwzF534F1qera0TdgTc5u9t+t0NYlioRmL+Ziu3j2C7M45Rv1mg5V8yj8Er4+KoQmZHoK1gmGgP0UpWIPAagY43eflIiw==', N'znnsFdSrBGxqJb411k1A3MV/3WBGOuZ1EdHvpLFJXaACxMvy4f6v+0YG7g1J8XFLXTUD7zhGWGFPXexb6bdzdw==', N'Gagan1', N'Sidhu', N'', N'Kitchener', N'ON', N'N4R9H7', N'6794569900')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (114, N'gagan123@gmail.com', N'fvfrPHcDID+ZsBP8neX5g2+nEIwdny9LjNrZaJobuvD2bTdC7BNJExAm58zlZzq7l9EDefoR3TJXOd+uwIzSPIi8g7WPgwFZlk4AZ1J8pSjh7hCotZmfdTtDwApuka8CaBU1tf/y/qsfx+WeU1EAQJxYiKTe31QLxw09lelwvQ0poHhinCdPDd1DbDINVf7tCy3qobyfZArx60ZQGemnBycgNiP4ggp+4+xhiAn62IaobSN5xjWxx1KECeYrldGAbeUZYFDoSy/TlRyuLH7ddkaTVqlSWnMJ2/cB3KIxXrjlEBg1WpwwrvJwWh9TmsvYBklxV70LsuH3dwL4IrFpng==', N'Kyg9WaHMGJtWL62CoXuAQTfzG5bFysXbosOkynC0xntxinqBDTn6k/qfpoQ7hT45ad0bHKcLsFXlK8tn/19V9w==', N'Gagan1', N'Sidhu', N'', N'Kitchener', N'ON', N'N4R9H7', N'hhhh')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (115, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (116, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (117, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (118, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (119, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (120, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (121, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (122, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (123, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (124, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (125, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (126, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (127, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (128, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
INSERT [dbo].[delivery_register] ([delivery_id], [delivery_login_id], [delivery_pwd_hash], [delivery_pwd_salt], [delivery_user_firstname], [delivery_user_lastname], [delivery_user_address], [delivery_user_city], [delivery_user_province], [delivery_user_postalcode], [delivery_user_phoneno]) VALUES (129, N'pramodjat@gmail.com', N'Hash', N'Salt', N'Pramod', N'', N'Address555', N'Waterloo', N'Ontario', N'MXE6555', N'545454')
GO
SET IDENTITY_INSERT [dbo].[delivery_register] OFF
GO
SET IDENTITY_INSERT [dbo].[pizza_cart] ON 
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (1, N'00000000-0000-0000-0000-000000000000', 3, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (2, N'79163306-fb23-4ed1-8357-723f01a855a3', 4, 0, N'Small Pizza (6 Slices) (10")', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (3, N'79163306-fb23-4ed1-8357-723f01a855a3', 5, 0, N'Medium Pizza (8 Slices) (12")', 1, 10.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (4, N'5008c7e0-7b6f-4fdc-99d1-ec6539579404', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (5, N'5008c7e0-7b6f-4fdc-99d1-ec6539579404', 11, 1, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (6, N'81bdb538-4b9c-44b6-b84f-24aa8666acd8', 10, 1, N'Small Pizza (6 Slices) (10")', 2, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (7, N'81bdb538-4b9c-44b6-b84f-24aa8666acd8', 11, 1, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (8, N'43b49383-1c38-4296-9bb8-58074cc6032a', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (9, N'4e21e55b-328a-475c-afcb-d5c9e085b536', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (10, N'667d8121-2d58-4d04-a728-52ac3c586105', 9, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (11, N'2a11c4e0-0742-4dac-b330-217759d11266', 3, 0, N'Small Pizza (6 Slices) (10")', 2, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (12, N'2a11c4e0-0742-4dac-b330-217759d11266', 8, 0, N'Large Pizza (10 Slices) (14")', 1, 13.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (13, N'614fc66b-35d7-4425-b584-2f495e7f1037', 4, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (14, N'eb60cbfc-4d7a-4133-ba41-1519a87cebd1', 9, 1, N'Small Pizza (6 Slices) (10")', 2, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (15, N'eb60cbfc-4d7a-4133-ba41-1519a87cebd1', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (16, N'88ea0f43-5ddc-4b16-abeb-275a5aee8a55', 4, 0, N'Small Pizza (6 Slices) (10")', 2, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (17, N'88ea0f43-5ddc-4b16-abeb-275a5aee8a55', 5, 0, N'Medium Pizza (8 Slices) (12")', 1, 10.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (18, N'b1e7a664-4ceb-4a6c-a43e-549b38a94280', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (19, N'b1e7a664-4ceb-4a6c-a43e-549b38a94280', 14, 1, N'Large Pizza (10 Slices) (14")', 1, 13.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (20, N'5878917e-7d2a-4b74-8f47-dbbe7ce4b2c6', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (21, N'5878917e-7d2a-4b74-8f47-dbbe7ce4b2c6', 11, 1, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (22, N'2a21c093-5244-4902-a39d-8cd33f2ab757', 9, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (23, N'2a21c093-5244-4902-a39d-8cd33f2ab757', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (24, N'2a21c093-5244-4902-a39d-8cd33f2ab757', 11, 1, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (25, N'1d0f6c79-fe4a-4b72-a1e6-0705397e8b85', 3, 0, N'Small Pizza (6 Slices) (10")', 3, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (26, N'86922bb7-1c51-4dbf-a0b5-938fe73c61bf', 9, 1, N'Small Pizza (6 Slices) (10")', 2, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (27, N'233679fc-72a0-49de-a4b3-3a0c42c51aa5', 9, 1, N'Small Pizza (6 Slices) (10")', 2, 18.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (28, N'5357f31d-33d8-4320-903d-c842d59d272d', 10, 1, N'Small Pizza (6 Slices) (10")', 2, 18.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (29, N'5357f31d-33d8-4320-903d-c842d59d272d', 9, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (30, N'5357f31d-33d8-4320-903d-c842d59d272d', 11, 1, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (31, N'07f48e20-9a4e-40bd-a04d-49ae477fc418', 10, 1, N'Small Pizza (6 Slices) (10")', 2, 18.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (33, N'14569694-ae63-44a1-81f5-8c83737de92d', 3, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (34, N'f659b890-0d1c-4d08-be67-a1286abf6b21', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (35, N'b8efb4eb-38a5-47f6-a13b-d1f38c28fdb9', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (36, N'3655f76c-fb8b-4e4a-ac9a-8e3e06e4cccd', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (37, N'224575af-6c21-4655-b397-703c4da39fe6', 11, 1, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (38, N'0b2c828f-1896-44c1-bc58-61a507ca83bb', 10, 1, N'Small Pizza (6 Slices) (10")', 2, 18.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (39, N'f9eb609c-216b-4dab-a475-4370fc855ce0', 9, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (40, N'7b6f0c8c-950e-4639-82ac-adf40cb14b5a', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (41, N'd817cdce-d9be-4460-be20-ddec98336c8f', 4, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (42, N'0a9d2b61-3131-4af4-88d3-c817bb9df480', 9, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (43, N'b0c9a6a4-705b-4736-a311-57b0765bef31', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (44, N'b0c9a6a4-705b-4736-a311-57b0765bef31', 13, 1, N'Large Pizza (10 Slices) (14")', 1, 13.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (45, N'ef62a2bd-dae7-43ff-b06a-41cc4f243640', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (46, N'720f193f-a7b1-44b3-b4b3-2f951e9a4a09', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (47, N'720f193f-a7b1-44b3-b4b3-2f951e9a4a09', 11, 1, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (48, N'7d89af30-0ce2-4067-8075-7a9ae8e71b21', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (49, N'7d89af30-0ce2-4067-8075-7a9ae8e71b21', 11, 1, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (50, N'fef41d15-9140-4ac9-be23-3cc8bfd978a9', 4, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (51, N'fef41d15-9140-4ac9-be23-3cc8bfd978a9', 5, 0, N'Medium Pizza (8 Slices) (12")', 1, 10.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (52, N'fef41d15-9140-4ac9-be23-3cc8bfd978a9', 6, 0, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (53, N'74f765d3-18f8-497c-b7c6-41aa6ac9cb23', 13, 1, N'Large Pizza (10 Slices) (14")', 1, 13.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (54, N'74f765d3-18f8-497c-b7c6-41aa6ac9cb23', 11, 1, N'Medium Pizza (8 Slices) (12")', 2, 22.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (55, N'bb467c7e-ce2a-4fb8-b748-254f015c2e5c', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (56, N'bb467c7e-ce2a-4fb8-b748-254f015c2e5c', 11, 1, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (57, N'a374295b-0c4c-4dad-9de7-6ecfb69e3a58', 3, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (58, N'fbd4cbf1-73ad-4cd3-a006-e763b281f45e', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (59, N'fbd4cbf1-73ad-4cd3-a006-e763b281f45e', 11, 1, N'Medium Pizza (8 Slices) (12")', 1, 11.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (60, N'e765c918-df49-48e5-9a1a-2ba9f86d9a76', 3, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (61, N'610a0d6d-7dfa-4182-9dc1-253cb4ef5bad', 3, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (62, N'12fc0845-b561-4c20-8fa3-976ef82a7f26', 3, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (63, N'a0bbcf2b-50fc-449c-8093-d9c6ec18097e', 3, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (64, N'7faaa1ef-f01b-43b1-80c5-95f6bb834dd5', 16, 2, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (65, N'6c893640-70b3-4b81-8be5-c4037ddf34ab', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (66, N'b24fc353-089c-4cd0-94fc-f55f2d20a830', 4, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (67, N'84d13b65-c8c6-492e-ab8b-0a266e2e8a71', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (68, N'cfc159fe-4db0-412e-a45a-dc4ca2a2d220', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (69, N'6ba52fe5-45b0-4aa6-afd9-487213c7a4e5', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (70, N'cf3d6e36-0f36-46fe-a7f9-31fa355ceb16', 3, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (72, N'6ba52fe5-45b0-4aa6-afd9-487213c7a4e5', 16, 2, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (73, N'ab80cb06-1b7a-42ac-aa41-65793327f639', 4, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (74, N'8472a5d5-1c90-497a-bdfc-fcaf6ec48a2e', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (75, N'1fa243fa-f810-4ec1-a5db-49d8c2f6812f', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (76, N'dca142d5-85f2-4791-875b-1e983e569498', 10, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (77, N'901ff088-77c7-4430-9af6-886076cc886b', 9, 1, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (32, N'88931314-a0f4-4802-9bf7-f127daffae55', 3, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (71, N'f33b55f9-69d4-4ca9-9568-74d418867480', 3, 0, N'Small Pizza (6 Slices) (10")', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (135, N'3235131a-22f3-433d-97a2-f12491a2a83f', 21, 3, N'Small Pizza (6 Slices) (10") - Thin', 1, 11.7500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (149, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (81, N'c7f22aaf-5062-4f2b-94fb-955d93586b72', 21, 3, N'Small Pizza (6 Slices) (10")', 1, 9.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (82, N'2323c287-8c85-4c3d-a427-5c943c01b9cf', 10, 1, N'Small Pizza (6 Slices) (10") - Thick', 1, 6.9500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (83, N'2323c287-8c85-4c3d-a427-5c943c01b9cf', 11, 1, N'Medium Pizza (8 Slices) (12") - Thin', 1, 8.8500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (84, N'8d3d2a39-b8e6-43cb-ade4-1cc7c5170755', 3, 0, N'Small Pizza (6 Slices) (10") - Thin', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (85, N'21f6b102-ba25-4f11-bc56-477439af5fbc', 3, 0, N'Small Pizza (6 Slices) (10") - Thin', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (86, N'165430d5-137c-4bfd-8d1a-a227a854d764', 3, 0, N'Small Pizza (6 Slices) (10") - Thin', 2, 17.9800)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (87, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (88, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (91, N'55cfafe8-5621-4c5e-acae-080402538442', 10, 1, N'Small Pizza (6 Slices) (10") - Thick', 1, 6.9500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (94, N'9b2b3f09-8a9b-450b-a326-ad4cbcbd146f', 10, 1, N'Small Pizza (6 Slices) (10") - Thick', 1, 6.9500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (95, N'c464c5b3-5705-478c-854c-e514733bc9cb', 10, 1, N'Small Pizza (6 Slices) (10") - Thick', 1, 6.9500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (96, N'c464c5b3-5705-478c-854c-e514733bc9cb', 9, 1, N'Small Pizza (6 Slices) (10") - Thin', 1, 9.9500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (97, N'660f268d-62d3-48ed-87ad-f960fdd83d16', 17, 2, N'Medium Pizza (8 Slices) (12") - Thin', 1, 10.5800)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (98, N'606d5d14-a9b8-4b0e-be5c-273901ea82cd', 13, 1, N'Large Pizza (10 Slices) (14") - Thin', 1, 14.5000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (99, N'f260edda-a910-43e1-89ed-98f12609eec4', 9, 1, N'Small Pizza (6 Slices) (10") - Thin', 1, 9.9500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (100, N'1dc07919-1ad1-4dfe-b35f-15af826d71d8', 11, 1, N'Medium Pizza (8 Slices) (12") - Thin', 1, 8.8500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (101, N'f1fadb4b-23f2-4fac-8547-0d32e7d83c79', 25, 3, N'Large Pizza (10 Slices) (14") - Thin', 1, 17.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (102, N'f1fadb4b-23f2-4fac-8547-0d32e7d83c79', 23, 3, N'Medium Pizza (8 Slices) (12") - Thin', 1, 13.7500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (103, N'460aa1e7-bc99-4b12-9d2c-2acffd3e3e1c', 10, 1, N'Small Pizza (6 Slices) (10") - Thick', 1, 6.9500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (105, N'a87ad835-19af-4f53-818d-72cc16501df5', 21, 3, N'Small Pizza (6 Slices) (10") - Thin', 2, 23.5000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (106, N'a87ad835-19af-4f53-818d-72cc16501df5', 3, 0, N'Small Pizza (6 Slices) (10") - Thin', 1, 8.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (107, N'a774bcc2-9bdf-4e2a-bbc9-7ed93a0b0dba', 10, 1, N'Small Pizza (6 Slices) (10") - Thick', 1, 6.9500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (110, N'30a708ab-119c-4f3b-a1ac-3846a566b904', 22, 3, N'Small Pizza (6 Slices) (10") - Thick', 1, 12.9900)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (119, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (120, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (121, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (122, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (123, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (124, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (125, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (126, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (129, N'e9cdf7fb-ae10-468c-884c-879036e2c0f0', 9, 1, N'Small Pizza (6 Slices) (10") - Thin', 1, 9.9500)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (140, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (141, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (142, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (143, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (144, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (145, N'79163306-fb23-4ed1-8357-723f01a855a3', 1, 0, N'Small Pizza (6 Slices) (10)', 2, 15.0000)
GO
INSERT [dbo].[pizza_cart] ([cart_id], [cart_session_id], [cart_menu_id], [cart_store_id], [cart_menu], [cart_qty], [cart_menu_price]) VALUES (148, N'e474ba9d-54ba-4f29-a327-1d76448c9d9b', 3, 0, N'Small Pizza (6 Slices) (10") - Thin', 1, 8.9900)
GO
SET IDENTITY_INSERT [dbo].[pizza_cart] OFF
GO
SET IDENTITY_INSERT [dbo].[pizza_store] ON 
GO
INSERT [dbo].[pizza_store] ([store_id], [store_name], [store_image], [store_delivery_time]) VALUES (0, N'Pizza Pita', N'PizzaPita.png', N'Free Delivery - 30 Minutes')
GO
INSERT [dbo].[pizza_store] ([store_id], [store_name], [store_image], [store_delivery_time]) VALUES (1, N'Pizza Papa', N'PizzaPapa.png', N'Free Delivery - 45 Minutes')
GO
INSERT [dbo].[pizza_store] ([store_id], [store_name], [store_image], [store_delivery_time]) VALUES (2, N'Hut Pizza', N'HutPizza.png', N'Free Delivery - 25 Minutes')
GO
INSERT [dbo].[pizza_store] ([store_id], [store_name], [store_image], [store_delivery_time]) VALUES (3, N'Balkan Pizza', N'BalkanPizza.png', N'Free Delivery - 40 Minutes')
GO
SET IDENTITY_INSERT [dbo].[pizza_store] OFF
GO
SET IDENTITY_INSERT [dbo].[pizza_store_menu] ON 
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (3, 0, N'Small Pizza (6 Slices) (10") - Thin', N'CRUST: Thin BASE:Traditional Sauce 160 CAL PER SLICE', 8.9900)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (4, 0, N'Small Pizza (6 Slices) (10") - Thick', N'CRUST: Thick BASE:BBQ SAUCE 160 CAL PER SLICE', 8.9900)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (5, 0, N'Medium Pizza (8 Slices) (12") -Thin', N'CRUST: Thin BASE:Traditional Sauce 190 CAL PER SLICE', 10.9900)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (6, 0, N'Medium Pizza (8 Slices) (12") - Thick', N'CRUST: Thick BASE:BBQ Sauce 195 CAL PER SLICE', 10.5500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (7, 0, N'Large Pizza (10 Slices) (14") - Thin', N'CRUST: Thin BASE:Traditional Sauce 210 CAL PER SLICE', 13.5000)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (8, 0, N'Large Pizza (10 Slices) (14") - Thick', N'CRUST: Thick BASE:BBQ Sauce 215 CAL PER SLICE', 13.7500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (9, 1, N'Small Pizza (6 Slices) (10") - Thin', N'CRUST: Thin BASE:Traditional Sauce 160 CAL PER SLICE', 9.9500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (10, 1, N'Small Pizza (6 Slices) (10") - Thick', N'CRUST: Thick BASE:BBQ SAUCE 160 CAL PER SLICE', 6.9500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (11, 1, N'Medium Pizza (8 Slices) (12") - Thin', N'CRUST: Thin BASE:Traditional Sauce 190 CAL PER SLICE', 8.8500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (12, 1, N'Medium Pizza (8 Slices) (12") - Thick', N'CRUST: Thick BASE:BBQ Sauce 195 CAL PER SLICE', 11.9500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (13, 1, N'Large Pizza (10 Slices) (14") - Thin', N'CRUST: Thin BASE:Traditional Sauce 210 CAL PER SLICE', 14.5000)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (14, 1, N'Large Pizza (10 Slices) (14") - Thick', N'CRUST: Thick BASE:BBQ Sauce 215 CAL PER SLICE', 15.9900)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (15, 2, N'Small Pizza (6 Slices) (10") - Thin', N'CRUST: Thin BASE:Traditional Sauce 160 CAL PER SLICE', 5.7500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (16, 2, N'Small Pizza (6 Slices) (10") - Thick', N'CRUST: Thick BASE:BBQ SAUCE 160 CAL PER SLICE', 6.7500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (17, 2, N'Medium Pizza (8 Slices) (12") - Thin', N'CRUST: Thin BASE:Traditional Sauce 190 CAL PER SLICE', 10.5800)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (18, 2, N'Medium Pizza (8 Slices) (12") - Thick', N'CRUST: Thick BASE:BBQ Sauce 195 CAL PER SLICE', 12.7500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (19, 2, N'Large Pizza (10 Slices) (14") - Thin', N'CRUST: Thin BASE:Traditional Sauce 210 CAL PER SLICE', 13.7500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (20, 2, N'Large Pizza (10 Slices) (14") - Thick', N'CRUST: Thick BASE:BBQ Sauce 215 CAL PER SLICE', 12.8500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (21, 3, N'Small Pizza (6 Slices) (10") - Thin', N'CRUST: Thin BASE:Traditional Sauce 160 CAL PER SLICE', 11.7500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (22, 3, N'Small Pizza (6 Slices) (10") - Thick', N'CRUST: Thick BASE:BBQ SAUCE 160 CAL PER SLICE', 12.9900)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (23, 3, N'Medium Pizza (8 Slices) (12") - Thin', N'CRUST: Thin BASE:Traditional Sauce 190 CAL PER SLICE', 13.7500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (24, 3, N'Medium Pizza (8 Slices) (12") - Thick', N'CRUST: Thick BASE:BBQ Sauce 195 CAL PER SLICE', 14.7500)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (25, 3, N'Large Pizza (10 Slices) (14") - Thin', N'CRUST: Thin BASE:Traditional Sauce 210 CAL PER SLICE', 17.9900)
GO
INSERT [dbo].[pizza_store_menu] ([pizza_menu_id], [pizza_store_id], [pizza_menu], [pizza_menu_description], [pizza_menu_price]) VALUES (26, 3, N'Large Pizza (10 Slices) (14") - Thick', N'CRUST: Thick BASE:BBQ Sauce 215 CAL PER SLICE', 17.9900)
GO
SET IDENTITY_INSERT [dbo].[pizza_store_menu] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 4/19/2020 3:25:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/19/2020 3:25:14 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 4/19/2020 3:25:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 4/19/2020 3:25:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 4/19/2020 3:25:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 4/19/2020 3:25:14 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/19/2020 3:25:14 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [Week6DB] SET  READ_WRITE 
GO
