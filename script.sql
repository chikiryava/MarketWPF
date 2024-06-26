USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 26.03.2024 20:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPointId] [int] NOT NULL,
	[ReceiptCode] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 26.03.2024 20:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A2662F17505A8] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 26.03.2024 20:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusId] [int] NOT NULL,
	[OrderStatusName] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 26.03.2024 20:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickUpId] [int] IDENTITY(1,1) NOT NULL,
	[Index] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NULL,
	[Adress] [nvarchar](max) NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickUpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.03.2024 20:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductUnit] [int] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[ProductManufacturerId] [int] NOT NULL,
	[ProductCost] [int] NOT NULL,
	[ProductDiscountAmount] [int] NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductProviderId] [int] NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__2EA7DCD52E51452C] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 26.03.2024 20:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[CategriesId] [int] NOT NULL,
	[CategoriesName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[CategriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductManufactures]    Script Date: 26.03.2024 20:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductManufactures](
	[ManufacturerId] [int] NOT NULL,
	[ManufacturerName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductManufactures] PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductProviders]    Script Date: 26.03.2024 20:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductProviders](
	[ProviderId] [int] NOT NULL,
	[ProviderName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductProviders] PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductUnits]    Script Date: 26.03.2024 20:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUnits](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductUnits] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26.03.2024 20:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26.03.2024 20:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderDeliveryDate], [OrderPickupPointId], [ReceiptCode], [OrderDate], [UserId]) VALUES (1, 1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 27, 811, CAST(N'2022-05-10T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderDeliveryDate], [OrderPickupPointId], [ReceiptCode], [OrderDate], [UserId]) VALUES (2, 1, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 5, 812, CAST(N'2022-05-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderDeliveryDate], [OrderPickupPointId], [ReceiptCode], [OrderDate], [UserId]) VALUES (3, 1, CAST(N'2022-05-18T00:00:00.000' AS DateTime), 29, 813, CAST(N'2022-05-12T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderDeliveryDate], [OrderPickupPointId], [ReceiptCode], [OrderDate], [UserId]) VALUES (4, 1, CAST(N'2022-05-19T00:00:00.000' AS DateTime), 10, 814, CAST(N'2022-05-13T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderDeliveryDate], [OrderPickupPointId], [ReceiptCode], [OrderDate], [UserId]) VALUES (5, 1, CAST(N'2022-05-20T00:00:00.000' AS DateTime), 31, 815, CAST(N'2022-05-14T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderDeliveryDate], [OrderPickupPointId], [ReceiptCode], [OrderDate], [UserId]) VALUES (6, 1, CAST(N'2022-05-21T00:00:00.000' AS DateTime), 32, 816, CAST(N'2022-05-15T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderDeliveryDate], [OrderPickupPointId], [ReceiptCode], [OrderDate], [UserId]) VALUES (7, 1, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 20, 817, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderDeliveryDate], [OrderPickupPointId], [ReceiptCode], [OrderDate], [UserId]) VALUES (8, 2, CAST(N'2022-05-23T00:00:00.000' AS DateTime), 34, 818, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderDeliveryDate], [OrderPickupPointId], [ReceiptCode], [OrderDate], [UserId]) VALUES (9, 1, CAST(N'2022-05-24T00:00:00.000' AS DateTime), 35, 819, CAST(N'2022-05-18T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderDeliveryDate], [OrderPickupPointId], [ReceiptCode], [OrderDate], [UserId]) VALUES (10, 2, CAST(N'2022-05-25T00:00:00.000' AS DateTime), 36, 820, CAST(N'2022-05-19T00:00:00.000' AS DateTime), 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'B111C5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'T238C7', 7)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'E112C6', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'T238C7', 9)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'L293S9', 8)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'M112C8', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'M294G9', 6)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'S384K2', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'Q836H4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'W874J3', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'O947D8', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'R983K4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'H497J3', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'N394K2', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'P495H8', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'X846D3', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'K284U8', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'V378J3', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'I483H3', 7)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'N387I8', 6)
