USE [master]
GO
/****** Object:  Database [QLDV]    Script Date: 5/25/2023 2:08:07 PM ******/
CREATE DATABASE [QLDV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLDV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLDV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLDV] SET COMPATIBILITY_LEVEL = 160
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
ALTER DATABASE [QLDV] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLDV] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLDV]
GO
/****** Object:  Table [dbo].[chi_tiet_don_hang]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_don_hang](
	[don_hang_id] [int] NOT NULL,
	[san_pham_id] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[gia_ban] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[don_hang_id] ASC,
	[san_pham_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dichvu]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dichvu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_dich_vu] [nvarchar](255) NOT NULL,
	[mo_ta] [text] NULL,
	[gia] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[donhang]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donhang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nguoi_dung_id] [int] NOT NULL,
	[ngay_dat_hang] [date] NOT NULL,
	[tong_gia_tri] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[donhang_dichvu]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donhang_dichvu](
	[donhang_id] [int] NOT NULL,
	[dichvu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[donhang_id] ASC,
	[dichvu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giohang]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giohang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nguoidung_id] [int] NOT NULL,
	[ngay_tao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giohang_sanpham]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giohang_sanpham](
	[giohang_id] [int] NOT NULL,
	[sanpham_id] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[giohang_id] ASC,
	[sanpham_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kho]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[san_pham_id] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[gia_nhap] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[magiamgia]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[magiamgia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](50) NOT NULL,
	[gia_tri] [decimal](10, 2) NOT NULL,
	[ngay_bat_dau] [date] NOT NULL,
	[ngay_ket_thuc] [date] NOT NULL,
	[so_luong_san_pham] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoidung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_dang_nhap] [nvarchar](255) NOT NULL,
	[mat_khau] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[ho_ten] [nvarchar](255) NULL,
	[dia_chi] [nvarchar](255) NULL,
	[so_dien_thoai] [nvarchar](20) NULL,
	[chuc_vu] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoidung_dichvu]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoidung_dichvu](
	[nguoidung_id] [int] NOT NULL,
	[dichvu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nguoidung_id] ASC,
	[dichvu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhacungcap]    Script Date: 5/25/2023 2:08:07 PM ******/
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
/****** Object:  Table [dbo].[phuong_thuc_thanh_toan]    Script Date: 5/25/2023 2:08:07 PM ******/
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
/****** Object:  Table [dbo].[sanpham]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_san_pham] [nvarchar](255) NOT NULL,
	[gia] [decimal](10, 2) NOT NULL,
	[mo_ta] [text] NULL,
	[hinh_anh] [nvarchar](255) NULL,
	[nha_cung_cap_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham_magiamgia]    Script Date: 5/25/2023 2:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham_magiamgia](
	[sanpham_id] [int] NOT NULL,
	[magiamgia_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sanpham_id] ASC,
	[magiamgia_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_toan_khi_nhan_hang]    Script Date: 5/25/2023 2:08:07 PM ******/
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
/****** Object:  Table [dbo].[thanh_toan_qua_the]    Script Date: 5/25/2023 2:08:07 PM ******/
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
ALTER TABLE [dbo].[chi_tiet_don_hang]  WITH CHECK ADD FOREIGN KEY([don_hang_id])
REFERENCES [dbo].[donhang] ([id])
GO
ALTER TABLE [dbo].[chi_tiet_don_hang]  WITH CHECK ADD FOREIGN KEY([san_pham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[donhang]  WITH CHECK ADD FOREIGN KEY([nguoi_dung_id])
REFERENCES [dbo].[nguoidung] ([id])
GO
ALTER TABLE [dbo].[donhang_dichvu]  WITH CHECK ADD FOREIGN KEY([dichvu_id])
REFERENCES [dbo].[dichvu] ([id])
GO
ALTER TABLE [dbo].[donhang_dichvu]  WITH CHECK ADD FOREIGN KEY([donhang_id])
REFERENCES [dbo].[donhang] ([id])
GO
ALTER TABLE [dbo].[giohang]  WITH CHECK ADD FOREIGN KEY([nguoidung_id])
REFERENCES [dbo].[nguoidung] ([id])
GO
ALTER TABLE [dbo].[giohang_sanpham]  WITH CHECK ADD FOREIGN KEY([giohang_id])
REFERENCES [dbo].[giohang] ([id])
GO
ALTER TABLE [dbo].[giohang_sanpham]  WITH CHECK ADD FOREIGN KEY([sanpham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[kho]  WITH CHECK ADD FOREIGN KEY([san_pham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[nguoidung_dichvu]  WITH CHECK ADD FOREIGN KEY([dichvu_id])
REFERENCES [dbo].[dichvu] ([id])
GO
ALTER TABLE [dbo].[nguoidung_dichvu]  WITH CHECK ADD FOREIGN KEY([nguoidung_id])
REFERENCES [dbo].[nguoidung] ([id])
GO
ALTER TABLE [dbo].[phuong_thuc_thanh_toan]  WITH CHECK ADD  CONSTRAINT [FK_phuong_thuc_thanh_toan_donhang] FOREIGN KEY([don_hang_id])
REFERENCES [dbo].[donhang] ([id])
GO
ALTER TABLE [dbo].[phuong_thuc_thanh_toan] CHECK CONSTRAINT [FK_phuong_thuc_thanh_toan_donhang]
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD FOREIGN KEY([nha_cung_cap_id])
REFERENCES [dbo].[nhacungcap] ([id])
GO
ALTER TABLE [dbo].[sanpham_magiamgia]  WITH CHECK ADD FOREIGN KEY([magiamgia_id])
REFERENCES [dbo].[magiamgia] ([id])
GO
ALTER TABLE [dbo].[sanpham_magiamgia]  WITH CHECK ADD FOREIGN KEY([sanpham_id])
REFERENCES [dbo].[sanpham] ([id])
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
