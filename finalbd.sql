USE [master]
GO
/****** Object:  Database [Sport]    Script Date: 11.10.2024 13:37:37 ******/
CREATE DATABASE [Sport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sport', FILENAME = N'Z:\Programs\mssql\server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sport.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sport_log', FILENAME = N'Z:\Programs\mssql\server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sport_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Sport] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sport] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sport] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sport] SET RECOVERY FULL 
GO
ALTER DATABASE [Sport] SET  MULTI_USER 
GO
ALTER DATABASE [Sport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sport] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sport] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sport', N'ON'
GO
ALTER DATABASE [Sport] SET QUERY_STORE = ON
GO
ALTER DATABASE [Sport] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Sport]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 11.10.2024 13:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [varchar](50) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11.10.2024 13:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfAuth]    Script Date: 11.10.2024 13:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfAuth](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfAuth] [varchar](50) NULL,
 CONSTRAINT [PK_TypeOfAuth] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11.10.2024 13:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patromic] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[MobileNumber] [nvarchar](50) NOT NULL,
	[Passport] [nvarchar](100) NULL,
	[DateOfBirth] [date] NOT NULL,
	[LastAuthDate] [date] NULL,
	[LastAAuthTime] [time](7) NULL,
	[TypeOfAuth] [int] NULL,
	[GenderId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Id], [Gender]) VALUES (1, N'Женщина')
INSERT [dbo].[Gender] ([Id], [Gender]) VALUES (2, N'Мужчина')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Role]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (2, N'Исполнитель')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfAuth] ON 