GO
INSERT [dbo].[OrderStatus] ([OrderStatusId], [OrderStatusName]) VALUES (1, N'Новый 
')
INSERT [dbo].[OrderStatus] ([OrderStatusId], [OrderStatusName]) VALUES (2, N'Завершен')
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (1, N'344288', N' г. Кропоткин', N' ул. Чехова 1')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (2, N'614164', N' г.Кропоткин', N'  ул. Степная 30')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (3, N'394242', N' г. Кропоткин', N' ул. Коммунистическая  43')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (4, N'660540', N' г. Кропоткин', N' ул. Солнечная 25')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (5, N'125837', N' г. Кропоткин', N' ул. Шоссейная 40')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (6, N'125703', N' г. Кропоткин', N' ул. Партизанская 49')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (7, N'625283', N' г. Кропоткин', N' ул. Победы 46')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (8, N'614611', N' г. Кропоткин', N' ул. Молодежная 50')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (9, N'454311', N' г.Кропоткин', N' ул. Новая 19')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (10, N'660007', N' г.Кропоткин', N' ул. Октябрьская 19')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (11, N'603036', N' г. Кропоткин', N' ул. Садовая 4')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (12, N'450983', N' г.Кропоткин', N' ул. Комсомольская 26')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (13, N'394782', N' г. Кропоткин', N' ул. Чехова 3')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (14, N'603002', N' г. Кропоткин', N' ул. Дзержинского 28')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (15, N'450558', N' г. Кропоткин', N' ул. Набережная 30')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (16, N'394060', N' г.Кропоткин', N' ул. Фрунзе 43')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (17, N'410661', N' г. Кропоткин', N' ул. Школьная 50')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (18, N'625590', N' г. Кропоткин', N' ул. Коммунистическая 20')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (19, N'625683', N' г. Кропоткин', N' ул. 8 Марта')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (20, N'400562', N' г. Кропоткин', N' ул. Зеленая 32')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (21, N'614510', N' г. Кропоткин', N' ул. Маяковского 47')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (22, N'410542', N' г. Кропоткин', N' ул. Светлая 46')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (23, N'620839', N' г. Кропоткин', N' ул. Цветочная 8')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (24, N'443890', N' г. Кропоткин', N' ул. Коммунистическая 1')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (25, N'603379', N' г. Кропоткин', N' ул. Спортивная 46')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (26, N'603721', N' г. Кропоткин', N' ул. Гоголя 41')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (27, N'410172', N' г. Кропоткин', N' ул. Северная 13')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (28, N'420151', N' г. Кропоткин', N' ул. Вишневая 32')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (29, N'125061', N' г. Кропоткин', N' ул. Подгорная 8')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (30, N'630370', N' г. Кропоткин', N' ул. Шоссейная 24')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (31, N'614753', N' г. Кропоткин', N' ул. Полевая 35')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (32, N'426030', N' г. Кропоткин', N' ул. Маяковского 44')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (33, N'450375', N' г. Кропоткин', N'ул. Клубная 44')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (34, N'625560', N' г. Кропоткин', N' ул. Некрасова 12')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (35, N'630201', N' г. Кропоткин', N' ул. Комсомольская 17')
INSERT [dbo].[PickupPoint] ([PickUpId], [Index], [City], [Adress]) VALUES (36, N'190949', N' г. Кропоткин', N' ул. Мичурина 26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'B111C5', N'Поплин «Розовый жемчуг»', N'Поплин «Розовый жемчуг» шириной 220 см с изображением на ткани — крупные цветы, чайная роза, цветовая гамма: бледно-розовая.', 1, 2, 1, 8500, 5, 5, 1, N'td5c45l5.sp0.png')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'D938K3', N'Фланель однотонная светлая', N'Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное, цветовая гамма: голубая, желтая, розовая, сирень, фисташка.', 2, 1, 4, 1300, 4, 10, 3, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'E112C6', N'Муслин «Bej»', N'Муслин «Bej» однотонный шириной 140+/-5 см с изображением на ткани — однотонный, цветовая гамма: кофе с молоком.', 1, 2, 2, 10500, 3, 13, 2, N'E112C6.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'F374S8', N'Фланель рубашечная', N'Фланель рубашечная шириной 150 см с изображением на ткани — клетка, цветовая гамма: светло-коричневая, синий-королевский.', 1, 3, 1, 2100, 2, 5, 1, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'H483D9', N'Фланель детская H483D9', N'Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек, цветовая гамма: баклажан, оранжевый, розовая.', 2, 2, 3, 318, 2, 18, 2, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'H497J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котята, сердечки, цветовая гамма: белоземельная, оранжевый.', 1, 2, 1, 523, 2, 8, 3, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'I132G5', N'Костюмная клетка Marella', N'Костюмная клетка Marella шириной 130 см рисунок клетка', 1, 1, 4, 2100, 2, 5, 2, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'I483H3', N'Ткань поплин «Вивьен»', N'Ткань поплин «Вивьен» шириной 220 см с изображением на ткани — горошек, цветовая гамма: синяя, фисташка.', 2, 1, 1, 11300, 2, 5, 2, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'K284U8', N'Бязь детская «Самолеты»', N'Бязь детская «Самолеты» шириной 150 см с изображением на ткани — игрушки, самолетики, цветовая гамма: белая, зеленая, синяя. ', 2, 2, 2, 5100, 3, 2, 3, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'K839K3', N'Плюш белый в клетку', N'Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный, цветовая гамма: белая, однотонная.', 1, 2, 2, 765, 2, 3, 3, N'K839K3.JPG ')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'L293S9', N'Плюш розовый гладкий', N'Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный, цветовая гамма: однотонная, розовая.', 2, 2, 3, 30000, 3, 2, 1, N'L293S9.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'M112C8', N'Бязь детская «Совята»', N'Бязь детская «Совята» шириной 150 см с изображением на ткани — совы, цветовая гамма: бордо, желтая, салатовая.', 2, 2, 2, 26000, 2, 14, 1, N'M112C8.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'M294G9', N'Полотно вафельное «8 марта»', N'Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы, цветовая гамма: розовая.', 2, 3, 2, 5130, 2, 1, 1, N'M294G9.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'M398S9', N'Поплин Мокко', N'Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное, цветовая гамма: коричневая, кофе, шоколад.', 2, 1, 4, 1800, 2, 6, 3, N'M398S9.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'N283K3', N'Сатин «Миндальный» однотонный', N'Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль. ', 1, 1, 3, 6500, 3, 7, 1, N'N283K3.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'N385L2', N'Сатин «Фисташковый» однотонный', N'Сатин «Фисташковый» однотонный шириной 250 см с изображением на ткани цветовая гамма: фисташка.', 1, 1, 1, 7000, 2, 2, 3, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'N387I8', N'Полотно вафельное «Кухня»', N'Полотно вафельное «Кухня» шириной 50 см с изображением на ткани — кухня, цветовая гамма: желтая, малина. ', 2, 3, 1, 1000, 3, 5, 2, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'N394K2', N'Ткань поплин «Лакшери»', N'Ткань поплин «Лакшери» шириной 220 см с изображением на ткани — надписи, сердечки, цветовая гамма: белая, красная, черная. ', 1, 1, 2, 30660, 4, 15, 2, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'O947D8', N'Ткань для скатертей под рогожку', N'Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов, цветовая гамма: красная, синяя.', 1, 3, 4, 3550, 3, 9, 2, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'P495H8', N'Поплин «Густав»', N'Поплин «Густав» шириной 220 см с изображением на ткани — листья, папортник, цветовая гамма: зеленая, светло-серая.', 2, 1, 3, 1000, 2, 14, 1, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'Q836H4', N'Фланель рубашечная', N'Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка, цветовая гамма: светло-коричневая, синий-королевский.', 1, 3, 4, 1350, 4, 7, 1, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'R748K3', N'Поплин Морская волна', N'Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное, цветовая гамма: аквамарин, бирюзовая.', 1, 1, 4, 2300, 2, 6, 3, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'R983K4', N'Сатин «Серо-бежевый» однотонный', N'Сатин «Серо-бежевый» однотонный шириной 250 см с изображением на ткани цветовая гамма: серо-бежевая.', 2, 1, 2, 1645, 2, 13, 2, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'S384K2', N'Фланель черная', N'Фланель черная оптом шириной 90 см с изображением на ткани — однотонное, цветовая гамма: черная.', 1, 3, 1, 69000, 4, 2, 3, N'S384K2.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'T238C7', N'Муслин «Gri»', N'Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный, цветовая гамма: серая.', 1, 2, 1, 6500, 2, 12, 2, N'T238C7.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'U947E9', N'Муслин белый горошек на однотонном фоне', N'Муслин белый горошек на однотонном фоне шириной 150 см с изображением на ткани — мелкий горошек, цветовая гамма: желтая.', 2, 2, 2, 3411, 3, 4, 3, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'V378J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котенок, облака, полумесяц, радуга, цветовая гамма: бледно-розовая, голубая, салатовая, серо-бежевая.', 1, 2, 3, 2400, 3, 14, 3, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'W874J3', N'Ткань поплин «Натурель»', N'Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы, цветовая гамма: пепельная, розовая. ', 2, 1, 1, 1600, 3, 9, 3, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductUnit], [ProductCategoryId], [ProductManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductProviderId], [ProductPhoto]) VALUES (N'X846D3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — жираф, полумесяц, пчелки, цветовая гамма: темно-фиолетовая.', 1, 2, 2, 9300, 3, 5, 1, N'')
GO
INSERT [dbo].[ProductCategories] ([CategriesId], [CategoriesName]) VALUES (1, N'Постельные ткани')
INSERT [dbo].[ProductCategories] ([CategriesId], [CategoriesName]) VALUES (2, N'Детские ткани')
INSERT [dbo].[ProductCategories] ([CategriesId], [CategoriesName]) VALUES (3, N'Ткани для изделий')
GO
INSERT [dbo].[ProductManufactures] ([ManufacturerId], [ManufacturerName]) VALUES (1, N'БТК Текстиль')
INSERT [dbo].[ProductManufactures] ([ManufacturerId], [ManufacturerName]) VALUES (2, N'Империя ткани')
INSERT [dbo].[ProductManufactures] ([ManufacturerId], [ManufacturerName]) VALUES (3, N'Комильфо')
INSERT [dbo].[ProductManufactures] ([ManufacturerId], [ManufacturerName]) VALUES (4, N'Май Фабрик')
GO
INSERT [dbo].[ProductProviders] ([ProviderId], [ProviderName]) VALUES (1, N'Раута')
INSERT [dbo].[ProductProviders] ([ProviderId], [ProviderName]) VALUES (2, N'ООО Афо-Тек')
INSERT [dbo].[ProductProviders] ([ProviderId], [ProviderName]) VALUES (3, N'ГК Петров')
GO
SET IDENTITY_INSERT [dbo].[ProductUnits] ON 

INSERT [dbo].[ProductUnits] ([UnitID], [UnitName]) VALUES (1, N'Рулон')
INSERT [dbo].[ProductUnits] ([UnitID], [UnitName]) VALUES (2, N'На отрез')
SET IDENTITY_INSERT [dbo].[ProductUnits] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Лавров', N'Богдан', N'Львович', N'8lf0g@yandex.ru', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Смирнова', N'Полина', N'Фёдоровна', N'1zx8@yandex.ru', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Полякова', N'София', N'Данииловна', N'x@mail.ru', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Чеботарева', N'Марина', N'Данииловна', N'34d@gmail.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Ермолов', N'Адам', N'Иванович', N'pxacl@mail.ru', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Васильев', N'Андрей', N'Кириллович', N'7o1@gmail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Маслов', N'Максим', N'Иванович', N'1@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Симонов', N'Михаил', N'Тимурович', N'iut@gmail.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Павлова', N'Ксения', N'Михайловна', N'e3t@outlook.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Трифонов', N'Григорий', N'Юрьевич', N'41clb6o2g@yandex.ru', N'JlFRCZ', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'test', N'test', N'test', N'123', N'123', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([OrderStatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPointId])
REFERENCES [dbo].[PickupPoint] ([PickUpId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategories] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([CategriesId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategories]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductManufactures] FOREIGN KEY([ProductManufacturerId])
REFERENCES [dbo].[ProductManufactures] ([ManufacturerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductManufactures]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductProviders] FOREIGN KEY([ProductProviderId])
REFERENCES [dbo].[ProductProviders] ([ProviderId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductProviders]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductUnits] FOREIGN KEY([ProductUnit])
REFERENCES [dbo].[ProductUnits] ([UnitID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductUnits]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
