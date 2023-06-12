USE [master]
GO
/****** Object:  Database [QLDV]    Script Date: 6/12/2023 5:29:29 PM ******/
CREATE DATABASE [QLDV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLDV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLDV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLDV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLDV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLDV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDV] SET RECOVERY FULL 
GO
ALTER DATABASE [QLDV] SET  MULTI_USER 
GO
ALTER DATABASE [QLDV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLDV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLDV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLDV', N'ON'
GO
ALTER DATABASE [QLDV] SET QUERY_STORE = OFF
GO
USE [QLDV]
GO
/****** Object:  Table [dbo].[chi_tiet_don_hang]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_don_hang](
	[chi_tiet_don_hang_id] [int] IDENTITY(1,1) NOT NULL,
	[don_hang_id] [int] NOT NULL,
	[san_pham_id] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[gia_ban] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[chi_tiet_don_hang_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dich_vu]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dich_vu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_dich_vu] [nvarchar](255) NOT NULL,
	[mo_ta] [nvarchar](255) NULL,
	[gia] [money] NOT NULL,
	[trang_thai] [text] NULL,
 CONSTRAINT [PK__dich_vu__3213E83F1954D767] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[don_hang]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[don_hang](
	[don_hang_id] [int] IDENTITY(1,1) NOT NULL,
	[nguoi_dung_id] [int] NOT NULL,
	[ngay_dat_hang] [date] NOT NULL,
	[tong_gia_tri] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[don_hang_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[donhang_dichvu]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donhang_dichvu](
	[donhang_dichvu_id] [int] IDENTITY(1,1) NOT NULL,
	[donhang_id] [int] NOT NULL,
	[dichvu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[donhang_dichvu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giohang]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giohang](
	[gio_hang_id] [int] IDENTITY(1,1) NOT NULL,
	[nguoidung_id] [int] NOT NULL,
	[ngay_tao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[gio_hang_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giohang_sanpham]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giohang_sanpham](
	[giohang_sanpham_id] [int] IDENTITY(1,1) NOT NULL,
	[giohang_id] [int] NOT NULL,
	[sanpham_id] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[giohang_sanpham_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kho]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[san_pham_id] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[gia_nhap] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[magiamgia]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[magiamgia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](50) NOT NULL,
	[gia_tri] [money] NOT NULL,
	[ngay_bat_dau] [date] NOT NULL,
	[ngay_ket_thuc] [date] NOT NULL,
	[so_luong_san_pham] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoidung](
	[nguoi_dung_id] [int] IDENTITY(1,1) NOT NULL,
	[ten_dang_nhap] [nvarchar](255) NOT NULL,
	[mat_khau] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[ho_ten] [nvarchar](255) NOT NULL,
	[dia_chi] [nvarchar](255) NOT NULL,
	[so_dien_thoai] [nvarchar](20) NOT NULL,
	[chuc_vu] [bit] NULL,
	[khoa] [bit] NOT NULL,
 CONSTRAINT [PK__nguoidun__3213E83FBA83D156] PRIMARY KEY CLUSTERED 
(
	[nguoi_dung_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoidung_dichvu]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoidung_dichvu](
	[nguoidung_dichvu_id] [int] IDENTITY(1,1) NOT NULL,
	[nguoidung_id] [int] NOT NULL,
	[dichvu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nguoidung_dichvu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhacungcap]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhacungcap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_nhacungcap] [nvarchar](255) NOT NULL,
	[dia_chi] [nvarchar](255) NULL,
	[so_dien_thoai] [nvarchar](20) NULL,
	[email] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phuong_thuc_thanh_toan]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phuong_thuc_thanh_toan](
	[phuong_thuc_id] [int] IDENTITY(1,1) NOT NULL,
	[don_hang_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[phuong_thuc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_san_pham] [nvarchar](255) NOT NULL,
	[gia] [decimal](10, 2) NOT NULL,
	[mo_ta] [nvarchar](255) NULL,
	[hinh_anh] [nvarchar](255) NULL,
	[nha_cung_cap_id] [int] NOT NULL,
	[trang_thai] [bit] NULL,
 CONSTRAINT [PK__sanpham__3213E83FDDE56F81] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham_magiamgia]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham_magiamgia](
	[sanpham_magiamgia_id] [int] IDENTITY(1,1) NOT NULL,
	[sanpham_id] [int] NOT NULL,
	[magiamgia_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sanpham_magiamgia_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_toan_khi_nhan_hang]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thanh_toan_khi_nhan_hang](
	[thanh_toan_id] [int] IDENTITY(1,1) NOT NULL,
	[phuong_thuc_id] [int] NULL,
	[dia_chi_giao_hang] [nvarchar](255) NULL,
	[ngay_giao_hang] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[thanh_toan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_toan_qua_the]    Script Date: 6/12/2023 5:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thanh_toan_qua_the](
	[thanh_toan_id] [int] IDENTITY(1,1) NOT NULL,
	[phuong_thuc_id] [int] NULL,
	[so_the] [nvarchar](16) NULL,
	[ngay_het_han] [date] NULL,
	[ma_bao_mat] [nvarchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[thanh_toan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chi_tiet_don_hang] ON 

INSERT [dbo].[chi_tiet_don_hang] ([chi_tiet_don_hang_id], [don_hang_id], [san_pham_id], [so_luong], [gia_ban]) VALUES (1, 2, 1020, 2, 99.0000)
INSERT [dbo].[chi_tiet_don_hang] ([chi_tiet_don_hang_id], [don_hang_id], [san_pham_id], [so_luong], [gia_ban]) VALUES (2, 5, 1024, 5, 692.0000)
INSERT [dbo].[chi_tiet_don_hang] ([chi_tiet_don_hang_id], [don_hang_id], [san_pham_id], [so_luong], [gia_ban]) VALUES (3, 3, 1021, 6, 365.0000)
INSERT [dbo].[chi_tiet_don_hang] ([chi_tiet_don_hang_id], [don_hang_id], [san_pham_id], [so_luong], [gia_ban]) VALUES (4, 4, 1021, 3, 156.0000)
INSERT [dbo].[chi_tiet_don_hang] ([chi_tiet_don_hang_id], [don_hang_id], [san_pham_id], [so_luong], [gia_ban]) VALUES (5, 1, 1023, 1, 169.0000)
SET IDENTITY_INSERT [dbo].[chi_tiet_don_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[dich_vu] ON 

INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (2, N'Dịch vụ 2', N'Mô tả dịch vụ thứ 2', 200.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (4, N'Dịch vụ 3', N'Mô t? d?ch v? th? 3', 13000.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (5, N'Combo tắm + mát xa', N'tắm tinh dầu + mát xa ', 199.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (6, N'Cắt tạo kiểu toàn thân', N'tạo kiểu + nhuộm theo yêu cầu', 499.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (7, N'Nhuộm lông', N'thuốc nhuộm thiên nhiên an toàn', 195.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (8, N'Cắt + mài móng', N'cắt mài móng', 55.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (9, N'Vệ sinh tai', N'làm sạch tai', 55.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (10, N'Nhuộm tai 1', N'nhuộm 1 màu', 220.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (11, N'Nhuộm tai 2', N'nhuộm khác màu', 250.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (12, N'Nhuộm đuôi', N'', 150.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (13, N'Nhuộm 4 chân 1', N'nhuộm 4 chân 1 màu', 320.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (15, N'Nhuộm 4 chân 2  ', N'nhuộm khác màu tùy chọn', 380.0000, NULL)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia], [trang_thai]) VALUES (16, N'Tắm trị ve', N'dùng thuốc tắm TERRINO', 55.0000, NULL)
SET IDENTITY_INSERT [dbo].[dich_vu] OFF
GO
SET IDENTITY_INSERT [dbo].[don_hang] ON 

INSERT [dbo].[don_hang] ([don_hang_id], [nguoi_dung_id], [ngay_dat_hang], [tong_gia_tri]) VALUES (1, 1, CAST(N'2023-05-30' AS Date), 100.0000)
INSERT [dbo].[don_hang] ([don_hang_id], [nguoi_dung_id], [ngay_dat_hang], [tong_gia_tri]) VALUES (2, 2, CAST(N'2023-05-30' AS Date), 150.0000)
INSERT [dbo].[don_hang] ([don_hang_id], [nguoi_dung_id], [ngay_dat_hang], [tong_gia_tri]) VALUES (3, 11, CAST(N'2023-05-03' AS Date), 123.0000)
INSERT [dbo].[don_hang] ([don_hang_id], [nguoi_dung_id], [ngay_dat_hang], [tong_gia_tri]) VALUES (4, 15, CAST(N'2023-05-06' AS Date), 523.0000)
INSERT [dbo].[don_hang] ([don_hang_id], [nguoi_dung_id], [ngay_dat_hang], [tong_gia_tri]) VALUES (5, 12, CAST(N'2023-05-07' AS Date), 1012.0000)
INSERT [dbo].[don_hang] ([don_hang_id], [nguoi_dung_id], [ngay_dat_hang], [tong_gia_tri]) VALUES (6, 15, CAST(N'2023-05-09' AS Date), 56.0000)
INSERT [dbo].[don_hang] ([don_hang_id], [nguoi_dung_id], [ngay_dat_hang], [tong_gia_tri]) VALUES (7, 15, CAST(N'2023-05-15' AS Date), 320.0000)
SET IDENTITY_INSERT [dbo].[don_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[donhang_dichvu] ON 

INSERT [dbo].[donhang_dichvu] ([donhang_dichvu_id], [donhang_id], [dichvu_id]) VALUES (2, 2, 2)
INSERT [dbo].[donhang_dichvu] ([donhang_dichvu_id], [donhang_id], [dichvu_id]) VALUES (4, 5, 6)
INSERT [dbo].[donhang_dichvu] ([donhang_dichvu_id], [donhang_id], [dichvu_id]) VALUES (6, 3, 7)
INSERT [dbo].[donhang_dichvu] ([donhang_dichvu_id], [donhang_id], [dichvu_id]) VALUES (7, 3, 6)
SET IDENTITY_INSERT [dbo].[donhang_dichvu] OFF
GO
SET IDENTITY_INSERT [dbo].[giohang] ON 

INSERT [dbo].[giohang] ([gio_hang_id], [nguoidung_id], [ngay_tao]) VALUES (1, 1, CAST(N'2023-05-30T10:00:00.000' AS DateTime))
INSERT [dbo].[giohang] ([gio_hang_id], [nguoidung_id], [ngay_tao]) VALUES (2, 2, CAST(N'2023-05-30T11:00:00.000' AS DateTime))
INSERT [dbo].[giohang] ([gio_hang_id], [nguoidung_id], [ngay_tao]) VALUES (3, 13, CAST(N'2023-05-06T09:00:00.000' AS DateTime))
INSERT [dbo].[giohang] ([gio_hang_id], [nguoidung_id], [ngay_tao]) VALUES (4, 12, CAST(N'2023-05-11T20:00:00.000' AS DateTime))
INSERT [dbo].[giohang] ([gio_hang_id], [nguoidung_id], [ngay_tao]) VALUES (5, 15, CAST(N'2023-05-11T20:30:00.000' AS DateTime))
INSERT [dbo].[giohang] ([gio_hang_id], [nguoidung_id], [ngay_tao]) VALUES (6, 11, CAST(N'2023-05-11T20:49:00.000' AS DateTime))
INSERT [dbo].[giohang] ([gio_hang_id], [nguoidung_id], [ngay_tao]) VALUES (7, 18, CAST(N'2023-05-12T08:00:00.000' AS DateTime))
INSERT [dbo].[giohang] ([gio_hang_id], [nguoidung_id], [ngay_tao]) VALUES (8, 20, CAST(N'2023-05-12T12:03:00.000' AS DateTime))
INSERT [dbo].[giohang] ([gio_hang_id], [nguoidung_id], [ngay_tao]) VALUES (9, 19, CAST(N'2023-05-12T19:39:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[giohang] OFF
GO
SET IDENTITY_INSERT [dbo].[giohang_sanpham] ON 

INSERT [dbo].[giohang_sanpham] ([giohang_sanpham_id], [giohang_id], [sanpham_id], [so_luong]) VALUES (1, 1, 1, 2)
INSERT [dbo].[giohang_sanpham] ([giohang_sanpham_id], [giohang_id], [sanpham_id], [so_luong]) VALUES (2, 3, 1024, 1)
INSERT [dbo].[giohang_sanpham] ([giohang_sanpham_id], [giohang_id], [sanpham_id], [so_luong]) VALUES (3, 2, 1023, 5)
INSERT [dbo].[giohang_sanpham] ([giohang_sanpham_id], [giohang_id], [sanpham_id], [so_luong]) VALUES (5, 5, 1023, 6)
SET IDENTITY_INSERT [dbo].[giohang_sanpham] OFF
GO
SET IDENTITY_INSERT [dbo].[kho] ON 

INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1, 1, 10, 40.5000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1018, 1020, 10, 12000.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1019, 1023, 0, 61.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1020, 1024, 33, 103.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1021, 1021, 16, 20.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1022, 1032, 3, 30.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1023, 1029, 50, 15.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1024, 1035, 30, 50.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1025, 1036, 15, 30.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1026, 1028, 2, 30.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1027, 1029, 6, 15.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1028, 1030, 8, 213.0000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1029, 1031, 63, 23.0000)
SET IDENTITY_INSERT [dbo].[kho] OFF
GO
SET IDENTITY_INSERT [dbo].[magiamgia] ON 

INSERT [dbo].[magiamgia] ([id], [ma], [gia_tri], [ngay_bat_dau], [ngay_ket_thuc], [so_luong_san_pham]) VALUES (1, N'MGG1', 50.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 100)
INSERT [dbo].[magiamgia] ([id], [ma], [gia_tri], [ngay_bat_dau], [ngay_ket_thuc], [so_luong_san_pham]) VALUES (2, N'MGG2', 100.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 200)
INSERT [dbo].[magiamgia] ([id], [ma], [gia_tri], [ngay_bat_dau], [ngay_ket_thuc], [so_luong_san_pham]) VALUES (3, N'MGG3', 20.0000, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-01' AS Date), 50)
INSERT [dbo].[magiamgia] ([id], [ma], [gia_tri], [ngay_bat_dau], [ngay_ket_thuc], [so_luong_san_pham]) VALUES (4, N'MGG4', 10.0000, CAST(N'2023-05-06' AS Date), CAST(N'2023-05-09' AS Date), 100)
INSERT [dbo].[magiamgia] ([id], [ma], [gia_tri], [ngay_bat_dau], [ngay_ket_thuc], [so_luong_san_pham]) VALUES (6, N'MGG5', 25.0000, CAST(N'2023-05-15' AS Date), CAST(N'2023-05-16' AS Date), 50)
INSERT [dbo].[magiamgia] ([id], [ma], [gia_tri], [ngay_bat_dau], [ngay_ket_thuc], [so_luong_san_pham]) VALUES (7, N'MGG6', 100.0000, CAST(N'2023-05-30' AS Date), CAST(N'2023-05-31' AS Date), 10)
SET IDENTITY_INSERT [dbo].[magiamgia] OFF
GO
SET IDENTITY_INSERT [dbo].[nguoidung] ON 

INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (1, N'user1', N'pass1', N'user1@example.com', N'User1', N'Cần Thơ', N'123456789', 1, 1)
INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (2, N'user2', N'pass2', N'user2@example.com', N'User2', N'Cần Thơ', N'987654321', 1, 0)
INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (11, N'dang00gm', N'123', N'dazai220603@gmail.com', N'Nguyễn Hải Đăng', N'Vĩnh Long', N'0342532576', 1, 1)
INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (12, N'dang000gm', N'123', N'dangnhpc03033@gmail.com', N'Nguyễn Hải Đăng', N'Vĩnh Long', N'0342532576', 1, 1)
INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (13, N'Rysanji', N'123', N'dangnhpc03033@gmail.com', N'Nguyễn Hải Đăng', N'Vĩnh Long', N'0342532576', 1, 0)
INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (14, N'Rysanji1', N'pass1', N'dangnhpc03033@gmail.com', N'Nguyễn Hải Đăng', N'Vĩnh Long', N'0342532576', 1, 1)
INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (15, N'kimyen', N'333', N'kim333@gmail.com', N'kim yến', N'Bạc Liêu', N'0123456', 1, 1)
INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (16, N'hiếu88', N'88888888', N'hieu88@gamil.com', N'hiếu đại ca', N'Cần Thơ', N'0123456456', 1, 1)
INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (18, N'LyTieuLong', N'123456', N'lytieuling@gmail.com', N'Lý Tiểu Long', N'Trung Quốc', N'035469878', 1, 1)
INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (19, N'doreamon', N'656565', N'doreamon@gmail.com', N'Doreamon', N'Nhật Bản', N'0365654565', 1, 0)
INSERT [dbo].[nguoidung] ([nguoi_dung_id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu], [khoa]) VALUES (20, N'NgoKhong', N'231', N'ngokong@gmail.com', N'Tôn NGộ Không', N'Trung Quốc', N'031655889', 1, 1)
SET IDENTITY_INSERT [dbo].[nguoidung] OFF
GO
SET IDENTITY_INSERT [dbo].[nguoidung_dichvu] ON 

INSERT [dbo].[nguoidung_dichvu] ([nguoidung_dichvu_id], [nguoidung_id], [dichvu_id]) VALUES (2, 2, 2)
INSERT [dbo].[nguoidung_dichvu] ([nguoidung_dichvu_id], [nguoidung_id], [dichvu_id]) VALUES (3, 12, 6)
INSERT [dbo].[nguoidung_dichvu] ([nguoidung_dichvu_id], [nguoidung_id], [dichvu_id]) VALUES (5, 15, 5)
INSERT [dbo].[nguoidung_dichvu] ([nguoidung_dichvu_id], [nguoidung_id], [dichvu_id]) VALUES (6, 14, 7)
SET IDENTITY_INSERT [dbo].[nguoidung_dichvu] OFF
GO
SET IDENTITY_INSERT [dbo].[nhacungcap] ON 

INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (1, N'Nhà cung cấp thứ 1', N'Vĩnh Long', N'111111111', N'nhacungcap1@example.com')
INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (2, N'Nhà cung cấp thứ 2', N'An Giang', N'222222222', N'nhacungcap2@example.com')
INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (3, N'Nhà cung cấp thứ 3', N'Cần Thơ', N'0123456789', N'ncc3@gmail.com')
INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (4, N'Nhà cung cấp thứ 4', N'Bạc Liêu', N'0654321', N'4444@gmail.com')
INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (5, N'HM', N'Q4, TP HCM', N'012345678', N'hmq4@gmail.com')
INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (6, N'F&B PET', N'Đà Lạt', N'02365489', N'fbpet@gmail.com')
INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (7, N'GARENA', N'Q3, Tp HCM', N'0345687998', N'garena@gmail.com')
INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (8, N'Highlands pet', N'Bình Tân, Tp HCM', N'077779663', N'highlands@gmail.com')
INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (9, N'Fpt pet', N'Cần Thơ', N'065896555', N'fptpetct@gmail.com')
INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (10, N'Tomorrow pet', N'Q10, Tp HCM', N'023225656', N'tomorrowpet@gmail.com')
SET IDENTITY_INSERT [dbo].[nhacungcap] OFF
GO
SET IDENTITY_INSERT [dbo].[phuong_thuc_thanh_toan] ON 

INSERT [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id], [don_hang_id]) VALUES (1, 1)
INSERT [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id], [don_hang_id]) VALUES (2, 2)
INSERT [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id], [don_hang_id]) VALUES (3, 6)
INSERT [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id], [don_hang_id]) VALUES (4, 3)
INSERT [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id], [don_hang_id]) VALUES (5, 5)
SET IDENTITY_INSERT [dbo].[phuong_thuc_thanh_toan] OFF
GO
SET IDENTITY_INSERT [dbo].[sanpham] ON 

INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1, N'Sản phẩm thứ 1', CAST(50.50 AS Decimal(10, 2)), N'Mô tả sản phẩm 1', N'Ảnh chụp màn hình 2023-05-30 204425.png', 1, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1020, N'Sản phẩm thứ 3', CAST(13000.00 AS Decimal(10, 2)), N'', N'Planet9_Wallpaper_5000x2813 - Sao chép.jpg', 1, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1021, N'Cám', CAST(57.00 AS Decimal(10, 2)), N'thơm ngon hảo hảo', NULL, 3, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1023, N'Thịt gà xoay nén', CAST(169.00 AS Decimal(10, 2)), N'gà xoay + rau tổng hợp', NULL, 4, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1024, N'Hạt ăn', CAST(99.00 AS Decimal(10, 2)), N'Thịt + rau xoay tổng hợp', NULL, 3, 1)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1025, N'Bạt hà dạng xịt 14g', CAST(65.00 AS Decimal(10, 2)), N'Thơm miệng dễ hun', NULL, 5, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1026, N'Snack mèo', CAST(30.00 AS Decimal(10, 2)), N'ngon ơi là ngon', NULL, 5, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1027, N'Cá nhồi', CAST(70.00 AS Decimal(10, 2)), N'y chang cá thiệt', NULL, 2, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1028, N'Catnip gắn tường', CAST(55.00 AS Decimal(10, 2)), N'liếm mỏi miệng chưa hết', NULL, 4, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1029, N'Bạc hà mèo ống 20g', CAST(38.00 AS Decimal(10, 2)), N'cực chill cho meo', NULL, 4, 1)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1030, N'Khai trồng cỏ mèo', CAST(365.00 AS Decimal(10, 2)), N'xanh tươi luôn', NULL, 2, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1031, N'Hạt cho mèo trưởng thành, cá ngừ', CAST(52.00 AS Decimal(10, 2)), N'vị cá ngừ', NULL, 5, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1032, N'Hạt tổng hợp cho mọi độ tuổi', CAST(59.00 AS Decimal(10, 2)), N'nguyên liệu tổng hợp', NULL, 5, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1035, N'Hạt khô cho mèo con', CAST(85.00 AS Decimal(10, 2)), N'từ 1 đến 2 tháng tuổi', NULL, 3, NULL)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id], [trang_thai]) VALUES (1036, N'Hạt khô cho mèo con,vị gà', CAST(53.00 AS Decimal(10, 2)), N'vị gà', NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[sanpham] OFF
GO
SET IDENTITY_INSERT [dbo].[sanpham_magiamgia] ON 

INSERT [dbo].[sanpham_magiamgia] ([sanpham_magiamgia_id], [sanpham_id], [magiamgia_id]) VALUES (1, 1020, 3)
INSERT [dbo].[sanpham_magiamgia] ([sanpham_magiamgia_id], [sanpham_id], [magiamgia_id]) VALUES (2, 1021, 1)
INSERT [dbo].[sanpham_magiamgia] ([sanpham_magiamgia_id], [sanpham_id], [magiamgia_id]) VALUES (3, 1024, 2)
SET IDENTITY_INSERT [dbo].[sanpham_magiamgia] OFF
GO
SET IDENTITY_INSERT [dbo].[thanh_toan_khi_nhan_hang] ON 

INSERT [dbo].[thanh_toan_khi_nhan_hang] ([thanh_toan_id], [phuong_thuc_id], [dia_chi_giao_hang], [ngay_giao_hang]) VALUES (9, 3, N'cà mau', CAST(N'2023-05-03' AS Date))
INSERT [dbo].[thanh_toan_khi_nhan_hang] ([thanh_toan_id], [phuong_thuc_id], [dia_chi_giao_hang], [ngay_giao_hang]) VALUES (10, 5, N'gò vấp', CAST(N'2023-05-06' AS Date))
INSERT [dbo].[thanh_toan_khi_nhan_hang] ([thanh_toan_id], [phuong_thuc_id], [dia_chi_giao_hang], [ngay_giao_hang]) VALUES (15, 5, N'gò vấp', CAST(N'2023-05-06' AS Date))
INSERT [dbo].[thanh_toan_khi_nhan_hang] ([thanh_toan_id], [phuong_thuc_id], [dia_chi_giao_hang], [ngay_giao_hang]) VALUES (31, 5, N'an giang', CAST(N'2023-05-15' AS Date))
SET IDENTITY_INSERT [dbo].[thanh_toan_khi_nhan_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[thanh_toan_qua_the] ON 

INSERT [dbo].[thanh_toan_qua_the] ([thanh_toan_id], [phuong_thuc_id], [so_the], [ngay_het_han], [ma_bao_mat]) VALUES (1, 1, N'1234567812345678', CAST(N'2024-12-31' AS Date), N'123')
INSERT [dbo].[thanh_toan_qua_the] ([thanh_toan_id], [phuong_thuc_id], [so_the], [ngay_het_han], [ma_bao_mat]) VALUES (2, 2, N'8765432187654321', CAST(N'2024-12-31' AS Date), N'321')
INSERT [dbo].[thanh_toan_qua_the] ([thanh_toan_id], [phuong_thuc_id], [so_the], [ngay_het_han], [ma_bao_mat]) VALUES (3, 4, N'333432187654321', CAST(N'2026-03-15' AS Date), N'124')
SET IDENTITY_INSERT [dbo].[thanh_toan_qua_the] OFF
GO
ALTER TABLE [dbo].[chi_tiet_don_hang]  WITH CHECK ADD FOREIGN KEY([don_hang_id])
REFERENCES [dbo].[don_hang] ([don_hang_id])
GO
ALTER TABLE [dbo].[chi_tiet_don_hang]  WITH CHECK ADD  CONSTRAINT [FK__chi_tiet___san_p__6383C8BA] FOREIGN KEY([san_pham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[chi_tiet_don_hang] CHECK CONSTRAINT [FK__chi_tiet___san_p__6383C8BA]
GO
ALTER TABLE [dbo].[don_hang]  WITH CHECK ADD  CONSTRAINT [FK__don_hang__nguoi___4BAC3F29] FOREIGN KEY([nguoi_dung_id])
REFERENCES [dbo].[nguoidung] ([nguoi_dung_id])
GO
ALTER TABLE [dbo].[don_hang] CHECK CONSTRAINT [FK__don_hang__nguoi___4BAC3F29]
GO
ALTER TABLE [dbo].[donhang_dichvu]  WITH CHECK ADD  CONSTRAINT [FK__donhang_d__dichv__4F7CD00D] FOREIGN KEY([dichvu_id])
REFERENCES [dbo].[dich_vu] ([id])
GO
ALTER TABLE [dbo].[donhang_dichvu] CHECK CONSTRAINT [FK__donhang_d__dichv__4F7CD00D]
GO
ALTER TABLE [dbo].[donhang_dichvu]  WITH CHECK ADD FOREIGN KEY([donhang_id])
REFERENCES [dbo].[don_hang] ([don_hang_id])
GO
ALTER TABLE [dbo].[giohang]  WITH CHECK ADD  CONSTRAINT [FK__giohang__nguoidu__44FF419A] FOREIGN KEY([nguoidung_id])
REFERENCES [dbo].[nguoidung] ([nguoi_dung_id])
GO
ALTER TABLE [dbo].[giohang] CHECK CONSTRAINT [FK__giohang__nguoidu__44FF419A]
GO
ALTER TABLE [dbo].[giohang_sanpham]  WITH CHECK ADD FOREIGN KEY([giohang_id])
REFERENCES [dbo].[giohang] ([gio_hang_id])
GO
ALTER TABLE [dbo].[giohang_sanpham]  WITH CHECK ADD  CONSTRAINT [FK__giohang_s__sanph__48CFD27E] FOREIGN KEY([sanpham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[giohang_sanpham] CHECK CONSTRAINT [FK__giohang_s__sanph__48CFD27E]
GO
ALTER TABLE [dbo].[kho]  WITH CHECK ADD  CONSTRAINT [FK__kho__san_pham_id__4222D4EF] FOREIGN KEY([san_pham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[kho] CHECK CONSTRAINT [FK__kho__san_pham_id__4222D4EF]
GO
ALTER TABLE [dbo].[nguoidung_dichvu]  WITH CHECK ADD  CONSTRAINT [FK__nguoidung__dichv__571DF1D5] FOREIGN KEY([dichvu_id])
REFERENCES [dbo].[dich_vu] ([id])
GO
ALTER TABLE [dbo].[nguoidung_dichvu] CHECK CONSTRAINT [FK__nguoidung__dichv__571DF1D5]
GO
ALTER TABLE [dbo].[nguoidung_dichvu]  WITH CHECK ADD  CONSTRAINT [FK__nguoidung__nguoi__5629CD9C] FOREIGN KEY([nguoidung_id])
REFERENCES [dbo].[nguoidung] ([nguoi_dung_id])
GO
ALTER TABLE [dbo].[nguoidung_dichvu] CHECK CONSTRAINT [FK__nguoidung__nguoi__5629CD9C]
GO
ALTER TABLE [dbo].[phuong_thuc_thanh_toan]  WITH CHECK ADD FOREIGN KEY([don_hang_id])
REFERENCES [dbo].[don_hang] ([don_hang_id])
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD  CONSTRAINT [FK__sanpham__nha_cun__3F466844] FOREIGN KEY([nha_cung_cap_id])
REFERENCES [dbo].[nhacungcap] ([id])
GO
ALTER TABLE [dbo].[sanpham] CHECK CONSTRAINT [FK__sanpham__nha_cun__3F466844]
GO
ALTER TABLE [dbo].[sanpham_magiamgia]  WITH CHECK ADD FOREIGN KEY([magiamgia_id])
REFERENCES [dbo].[magiamgia] ([id])
GO
ALTER TABLE [dbo].[sanpham_magiamgia]  WITH CHECK ADD  CONSTRAINT [FK__sanpham_m__sanph__52593CB8] FOREIGN KEY([sanpham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[sanpham_magiamgia] CHECK CONSTRAINT [FK__sanpham_m__sanph__52593CB8]
GO
ALTER TABLE [dbo].[thanh_toan_khi_nhan_hang]  WITH CHECK ADD FOREIGN KEY([phuong_thuc_id])
REFERENCES [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id])
GO
ALTER TABLE [dbo].[thanh_toan_qua_the]  WITH CHECK ADD FOREIGN KEY([phuong_thuc_id])
REFERENCES [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id])
GO
USE [master]
GO
ALTER DATABASE [QLDV] SET  READ_WRITE 
GO