INSERT [dbo].[TypeOfAuth] ([Id], [TypeOfAuth]) VALUES (1, N'Неуспешно')
INSERT [dbo].[TypeOfAuth] ([Id], [TypeOfAuth]) VALUES (2, N'Успешно')
SET IDENTITY_INSERT [dbo].[TypeOfAuth] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (1, 1, N'Акимов', N'Ян', N'Алексеевич', N'gohufreilagrau-3818@yopmail.com', N'akimovya', N'bn069Caj', N'+7(781) 785-58-36', N' 2367  558134', CAST(N'1993-07-03' AS Date), CAST(N'2023-01-08' AS Date), CAST(N'13:07:20' AS Time), 2, 2)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (2, 2, N'Гончарова', N'Ульяна', N'Львовна', N'xawugosune-1385@yopmail.com', N'goncharovaul', N'pW4qZhL!', N'+7(230) 906-88-15', N' 7101  669343', CAST(N'1975-06-22' AS Date), CAST(N'2023-01-09' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (3, 1, N'Анохина', N'Елизавета', N'Матвеевна', N'leuttevitrafo1998@mail.ru', N'anochinaem', N'y6UNmaJg', N'+7(555) 444-83-16', N' 3455  719630', CAST(N'1991-08-16' AS Date), CAST(N'2023-01-10' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (4, 3, N'Николаев', N'Илья', N'Владиславович', N'frapreubrulloba1141@yandex.ru', N'nickolaeviv', N'ebOt@4y$', N'+7(392) 682-44-42', N' 2377  871623', CAST(N'1970-12-22' AS Date), CAST(N'2023-01-11' AS Date), CAST(N'13:07:20' AS Time), 2, 2)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (5, 2, N'Уткин', N'Дмитрий', N'Платонович', N'zapramaxesu-7741@yopmail.com', N'utkindp', N'zQt8g@GH', N'+7(836) 429-03-86', N' 8755  921148', CAST(N'1999-05-04' AS Date), CAST(N'2023-01-12' AS Date), CAST(N'13:07:20' AS Time), 1, 2)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (6, 2, N'Куликова', N'Стефания', N'Никитична', N'rouzecroummegre-3899@yopmail.com', N'kulikovasn', N'TCmE7Jon', N'+7(283) 945-30-92', N' 4355  104594', CAST(N'1994-12-06' AS Date), CAST(N'2023-01-13' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (7, 2, N'Волков', N'Егор', N'Матвеевич', N'ziyeuddocrabri-4748@@yopmail.com', N'volkovem', N'pbgO3Vv5', N'+7(621) 359-36-69', N' 2791  114390', CAST(N'1995-03-28' AS Date), CAST(N'2023-01-14' AS Date), CAST(N'13:07:20' AS Time), 2, 2)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (8, 1, N'Соколова', N'Софья', N'Георгиевна', N'ketameissoinnei-1951@yopmail.com', N'sokolovasg', N'lITaH?Bs', N'+7(440) 561-03-14', N' 5582  126286', CAST(N'1977-03-27' AS Date), CAST(N'2023-01-15' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (9, 3, N'Голубева', N'Полина', N'Андреевна', N'yipraubaponou-5849@yopmail.com', N'golubevapa', N's|ke*p@~', N'+7(331) 918-24-34', N' 2978  133653', CAST(N'1975-04-12' AS Date), CAST(N'2023-01-16' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (10, 3, N'Вишневская', N'Мария', N'Андреевна', N'crapedocouca-3572@yopmail.com', N'vishnevskayama', N'OCaywHJZ', N'+7(493) 219-39-42', N' 7512  141956', CAST(N'1975-12-23' AS Date), CAST(N'2023-01-17' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (11, 3, N'Васильева', N'Арина', N'Данииловна', N'ceigoixakaunni-9227@yopmail.com', N'vasilevad', N'DAWuV%#u', N'+7(407) 485-50-30', N' 5046  158433', CAST(N'2000-01-22' AS Date), CAST(N'2023-01-18' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (12, 3, N'Павлов', N'Дмитрий', N'Максимович', N'yeimmeiwauzomo-7054@yopmail.com', N'pavlovdm', N'ptoED%zE', N'+7(919) 478-24-97', N' 2460  169505', CAST(N'1983-10-03' AS Date), CAST(N'2023-01-19' AS Date), CAST(N'13:07:20' AS Time), 1, 2)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (13, 2, N'Горбунова', N'Мирослава', N'Артуровна', N'pixil59@gmail.com', N'gorbunovama', N'ZFR2~Zl*', N'+7(482) 802-95-80', N' 3412  174593', CAST(N'1998-03-03' AS Date), CAST(N'2023-01-20' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (14, 3, N'Демина', N'София', N'Романовна', N'deummecillummu-4992@mail.ru', N'deminasr', N'D%DVKyDN', N'+7(455) 944-64-49', N' 4950  183034', CAST(N'1993-06-08' AS Date), CAST(N'2023-01-21' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (15, 2, N'Петрова', N'Алина', N'Робертовна', N'vilagajaunne-5170@yandex.ru', N'petrovaar', N'z7ZE?8N5', N'+7(710) 388-25-63', N' 5829  219464', CAST(N'1980-09-23' AS Date), CAST(N'2023-01-22' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (16, 2, N'Плотников', N'Григорий', N'Александрович', N'frusubroppotou656@yandex.ru', N'plotnikovga', N'yh+S4@yc', N'+7(759) 452-38-46', N' 6443  208059', CAST(N'1991-03-13' AS Date), CAST(N'2023-01-23' AS Date), CAST(N'13:07:20' AS Time), 2, 2)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (17, 2, N'Прохорова', N'Есения', N'Тимофеевна', N'vhopkins@lewis-mullen.com', N'prochorovaet', N'wLF186dB', N'+7(687) 801-13-32', N' 7079  213265', CAST(N'1998-04-14' AS Date), CAST(N'2023-01-24' AS Date), CAST(N'13:07:20' AS Time), NULL, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (18, 2, N'Чернов', N'Алексей', N'Егорович', N'nlewis@yahoo.com', N'chernovae', N'Sjkr*1zV', N'+7(425) 783-22-53', N' 8207  522702', CAST(N'1980-04-16' AS Date), CAST(N'2023-01-25' AS Date), CAST(N'13:07:20' AS Time), 2, 2)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (19, 3, N'Горбунов', N'Степан', N'Артёмович', N'garciadavid@mckinney-mcbride.com', N'gorbunovsa', N'hFhK%$JI', N'+7(889) 449-43-91', N' 9307  232158', CAST(N'1993-07-23' AS Date), CAST(N'2023-01-26' AS Date), CAST(N'13:07:20' AS Time), 2, 2)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (20, 2, N'Рябинина', N'Софья', N'Артёмовна', N'loudittoimmolau1900@gmail.com', N'ryabininasa', N'&yw1da4K', N'+7(825) 301-82-50', N' 1357  242839', CAST(N'1990-06-01' AS Date), CAST(N'2023-01-27' AS Date), CAST(N'13:07:20' AS Time), NULL, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (21, 2, N'Козлова', N'Яна', N'Даниловна', N'hittuprofassa4984@mail.com', N'kozlovayd', N'wCH7dl3k', N'+7(397) 334-20-86', N' 1167  256636', CAST(N'1987-12-21' AS Date), CAST(N'2023-01-28' AS Date), CAST(N'13:07:20' AS Time), NULL, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (22, 3, N'Лукьянова', N'Ульяна', N'Олеговна', N'freineiciweijau888@yandex.ru', N'lyckyanovayo', N'JadQ24D5', N'+7(241) 570-30-40', N' 1768  266986', CAST(N'1981-10-22' AS Date), CAST(N'2023-01-29' AS Date), CAST(N'13:07:20' AS Time), NULL, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (23, 2, N'Кондрашова', N'Арина', N'Ивановна', N'jessica84@hotmail.com', N'kondrashovai', N'YlBz$8vJ', N'+7(713) 462-82-65', N' 1710  427875', CAST(N'1976-12-22' AS Date), CAST(N'2023-01-30' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (24, 3, N'Быкова', N'Виктория', N'Тимуровна', N'nokupekidda2001@gmail.com', N'bykovavt', N'nx8Z$K98', N'+7(854) 822-23-31', N' 1806  289145', CAST(N'1973-06-14' AS Date), CAST(N'2023-01-31' AS Date), CAST(N'13:07:20' AS Time), NULL, 1)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (25, 2, N'Гуляев', N'Тимофей', N'Даниилович', N'ginaritter@schneider-buchanan.com', N'gylyaevtd', N'lz$kp1?f', N'+7(439) 713-61-17', N' 1587  291249', CAST(N'1987-02-05' AS Date), CAST(N'2023-02-01' AS Date), CAST(N'13:07:20' AS Time), 1, 2)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patromic], [Email], [Login], [Password], [MobileNumber], [Passport], [DateOfBirth], [LastAuthDate], [LastAAuthTime], [TypeOfAuth], [GenderId]) VALUES (26, 3, N'Кондрученков', N'Даниил', N'Андреевич', N'Danko707@gmail.com', N'Danko707', N'Danko707', N'+7 (412) 532-12-45', NULL, CAST(N'1991-09-11' AS Date), NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Gender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Gender]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_TypeOfAuth] FOREIGN KEY([TypeOfAuth])
REFERENCES [dbo].[TypeOfAuth] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_TypeOfAuth]
GO
USE [master]
GO
ALTER DATABASE [Sport] SET  READ_WRITE 
GO
