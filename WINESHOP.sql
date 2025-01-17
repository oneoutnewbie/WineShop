USE [master]
GO
/****** Object:  Database [GlobalBrandAssignment]    Script Date: 11/7/2023 11:17:56 PM ******/
CREATE DATABASE [GlobalBrandAssignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GlobalBrandAssignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GlobalBrandAssignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GlobalBrandAssignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GlobalBrandAssignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GlobalBrandAssignment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GlobalBrandAssignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GlobalBrandAssignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GlobalBrandAssignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GlobalBrandAssignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GlobalBrandAssignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GlobalBrandAssignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GlobalBrandAssignment] SET  MULTI_USER 
GO
ALTER DATABASE [GlobalBrandAssignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GlobalBrandAssignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GlobalBrandAssignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GlobalBrandAssignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GlobalBrandAssignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [GlobalBrandAssignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GlobalBrandAssignment]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/7/2023 11:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
	[image] [text] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/7/2023 11:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [date] NULL,
	[total] [float] NULL,
	[notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/7/2023 11:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/7/2023 11:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[stock] [int] NULL,
	[category_id] [int] NULL,
	[img] [ntext] NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/7/2023 11:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[phone] [nchar](11) NULL,
	[role_id] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (1, N'Red Wine', N'https://ruouvang24h.vn/wp-content/uploads/2020/07/Top-10-Chai-R%C6%B0%E1%BB%A3u-Vang-%C4%90%E1%BB%8F.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (2, N'White Wine', N'https://www.thewinesociety.com/4a499c/globalassets/discovery/wine-basics/fresh_dry_whites_1200x675.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (3, N'Champagne', N'https://www.phanphoiruoungoai.net/wp-content/uploads/2020/08/tim-hieu-huong-vi-cua-ruou-champagne.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (4, N'Spirits', N'https://www.gentlemenranters.com/wp-content/uploads/2020/12/Alcohol-with-smoke-from-cigarette-768x614.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (5, N'Fortified Wine', N'https://www.houseoftownend.com/content/upload/port-blog.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (6, N'Sake', N'https://file.hstatic.net/200000662729/article/sake-japanese-beverage-bottles-still-life-min_80a0591e28aa4816b7c902173804502b.jpg')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (1, 7, CAST(N'2023-08-15' AS Date), 134, N'please carefully')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (2, 6, CAST(N'2023-10-23' AS Date), 54, N'please carefully')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (3, 2, CAST(N'2023-11-05' AS Date), 60, N'')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (1, 1, 2, 80, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (2, 1, 5, 18, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (3, 2, 3, 18, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (4, 3, 6, 20, 3)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (1, N'Cabernet Sauvignon', 115, 80, 1, N'https://ruoutot.net/s/ruou-vang-chile/vang-do-cabernet-sauvignon.jpg', N'Cabernet Sauvignon has flavors of black raspberries, plums, and a touch of spice.', CAST(N'2024-02-15' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (2, N'Merlot', 100, 99, 1, N'https://www.elenianna.com/images/thumbs/0006650_merlot-red-dry-750ml.jpeg', N'Merlot is a popular red wine, known for its smooth taste and easy drinking. It often has scents of raspberries, cherries and gentle spices.', CAST(N'2024-02-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (3, N'Pinot Noir', 180, 86, 1, N'https://freshvinewine.com/content/productimage/1_PINOTNOIR_SLIDER-min.png', N'Pinot Noir wines typically have a light red color and complex aromas of red fruit, fruit, and spices such as pepper and earthy notes.', CAST(N'2024-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (4, N'Shiraz/Syrah', 87, 50, 1, N'https://myowncuvee.com/wp-content/uploads/2016/03/shiraz_syrah.jpg', N'Shiraz wines typically have rich flavors of black fruits such as raspberries, cherries, and currants, accompanied by flavors of black pepper, spices, and herbal notes.', CAST(N'2024-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (16, N'Malbec', 187, 50, 1, N'https://winegroup.vn/wp-content/uploads/2022/07/Ruou-Vang-Alamos-Malbec.jpg', N'Malbec wine usually has a dense color and flavors of raspberry, black plum and pepper, accompanied by aromas of violets and herbal notes.', CAST(N'2024-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (5, N'Chardonnay', 118, 77, 2, N'https://winegroup.vn/wp-content/uploads/2023/05/Ruou-Vang-Moillard-Bourgogne-Chardonnay.jpg', N'Chardonnay is a popular white wine and is known for its variety. It can range in flavor from fresh fruit like apple and pear to buttery and walnut, with a color spectrum from pale yellow to deep yellow.', CAST(N'2024-03-02' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (6, N'Sauvignon Blanc', 200, 67, 2, N'https://ruouvangnhap.com/wp-content/uploads/2022/02/Cloudy-Bay-Sauvignon-Blanc-1.jpg', N'Sauvignon Blanc is famous for its fresh and characteristic aroma of fruits and herbs. Wines produced from this grape typically have bright, high-acid flavors, with aromas of lemon and citrus, along with a hint of weed and herbaceous notes.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (17, N'Riesling', 201, 67, 2, N'https://winecellar.vn/wp-content/uploads/2019/10/domaine-weinbach-riesling-2.jpg', N'Riesling can range from dry to sweet, depending on the wine growing region and production style. Riesling typically has a fresh and complex flavor, with aromas of floral fruits such as citrus, peach, pear, and honey.', CAST(N'2023-03-12' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (18, N'Pinot Grigio', 202, 67, 2, N'https://winecellar.vn/wp-content/uploads/2022/07/danzante-pinot-grigio-2021.jpg', N'Pinot Grigio is a popular white wine produced from Pinot Gris grapes. Known for its fresh fruitiness and complex aromas, Pinot Grigio often has flavors of fruits such as pear, apple and citrus, with a hint of minerality.', CAST(N'2023-03-10' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (7, N'Prosecco', 290, 90, 3, N'https://winecellar.vn/wp-content/uploads/2020/12/freixenet-prosecco.jpg', N'Prosecco is a sweet and refreshing sparkling wine, produced primarily from Glera grapes in the Veneto region, Italy. With complex aromas of fruits and flowers, Prosecco often has a light, easy-to-drink and attractive flavor.', CAST(N'2024-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (8, N'Cava', 790, 90, 3, N'https://winecellar.vn/wp-content/uploads/2020/10/freixenet-cordon-negro-gran-seleccion-brut-cava.jpg', N'Cava is a sweet and nutty sparkling wine, produced primarily from white grape varieties such as Macabeo, Parellada and Xarel·lo in the Cava region of Spain. Cava wine is usually pale yellow in color and has a fresh, fruity and floral aroma.', CAST(N'2024-03-07' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (9, N'Champagne', 300, 80, 3, N'https://sanhruou.com/media/2871/catalog/ruou-champagne-deutz-brut-classic.jpg', N'Champagne is a famous sparkling wine produced in the Champagne region of France. Made from key grape varieties such as Chardonnay, Pinot Noir and Pinot Meunier, Champagne has complex flavors, from fresh fruit notes to notes of toast and honey.', CAST(N'2024-03-04' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (10, N'Whiskey', 200, 100, 4, N'https://sanhruou.com/media/6844/catalog/Jim-Beam.jpg', N'Whiskey is a type of spirit distilled from grain, usually barley, wheat, barley, oats or corn. Aged in oak barrels for fermentation and aging, whiskey has a very unique and diverse taste, from sweet and gentle to strong and rich flavors.', CAST(N'2024-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (11, N'Vodka', 190, 200, 4, N'https://phuongloangourmet.com/wp-content/uploads/2023/11/Vodka-Absolut-pl.jpg', N'Vodka is a colorless and odorless spirit, usually made from barley, potatoes, or another grain. Popular around the world, vodka often has high alcohol content, from 35% to more than 50%.', CAST(N'2024-03-02' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (12, N'Rum', 200, 200, 4, N'https://winecellar.vn/wp-content/uploads/2023/06/the-original-islay-rum.jpg', N'Rum is a type of alcohol produced from a variety of different ingredients such as sugar cane, molasses, or other types of sugar. This type of wine usually ranges in color from clear to dark brown, depending on the fermentation and storage process.', CAST(N'2024-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (14, N'Tequila', 600, 100, 4, N'https://sanhruou.com/media/7612/catalog/Jose-Cuervo-Silver.jpg', N'Tequila is a typical Mexican alcohol, distilled from sugarcane juice. The main ingredient for tequila production is the fruit of the Agave tequilana tree. This type of wine often has a unique and strong flavor.', CAST(N'2024-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (15, N'Cognac', 400, 200, 4, N'https://vietgourmet.vn/wp-content/uploads/2023/09/Hennessy-VS-Cognac-1750-mL.jpg', N'Cognac is a premium brandy produced from grapes and aged in selected oak barrels. It is produced mainly in the Cognac region of France. Cognac often has rich, varied flavors from ripe fruit, vanilla, oak, and spices', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (19, N'Port', 200, 100, 5, N'https://cedarcreekwinery.com/wp-content/uploads/MagicEraser_230719_111810.png', N'Port is a strong sweet wine, originating from Portugal. Characterized by a rich, sugary flavor and strong tannin structure. Port is typically aged in wooden barrels and is often combined with nuts, dried fruit or chocolate.', CAST(N'2024-03-01' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (20, N'Sherry', 400, 100, 5, N'https://sanhruou.com/media/9428/catalog/Canasta-Cream-Sherry.jpg', N'Sherry is a fortified wine originating from the Jerez region in Spain. The special feature of Sherry is the special aging and mixing process, creating a wine with rich, rich and diverse flavors. Sherry can come in many different styles, from dry and light to sweet and rich.', CAST(N'2024-03-11' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (21, N'Madeira', 250, 100, 5, N'https://www.vinha.co.uk/wp-content/uploads/2023/07/106862.png', N'Madeira is a fortified wine originating from the Portuguese island of Madeira. The distinguishing feature of Madeira is its special aging process, in which the wine is stabilized at high temperatures for an extended period of time.', CAST(N'2024-03-09' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (22, N'Junmai', 100, 100, 6, N'https://ruounhat.com/wp-content/uploads/2023/03/Sake-Dassai-45-Junmai-Daiginjo-720ml.png', N'Junmai is a traditional Japanese sake, produced from rice, water and Koji yeast (a type of yeast). Junmai often has rich, complex flavors and aromas that clearly express the nature of the rice and the fermentation process.', CAST(N'2024-03-05' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (23, N'Ginjo', 90, 100, 6, N'https://sanhruou.com/media/7272/catalog/Sake-Aratama-720ml.jpg', N'Ginjo is a premium Japanese sake, produced from rice, water and Koji yeast. Unlike Junmai, Ginjo is produced using a special fermentation process where the rice is ground smaller and the Koji yeast is brewed at a lower temperature.', CAST(N'2024-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) 
VALUES (24, N'Daiginjo', 80, 100, 6, N'https://ruoubiangoai.vn/wp-content/uploads/2021/06/Ruou-Sake-Daiginjo-2.jpg', N'Daiginjo is a more premium form of Ginjo sake, produced from rice, water and Koji yeast using an extremely careful and meticulous fermentation process. Daiginjo typically has a light, elegant flavor and it symbol of luxury in Japanese sake culture.', CAST(N'2024-03-08' AS Date))

SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) 
VALUES (1, N'abc', N'abc@gmail.com', N'123', N'Ho Chi Minh', 1, N'0987654321 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) 
VALUES (2, N'admin', N'admin@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'AD')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) 
VALUES (3, N'hieu1', N'abc1@gmail.com', N'123', N'Nam dinh', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) 
VALUES (4, N'hieu2', N'abc2@gmail.com', N'123', N'Phap', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) 
VALUES (5, N'hieu3', N'abc3@gmail.com', N'123', N'Nam dinh', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) 
VALUES (6, N'hieu4', N'abc4@gmail.com', N'123', N'Anh', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) 
VALUES (7, N'hieu5', N'abc5@gmail.com', N'123', N'Ha Lan', 1, N'0123456789 ', N'US')


SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
USE [master]
GO
ALTER DATABASE [GlobalBrandAssignment] SET  READ_WRITE 
GO
