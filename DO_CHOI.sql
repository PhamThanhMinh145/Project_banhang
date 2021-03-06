USE [master]
GO
/****** Object:  Database [DO_CHOI]    Script Date: 3/19/2021 9:43:20 PM ******/
CREATE DATABASE [DO_CHOI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DO_CHOI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DO_CHOI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DO_CHOI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DO_CHOI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DO_CHOI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DO_CHOI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DO_CHOI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DO_CHOI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DO_CHOI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DO_CHOI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DO_CHOI] SET ARITHABORT OFF 
GO
ALTER DATABASE [DO_CHOI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DO_CHOI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DO_CHOI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DO_CHOI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DO_CHOI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DO_CHOI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DO_CHOI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DO_CHOI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DO_CHOI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DO_CHOI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DO_CHOI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DO_CHOI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DO_CHOI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DO_CHOI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DO_CHOI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DO_CHOI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DO_CHOI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DO_CHOI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DO_CHOI] SET  MULTI_USER 
GO
ALTER DATABASE [DO_CHOI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DO_CHOI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DO_CHOI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DO_CHOI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DO_CHOI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DO_CHOI] SET QUERY_STORE = OFF
GO
USE [DO_CHOI]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/19/2021 9:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/19/2021 9:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[Amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/19/2021 9:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/19/2021 9:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (1, N'minh', N'145', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (2, N'tam', N'123', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (3, N'ty', N'456', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (4, N'van', N'12345', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (5, N'linh', N'1111', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (6, N'anh', N'2222', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (7, N'cuong', N'3333', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (8, N'vy', N'4444', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (9, N'phung', N'5555', 1, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'ĐỒ CHƠI VẬN ĐỘNG')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'ĐỒ CHƠI TRÍ TUỆ')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'ĐỒ CHƠI PHƯƠNG TIỆN GIAO THÔNG')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'ĐỒ CHƠI NHÂN VẬT')
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (1, N'Xe điều khiển biến hình', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/magento/RASTAR/R74800_R74800-3/R74800_R74800-3_1.jpg', 735.0000, N'Xe điều khiển biến hình Mercedes-Benz Xám', N'Hàng chất lượng cao xuất xứ từ Trung Quốc , thương hiệu là RASTSTAR, với chất liệu là nhựa và kim loại , phù hợp với trẻ  em có giới tính nam từ 6 đến 11 tuổi ', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (2, N'Đồ chơi mô hình ', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/b/r/bru03570_5_1.jpg', 800.0000, N'Đồ chơi dạng mô hình  xe tải cần cẩu', N'sở hữu thiết kế giống như thật với những chi tiết mô phỏng tinh tế. Sản phẩm được trang bị hệ thống đèn và chuông báo hiệu kích thích sự tò mò của bé. Sản phẩm chắc chắn sẽ là một món quà ý nghĩa mà bố mẹ dành tặng cho bé nhất là những bé yêu thích mô hình xe đồ chơi.', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (3, N'Bộ đồ chơi bác sĩ thú cưng', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/magento/BATTAT/BT2538Z/BT2538Z_2.jpg', 779.0000, N'Bộ đồ chơi bác sĩ thú cưng', N' Sản phẩm được làm từ chất liệu nhựa cao cấp, an toàn với bé khi chơi. Bộ đồ chơi bao gồm các bộ phận mô phỏng dụng cụ y khoa rất sinh động, giúp bé vừa có khoảng thời gian vui chơi thú vị và bổ ích, Bộ đồ chơi bao gồm 11 dụng cụ như kéo, kẹp, nhíp, gương, búa, ống nghe, nhiệt kế, ống tiêm, khay... được thiết kế sinh động như thật làm cho bé thích thú hơn khi chơi.', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (4, N'Máy bay lắp ráp', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/magento/SUPERWINGS/YW710320/YW710320_1.jpg', 300.0000, N'Máy bay lắp ráp - Donnie Thông Minh', N'Đồ chơi máy bay lắp ráp Super Wings có 2 lựa chọn nhân vật: Jett và Donnie. Sản phẩm gồm 12 bộ phận riêng biệt tách rời, có thể lắp ráp lại để thành máy bay hoặc robot. Tích hợp đèn và âm thanh. Đặc biệt, sản phẩm kèm theo hai miếng ghép phần “mắt” và “miệng” khác nhau, tạo thành hai biểu cảm gương mặt khác nhau cho mỗi nhân vật.', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (5, N'Mô hình lắp ráp', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/magento/LEGO_CITY/7744/7744_1.jpg', 890.0000, N'Mô hình lắp ráp Police Station', N'Thương hiệu của LEGOCITY, phù hợp cho trẻ nhỏ từ 6-12 tuổi, với những chi tiết được khắc họa nhiều màu sắc giúp cho bé khám phá và mở mang trí tuệ ', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (6, N'Mô hình lắp ráp', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/magento/LEGO_NEXO_KNIGHTS/70351/70351_2.jpg', 2000.0000, N'Cỗ Máy Đại Bàng Của Clay', N'Cỗ Máy Đại Bàng Của Clay LEGO 70351 gồm 523 chi tiết cho phép bé tham gia và tiêu diệt quái vật đá Grimroc cùng cỗ máy đại bàng của Clay - với thiết kế đôi cánh có thể mở rộng và được trang bị bộ phận súng bắn hai bên. Thông qua quá trình lắp ráp cùng bộ xếp hình LEGO, bé không chỉ phát huy óc tư duy linh hoạt mà còn rèn luyện được tính kiên nhẫn và trải nghiệm những câu chuyên phiêu lưu thú vị do chính mình tưởng tượng ra.', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (7, N'Xe tải kéo container', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/3/9/3921_02.jpg', 999.0000, N'Xe tải kéo container', N'Đồ Chơi Mô Hình Siku được làm từ chất liệu nhựa và hợp kim cao cấp, không chứa BPA cùng các chất hóa học độc hại khác. Chất liệu này chống gỉ sét tốt, phủ lớp màu sơn thực phẩm đẹp mắt, đảm bảo an toàn sức khỏe cho bé.
Món đồ chơi giúp bé rèn luyện kỹ năng sử dụng đôi tay khéo léo và dạy cho bé cách nhạy bén, cùng tư duy sáng tạo để xây nên dựng những câu chuyện thú vị khi chơi cùng mô hình xe.', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (9, N'Xe điều khiển ', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/magento/RASTAR/R75400_R75400-3/R75400_R75400-3_1.jpg', 500.0000, N'Xe điều khiển Pagani có thể mở cửa Trắng', N'Hàng chất lượng cao xuất xứ từ Trung Quốc , thương hiệu là RASTSTAR, với chất liệu là nhựa và kim loại , phù hợp với trẻ  em có giới tính nam từ 6 đến 11 tuổi ', 3, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (10, N'Robot biến hình ', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/magento/SUPERWINGS/YW720315/YW720315_1.jpg', 599.0000, N'Robot biến hình kết hợp xe cứu hộ nhỏ - Cảnh Sát Paul', N'Biến đổi dễ dàng từ robot cao gần 7 inch thành xe cứu hộ nhỏ qua 3 bước biến hình đơn giản.Với bánh xe cao su và thang cứu hộ mở rộng tạo cảm giác chân thật khi chơi.Kích thích tư duy thông qua trò chơi, rèn luyện ngón tay và trí tưởng tượng của bé khi hoá thân vào nhân vật yêu thích.', 4, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (11, N'Búp bê', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/magento/BABY_ALIVE/E0635/E0635_1.jpg', 450.0000, N'BÉ CƯNG TẬP ĂN DẶM - PETER', N'Bé cưng tặp ăn dặm - Peter là búp bê bé trai, giúp bé học cách chăm em trai giúp em để hiểu mẹ và yêu em trai hơn.', 4, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (12, N'Thú nhồi bông', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/magento/MY_LITTLE_PONY/B9820_C2708/B9820_C2708_1.jpg', 209.0000, N'Pony Bông - Chiến Binh Lấp Lánh', N'Sản phẩm là nhân vật Pony từ bộ phim hoạt hình nổi tiếng My Little Pony của Mỹ. Với chất liệu siêu mềm cho bé có thể ôm dễ dàng. Nàng ngựa xinh đẹp này đã sẵn sàng để chia sẻ cuộc phiêu lưu và vui vẻ với bạn! Mỗi Pony đều có cá tính riêng của mình - hãy chọn một Pony hoặc sưu tập trọn bộ Pony Bộng mà bé yêu thích nhé.', 4, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (13, N'Đường đua thần tốc', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/magento/ECOIFFIER/003079/003079_3.jpg', 699.0000, N'Đường đua thần tốc 1', N'gồm các mảnh ghép và 4 chiếc xe, 1 máy bay để bé ráp thành mô hình, giúp phát triển kĩ năng tư duy logic, vận động tinh', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (16, N'Đồ chơi dạng mô hình xe cứu hỏa ', N'https://u6wdnj9wggobj.vcdn.cloud/media/catalog/product/cache/95cb36d3254e0a20b33361b06e7c0ce9/f/_/f_03590_22.jpg', 999000.0000, N'Đồ chơi dạng mô hình xe cứu hỏa ', N'Đồ chơi dạng mô hình theo tỷ lệ thu nhỏ 1:16 xe cứu hỏa thang là một trong những sản phẩm cực kì chất lượng của hãng đồ chơi nổi tiếng BRUDER. Phiên bản này có tính năng mới thú vị trong dãy phòng cháy của BRUDER là động cơ cháy của Scania R-series với thang. Cũng như nhiều chi tiết nhỏ như mở cửa và gương gấp lại, chiếc xe có một bể chứa tích hợp có thể dễ dàng lấp đầy. Với bốn chức năng khác nhau thang xoay, mở cửa, mở nắp ca-pô, xoay gương ngay cabin tài xế, cuộn vòi nước bằng một tay quay, 4 chân chống vững chắc hỗ trợ phía dưới, bể chứa nước và hệ thống bơm hoạt động được.', 3, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Category]
GO
USE [master]
GO
ALTER DATABASE [DO_CHOI] SET  READ_WRITE 
GO
