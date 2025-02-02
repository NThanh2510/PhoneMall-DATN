USE [master]
GO
/****** Object:  Database [Store_DATN]    Script Date: 1/17/2025 7:42:08 PM ******/
CREATE DATABASE [Store_DATN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Store_DATN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Store_DATN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Store_DATN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Store_DATN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Store_DATN] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Store_DATN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Store_DATN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Store_DATN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Store_DATN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Store_DATN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Store_DATN] SET ARITHABORT OFF 
GO
ALTER DATABASE [Store_DATN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Store_DATN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Store_DATN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Store_DATN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Store_DATN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Store_DATN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Store_DATN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Store_DATN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Store_DATN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Store_DATN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Store_DATN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Store_DATN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Store_DATN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Store_DATN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Store_DATN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Store_DATN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Store_DATN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Store_DATN] SET RECOVERY FULL 
GO
ALTER DATABASE [Store_DATN] SET  MULTI_USER 
GO
ALTER DATABASE [Store_DATN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Store_DATN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Store_DATN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Store_DATN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Store_DATN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Store_DATN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Store_DATN', N'ON'
GO
ALTER DATABASE [Store_DATN] SET QUERY_STORE = ON
GO
ALTER DATABASE [Store_DATN] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Store_DATN]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[user_name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NULL,
	[phone_number] [nvarchar](20) NULL,
	[password] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[authoritie_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[authoritie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[connectivity]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[connectivity](
	[connectivity_id] [int] IDENTITY(1,1) NOT NULL,
	[connectivity_type] [nvarchar](225) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[connectivity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[os]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_images]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_images](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[image_path] [nvarchar](255) NOT NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_options]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_options](
	[option_id] [int] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](50) NULL,
	[color_price_adjustment] [decimal](18, 2) NULL,
	[storage_ram] [nvarchar](50) NULL,
	[storage_price_adjustment] [decimal](18, 2) NULL,
	[quantity] [int] NOT NULL,
	[final_price] [decimal](18, 2) NOT NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[option_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[base_price] [decimal](18, 2) NOT NULL,
	[main_image] [nvarchar](255) NULL,
	[created_date] [datetime] NULL,
	[warranty] [nvarchar](255) NULL,
	[sub_category_id] [int] NULL,
	[promotion_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion_details]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion_details](
	[promotion_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[discount_type] [nvarchar](50) NULL,
	[discount_value] [decimal](18, 2) NULL,
	[gift] [nvarchar](255) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[promotion_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotions]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotions](
	[promotion_id] [int] IDENTITY(1,1) NOT NULL,
	[promotion_detail_id] [int] NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_order_details]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_order_details](
	[purchase_order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_cost] [decimal](18, 2) NOT NULL,
	[sub_total] [decimal](18, 2) NOT NULL,
	[product_id] [int] NULL,
	[option_id] [int] NULL,
	[purchase_order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchase_order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_orders]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_orders](
	[purchase_order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NULL,
	[total_cost] [decimal](18, 2) NOT NULL,
	[supplier_name] [nvarchar](255) NOT NULL,
	[contact_info] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[user_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[purchase_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_order_details]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_order_details](
	[sales_order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[sub_price] [decimal](18, 2) NOT NULL,
	[product_id] [int] NULL,
	[option_id] [int] NULL,
	[sales_order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sales_order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_orders]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_orders](
	[sales_order_id] [int] IDENTITY(1,1) NOT NULL,
	[total_price] [decimal](18, 2) NOT NULL,
	[status] [nvarchar](50) NULL,
	[order_date] [datetime] NULL,
	[user_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sales_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subCategories]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subCategories](
	[sub_category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sub_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[technical_specs]    Script Date: 1/17/2025 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[technical_specs](
	[technical_specs_id] [int] IDENTITY(1,1) NOT NULL,
	[screen_size] [nvarchar](50) NULL,
	[screen_resolution] [nvarchar](50) NULL,
	[processor] [nvarchar](255) NULL,
	[rear_camera] [nvarchar](255) NULL,
	[front_camera] [nvarchar](255) NULL,
	[battery] [nvarchar](255) NULL,
	[fast_charging] [nvarchar](255) NULL,
	[water_resistance] [nvarchar](255) NULL,
	[release_date] [datetime] NULL,
	[product_id] [int] NULL,
	[os] [int] NULL,
	[connectivity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[technical_specs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([user_name], [email], [address], [phone_number], [password], [created_date]) VALUES (N'admin', N'admin@example.com', N'Hồ Chí Minh', N'0909123456', N'12345', CAST(N'2025-01-17T19:12:17.813' AS DateTime))
INSERT [dbo].[accounts] ([user_name], [email], [address], [phone_number], [password], [created_date]) VALUES (N'customer1', N'customer1@example.com', N'TP. Hồ Chí Minh', N'0912345678', N'12345', CAST(N'2025-01-17T19:12:17.813' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[authorities] ON 

INSERT [dbo].[authorities] ([authoritie_id], [user_name], [role_id]) VALUES (1, N'admin', 1)
INSERT [dbo].[authorities] ([authoritie_id], [user_name], [role_id]) VALUES (2, N'customer1', 2)
SET IDENTITY_INSERT [dbo].[authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([category_id], [name]) VALUES (1, N'Samsung')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (2, N'Xiaomi')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (3, N'OPPO')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (4, N'iPhone')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[connectivity] ON 

INSERT [dbo].[connectivity] ([connectivity_id], [connectivity_type]) VALUES (1, N'WiFi')
INSERT [dbo].[connectivity] ([connectivity_id], [connectivity_type]) VALUES (2, N'5G')
INSERT [dbo].[connectivity] ([connectivity_id], [connectivity_type]) VALUES (3, N'NFC')
INSERT [dbo].[connectivity] ([connectivity_id], [connectivity_type]) VALUES (4, N'4G LTE')
SET IDENTITY_INSERT [dbo].[connectivity] OFF
GO
SET IDENTITY_INSERT [dbo].[os] ON 

INSERT [dbo].[os] ([id], [name]) VALUES (1, N'Android')
INSERT [dbo].[os] ([id], [name]) VALUES (2, N'iOS')
SET IDENTITY_INSERT [dbo].[os] OFF
GO
SET IDENTITY_INSERT [dbo].[product_options] ON 

INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (2, N'Đen', CAST(0.00 AS Decimal(18, 2)), N'128GB/8GB', CAST(0.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (3, N'Đen', CAST(0.00 AS Decimal(18, 2)), N'256GB/8GB', CAST(1000000.00 AS Decimal(18, 2)), 10, CAST(10000000.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (4, N'Đen', CAST(0.00 AS Decimal(18, 2)), N'512GB/8GB', CAST(2000000.00 AS Decimal(18, 2)), 10, CAST(20000000.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (5, N'Tím', CAST(500000.00 AS Decimal(18, 2)), N'256GB/8GB', CAST(1000000.00 AS Decimal(18, 2)), 10, CAST(1500000.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (6, N'Bạc', CAST(0.00 AS Decimal(18, 2)), N'128GB/6GB', CAST(0.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (7, N'Xanh', CAST(500000.00 AS Decimal(18, 2)), N'512GB/12GB', CAST(2000000.00 AS Decimal(18, 2)), 10, CAST(25000000.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (8, N'Đen', CAST(0.00 AS Decimal(18, 2)), N'128GB/8GB', CAST(0.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (9, N'Đen', CAST(0.00 AS Decimal(18, 2)), N'256GB/8GB', CAST(1000000.00 AS Decimal(18, 2)), 10, CAST(10000000.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (10, N'Đen', CAST(0.00 AS Decimal(18, 2)), N'512GB/8GB', CAST(2000000.00 AS Decimal(18, 2)), 10, CAST(20000000.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (11, N'Tím', CAST(500000.00 AS Decimal(18, 2)), N'256GB/8GB', CAST(1000000.00 AS Decimal(18, 2)), 10, CAST(1500000.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (12, N'Bạc', CAST(0.00 AS Decimal(18, 2)), N'128GB/6GB', CAST(0.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (13, N'Xanh', CAST(500000.00 AS Decimal(18, 2)), N'512GB/12GB', CAST(2000000.00 AS Decimal(18, 2)), 10, CAST(25000000.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (14, N'Đen', CAST(0.00 AS Decimal(18, 2)), N'128GB/8GB', CAST(0.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (15, N'Đen', CAST(0.00 AS Decimal(18, 2)), N'256GB/8GB', CAST(1000000.00 AS Decimal(18, 2)), 10, CAST(10000000.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (16, N'Đen', CAST(0.00 AS Decimal(18, 2)), N'512GB/8GB', CAST(2000000.00 AS Decimal(18, 2)), 10, CAST(20000000.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (17, N'Tím', CAST(500000.00 AS Decimal(18, 2)), N'256GB/8GB', CAST(1000000.00 AS Decimal(18, 2)), 10, CAST(1500000.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (18, N'Bạc', CAST(0.00 AS Decimal(18, 2)), N'128GB/6GB', CAST(0.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[product_options] ([option_id], [color], [color_price_adjustment], [storage_ram], [storage_price_adjustment], [quantity], [final_price], [product_id]) VALUES (19, N'Xanh', CAST(500000.00 AS Decimal(18, 2)), N'512GB/12GB', CAST(2000000.00 AS Decimal(18, 2)), 10, CAST(25000000.00 AS Decimal(18, 2)), 8)
SET IDENTITY_INSERT [dbo].[product_options] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (6, N'iPhone 15', CAST(16000000.00 AS Decimal(18, 2)), N'iphone_15_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 3, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (7, N'iPhone 15 Plus', CAST(20000000.00 AS Decimal(18, 2)), N'iphone_15_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 3, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (8, N'iPhone 15 Pro', CAST(23000000.00 AS Decimal(18, 2)), N'iphone_15_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 3, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (9, N'iPhone 15 Pro Max', CAST(25000000.00 AS Decimal(18, 2)), N'iphone_15_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 3, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (10, N'iPhone 16', CAST(19000000.00 AS Decimal(18, 2)), N'iphone_15_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 4, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (11, N'iPhone 16 Plus', CAST(22000000.00 AS Decimal(18, 2)), N'iphone_15_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 4, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (12, N'iPhone 16 Pro', CAST(25000000.00 AS Decimal(18, 2)), N'iphone_15_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 4, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (13, N'iPhone 16 Pro Max', CAST(29000000.00 AS Decimal(18, 2)), N'iphone_15_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 4, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (14, N'Xiaomi 13T', CAST(10000000.00 AS Decimal(18, 2)), N'xiaomi_13_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 5, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (15, N'Xiaomi 13T Pro', CAST(14000000.00 AS Decimal(18, 2)), N'xiaomi_13_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 5, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (16, N'Xiaomi 14T', CAST(13000000.00 AS Decimal(18, 2)), N'xiaomi_14_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 6, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (17, N'Xiaomi 14T Pro', CAST(16000000.00 AS Decimal(18, 2)), N'xiaomi_14_pro_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 6, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (18, N'Xiaomi Redmi Note 13 Pro', CAST(6000000.00 AS Decimal(18, 2)), N'xiaomi_note_13_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 7, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (19, N'Xiaomi Redmi Note 14 Pro', CAST(8000000.00 AS Decimal(18, 2)), N'xiaomi_note_13_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 8, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (20, N'Samsung Galaxy S24 Ultra', CAST(21000000.00 AS Decimal(18, 2)), N'samsung_galaxy_s21_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 9, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (21, N'Samsung Galaxy S24 FE 5G', CAST(12000000.00 AS Decimal(18, 2)), N'samsung_galaxy_s21_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 9, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (22, N'Samsung Galaxy A15 LTE', CAST(3000000.00 AS Decimal(18, 2)), N'samsung_galaxy_a52_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 10, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (23, N'Samsung Galaxy A16 5G', CAST(4000000.00 AS Decimal(18, 2)), N'samsung_galaxy_a52_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 10, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (24, N'OPPO A3', CAST(4000000.00 AS Decimal(18, 2)), N'oppo_a54_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 11, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (25, N'OPPO Find X8', CAST(20000000.00 AS Decimal(18, 2)), N'oppo_find_x5_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 12, NULL)
INSERT [dbo].[products] ([product_id], [name], [base_price], [main_image], [created_date], [warranty], [sub_category_id], [promotion_id]) VALUES (26, N'OPPO Reno 13', CAST(7000000.00 AS Decimal(18, 2)), N'oppo_reno_6_image.jpg', CAST(N'2025-01-17T19:08:54.760' AS DateTime), N'12', 13, NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[promotion_details] ON 

INSERT [dbo].[promotion_details] ([promotion_detail_id], [name], [discount_type], [discount_value], [gift], [start_date], [end_date], [status]) VALUES (1, N'Giảm giá Tết', N'Phần trăm', CAST(10.00 AS Decimal(18, 2)), N'Không', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-31T00:00:00.000' AS DateTime), N'Hoạt động')
SET IDENTITY_INSERT [dbo].[promotion_details] OFF
GO
SET IDENTITY_INSERT [dbo].[promotions] ON 

INSERT [dbo].[promotions] ([promotion_id], [promotion_detail_id], [product_id]) VALUES (1, 1, 6)
SET IDENTITY_INSERT [dbo].[promotions] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [name]) VALUES (1, N'ADMIN')
INSERT [dbo].[role] ([role_id], [name]) VALUES (2, N'CUSTOMER')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[sales_order_details] ON 

INSERT [dbo].[sales_order_details] ([sales_order_detail_id], [quantity], [price], [sub_price], [product_id], [option_id], [sales_order_id]) VALUES (3, 1, CAST(20000000.00 AS Decimal(18, 2)), CAST(20000000.00 AS Decimal(18, 2)), 6, 2, 1)
INSERT [dbo].[sales_order_details] ([sales_order_detail_id], [quantity], [price], [sub_price], [product_id], [option_id], [sales_order_id]) VALUES (4, 1, CAST(29000000.00 AS Decimal(18, 2)), CAST(29000000.00 AS Decimal(18, 2)), 6, 3, 1)
INSERT [dbo].[sales_order_details] ([sales_order_detail_id], [quantity], [price], [sub_price], [product_id], [option_id], [sales_order_id]) VALUES (5, 1, CAST(20000000.00 AS Decimal(18, 2)), CAST(20000000.00 AS Decimal(18, 2)), NULL, 2, 1)
INSERT [dbo].[sales_order_details] ([sales_order_detail_id], [quantity], [price], [sub_price], [product_id], [option_id], [sales_order_id]) VALUES (6, 1, CAST(29000000.00 AS Decimal(18, 2)), CAST(29000000.00 AS Decimal(18, 2)), NULL, 3, 1)
SET IDENTITY_INSERT [dbo].[sales_order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[sales_orders] ON 

INSERT [dbo].[sales_orders] ([sales_order_id], [total_price], [status], [order_date], [user_name]) VALUES (1, CAST(50000000.00 AS Decimal(18, 2)), N'Đang xử lý', CAST(N'2025-01-17T19:13:31.030' AS DateTime), N'customer1')
SET IDENTITY_INSERT [dbo].[sales_orders] OFF
GO
SET IDENTITY_INSERT [dbo].[subCategories] ON 

INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (1, N'iPhone 13 Series', 4)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (2, N'iPhone 14 Series', 4)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (3, N'iPhone 15 Series', 4)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (4, N'iPhone 16 Series', 4)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (5, N'Xiaomi 13 Series', 2)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (6, N'Xiaomi 14 Series', 2)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (7, N'Xiaomi Note 13 Series', 2)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (8, N'Xiaomi Note 14 Series', 2)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (9, N'SamSung Galaxy S', 1)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (10, N'SamSung Galaxy A', 1)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (11, N'OPPO A Series', 3)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (12, N'OPPO Find X Series', 3)
INSERT [dbo].[subCategories] ([sub_category_id], [name], [category_id]) VALUES (13, N'OPPO Reno Series', 3)
SET IDENTITY_INSERT [dbo].[subCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[technical_specs] ON 

INSERT [dbo].[technical_specs] ([technical_specs_id], [screen_size], [screen_resolution], [processor], [rear_camera], [front_camera], [battery], [fast_charging], [water_resistance], [release_date], [product_id], [os], [connectivity]) VALUES (1, N'6.1 inches', N'2556 x 1179', N'Apple A16 Bionic 6 nhân', N'Chính 48 MP & Phụ 12 MP', N'12MP, ƒ/1.9', N'3349 mAh', N'Có', N'IP68', CAST(N'2023-02-01T00:00:00.000' AS DateTime), 6, 2, 2)
INSERT [dbo].[technical_specs] ([technical_specs_id], [screen_size], [screen_resolution], [processor], [rear_camera], [front_camera], [battery], [fast_charging], [water_resistance], [release_date], [product_id], [os], [connectivity]) VALUES (2, N'6.1 inches', N'2556 x 1179', N'Apple A16 Bionic 6 nhân', N'Chính 48 MP & Phụ 12 MP', N'12MP, ƒ/1.9', N'3349 mAh', N'Có', N'IP68', CAST(N'2023-02-01T00:00:00.000' AS DateTime), 7, 2, 2)
SET IDENTITY_INSERT [dbo].[technical_specs] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__accounts__AB6E6164E4139E34]    Script Date: 1/17/2025 7:42:09 PM ******/
ALTER TABLE [dbo].[accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[accounts] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[purchase_orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[sales_orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD FOREIGN KEY([user_name])
REFERENCES [dbo].[accounts] ([user_name])
GO
ALTER TABLE [dbo].[product_images]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[product_options]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([sub_category_id])
REFERENCES [dbo].[subCategories] ([sub_category_id])
GO
ALTER TABLE [dbo].[promotions]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[promotions]  WITH CHECK ADD FOREIGN KEY([promotion_detail_id])
REFERENCES [dbo].[promotion_details] ([promotion_detail_id])
GO
ALTER TABLE [dbo].[purchase_order_details]  WITH CHECK ADD FOREIGN KEY([option_id])
REFERENCES [dbo].[product_options] ([option_id])
GO
ALTER TABLE [dbo].[purchase_order_details]  WITH CHECK ADD FOREIGN KEY([purchase_order_id])
REFERENCES [dbo].[purchase_orders] ([purchase_order_id])
GO
ALTER TABLE [dbo].[purchase_orders]  WITH CHECK ADD FOREIGN KEY([user_name])
REFERENCES [dbo].[accounts] ([user_name])
GO
ALTER TABLE [dbo].[sales_order_details]  WITH CHECK ADD FOREIGN KEY([option_id])
REFERENCES [dbo].[product_options] ([option_id])
GO
ALTER TABLE [dbo].[sales_order_details]  WITH CHECK ADD FOREIGN KEY([sales_order_id])
REFERENCES [dbo].[sales_orders] ([sales_order_id])
GO
ALTER TABLE [dbo].[sales_orders]  WITH CHECK ADD FOREIGN KEY([user_name])
REFERENCES [dbo].[accounts] ([user_name])
GO
ALTER TABLE [dbo].[subCategories]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
GO
ALTER TABLE [dbo].[technical_specs]  WITH CHECK ADD FOREIGN KEY([connectivity])
REFERENCES [dbo].[connectivity] ([connectivity_id])
GO
ALTER TABLE [dbo].[technical_specs]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[technical_specs]  WITH CHECK ADD FOREIGN KEY([os])
REFERENCES [dbo].[os] ([id])
GO
USE [master]
GO
ALTER DATABASE [Store_DATN] SET  READ_WRITE 
GO
