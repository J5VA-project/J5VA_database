CREATE database data_final2
go
USE data_final2
GO
/****** Object:  Table [dbo].[account]    Script Date: Monday, 13, 12, 2021 22:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[address] [nvarchar](250) NULL,
	[phone] [varchar](15) NULL,
	[hire_date] [date] NOT NULL,
	[salary] [money] NOT NULL,
	[gender] [bit] NULL,
	[birthdate] [date] NULL,
	[image] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorized]    Script Date: Monday, 13, 12, 2021 22:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorized](
	[authorized_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[authorized_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: Monday, 13, 12, 2021 22:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[food_id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[content] [nvarchar](max) NULL,
	[createdate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorite]    Script Date: Monday, 13, 12, 2021 22:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorite](
	[favorite_id] [int] IDENTITY(1,1) NOT NULL,
	[food_id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[favorite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food]    Script Date: Monday, 13, 12, 2021 22:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food](
	[food_id] [int] NOT NULL,
	[food_name] [nvarchar](255) NOT NULL,
	[price] [money] NOT NULL,
	[photo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foodCategory]    Script Date: Monday, 13, 12, 2021 22:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foodCategory](
	[foodCategory_id] [int] IDENTITY(1,1) NOT NULL,
	[foodCategory_name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[foodCategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foodDetail]    Script Date: Monday, 13, 12, 2021 22:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foodDetail](
	[food_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[description] [nvarchar](max) NULL,
	[size_id] [int] NOT NULL,
	[image_title1] [varchar](255) NULL,
	[image_title2] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: Monday, 13, 12, 2021 22:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[orderDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[food_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: Monday, 13, 12, 2021 22:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[orderDate] [date] NOT NULL,
	[discount] [int] NULL,
	[note] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: Monday, 13, 12, 2021 22:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: Monday, 13, 12, 2021 22:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[size_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


Go
ALTER TABLE [dbo].[authorized]  WITH CHECK ADD  CONSTRAINT [fk_au_acc] FOREIGN KEY([username])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[authorized] CHECK CONSTRAINT [fk_au_acc]
GO
ALTER TABLE [dbo].[authorized]  WITH CHECK ADD  CONSTRAINT [fk_au_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[authorized] CHECK CONSTRAINT [fk_au_role]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [fk_cmt_acc] FOREIGN KEY([username])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [fk_cmt_acc]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [fk_cmt_f] FOREIGN KEY([food_id])
REFERENCES [dbo].[food] ([food_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [fk_cmt_f]
GO
ALTER TABLE [dbo].[favorite]  WITH CHECK ADD  CONSTRAINT [fk_fav_f] FOREIGN KEY([food_id])
REFERENCES [dbo].[food] ([food_id])
GO
ALTER TABLE [dbo].[favorite] CHECK CONSTRAINT [fk_fav_f]
GO
ALTER TABLE [dbo].[favorite]  WITH CHECK ADD  CONSTRAINT [fk_favorite_acc] FOREIGN KEY([username])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[favorite] CHECK CONSTRAINT [fk_favorite_acc]
GO
ALTER TABLE [dbo].[foodDetail]  WITH CHECK ADD  CONSTRAINT [fk_fd_f] FOREIGN KEY([food_id])
REFERENCES [dbo].[food] ([food_id])
GO
ALTER TABLE [dbo].[foodDetail] CHECK CONSTRAINT [fk_fd_f]
GO
ALTER TABLE [dbo].[foodDetail]  WITH CHECK ADD  CONSTRAINT [fk_fd_fc] FOREIGN KEY([category_id])
REFERENCES [dbo].[foodCategory] ([foodCategory_id])
GO
ALTER TABLE [dbo].[foodDetail] CHECK CONSTRAINT [fk_fd_fc]
GO
ALTER TABLE [dbo].[foodDetail]  WITH CHECK ADD  CONSTRAINT [fk_fd_size] FOREIGN KEY([size_id])
REFERENCES [dbo].[size] ([size_id])
GO
ALTER TABLE [dbo].[foodDetail] CHECK CONSTRAINT [fk_fd_size]
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [fk_orD_F] FOREIGN KEY([food_id])
REFERENCES [dbo].[food] ([food_id])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [fk_orD_F]
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [fk_orD_Od] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [fk_orD_Od]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_acc] FOREIGN KEY([username])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_orders_acc]
GO

INSERT [dbo].[account] ([username], [password], [fullname], [email], [address], [phone], [hire_date], [salary], [gender], [birthdate], [image]) VALUES (N'dathx', N'123', N'Hoang Xuan Dat', N'dathx@gmail.com', N'Dak Lak122', N'0375578191', CAST(N'2017-05-05' AS Date), 2700.0000, 1, CAST(N'1998-04-25' AS Date), N'45917244_991687064366718_841433094568280064_o_thumb.jpg')
INSERT [dbo].[account] ([username], [password], [fullname], [email], [address], [phone], [hire_date], [salary], [gender], [birthdate], [image]) VALUES (N'phucvh', N'123', N'Vu Hoang Phuc', N'phucvh@gmail.com', N'Dong Thap', N'0375578192', CAST(N'2017-05-05' AS Date), 2300.0000, 1, CAST(N'1997-03-05' AS Date), N'cand1.jpg')
INSERT [dbo].[account] ([username], [password], [fullname], [email], [address], [phone], [hire_date], [salary], [gender], [birthdate], [image]) VALUES (N'phuocqd', N'123', N'Quach Diem Phuoc', N'phuocqd@gmail.com', N'TPHCM', N'0375578193', CAST(N'2017-05-05' AS Date), 2200.0000, 1, CAST(N'1999-07-23' AS Date), N'ky-niem-76-nam-thanh-lap-cong-an-nhan-dan-2_920_552_901.jpg')
INSERT [dbo].[account] ([username], [password], [fullname], [email], [address], [phone], [hire_date], [salary], [gender], [birthdate], [image]) VALUES (N'user03', N'123', N'Nguyen Van C', N'user03@gmail.com', N'Dong Thap', N'0375578192', CAST(N'2017-05-05' AS Date), 2300.0000, 1, CAST(N'1998-03-05' AS Date), N'hambergur.png')
INSERT [dbo].[account] ([username], [password], [fullname], [email], [address], [phone], [hire_date], [salary], [gender], [birthdate], [image]) VALUES (N'user04', N'123', N'Nguyen Van D', N'user04@gmail.com', N'TPHCM', N'0375578193', CAST(N'2017-05-05' AS Date), 2200.0000, 1, CAST(N'1999-07-23' AS Date), N'pngegg (1).png')
INSERT [dbo].[account] ([username], [password], [fullname], [email], [address], [phone], [hire_date], [salary], [gender], [birthdate], [image]) VALUES (N'vuongnm', N'123', N'Nguyễn Minh Vương', N'vuongnmudpm@gmail.com', N'xã Phong Nẫm, thành phố Phan Thiết, tỉnh Bình Thuận', N'0375578181', CAST(N'2021-12-11' AS Date), 1200.0000, 1, CAST(N'2001-08-08' AS Date), N'1-1617012161323973126626-13-0-333-512-crop-16170121823001399176834.jpg')
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [role_name]) VALUES (1, N'Manager')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (2, N'Staff')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (3, N'Guest')
SET IDENTITY_INSERT [dbo].[role] OFF
GO

SET IDENTITY_INSERT [dbo].[authorized] ON 

INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (1, N'vuongnm', 1)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (2, N'vuongnm', 2)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (3, N'dathx', 2)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (4, N'dathx', 2)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (5, N'phucvh', 3)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (6, N'phuocqd', 3)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (7, N'user04', 1)
SET IDENTITY_INSERT [dbo].[authorized] OFF
GO
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (0, N'Pizza double seafood pesto', 10.5300, N'image-df.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (1, N'Chicken In Teriyaki1111', 22.3500, N'feature-item-1.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (2, N'Hotdog With Sausage', 30.3500, N'feature-item-2.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (3, N'Breakfast With Sweet', 52.3500, N'feature-item-3.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (4, N'Grilled Chicken Stick', 25.3500, N'feature-item-4.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (5, N'Chicken Barista platter', 32.3500, N'feature-item-5.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (6, N'French Fries Pack', 15.3500, N'feature-item-6.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (7, N'Banh Mi', 10.0000, N'banh-mi.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (8, N'Donuts', 15.0000, N'donut.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (1575, N'Burger bò tắm phô mai lát', 2.0500, N'5.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (4230, N'Milo', 0.8300, N'sua-milo2.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (4715, N'Mochi matcha (3)', 3.0000, N'Mochi-tra-xanh(3c).png')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (4804, N'Burger phô mai bò Deluxe', 3.0000, N'2.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (5113, N'Potato Chips Cheese (5v)', 1.2000, N'khoai-tay-vien-nhan-gravy(5v).jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (5874, N'Potato Chips Cheese (3)', 0.5000, N'khoai-tay-vien-nhan-gravy(3v).jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (11342, N'Pizza Double Seafood Storm', 10.5300, N'3b.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (12364, N'Chicken lemongrass sauce', 8.2300, N'33c6898e91f1367f8788d91c749e5b13.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (12528, N'Crispy Fried Chicken', 11.2300, N'ba9091810a0b18ef89.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (14273, N'Pizza Thịt Và Xúc Xích', 3.3500, N'8.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (14982, N'Burger gà nướng', 5.6100, N'9.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (15089, N'Aquafina', 0.6500, N'aquafina-1.5l-lit-hp73by.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (18371, N'Pasta', 1.9100, N'mi-y.png')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (18964, N'Combo pasta pepsi chicken', 2.6100, N'mi-y-sot-ga.png')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (19951, N'Egg cake', 0.9000, N'banh-trung(1c).jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (20736, N'Mochi chocolate (3)', 3.0000, N'Mochi-socola(3c).png')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (24306, N'Burger bò tắm phô mai', 2.0000, N'6.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (25625, N'Crispy Chicken Fillet with Vegetable Rice', 12.3500, N'771c8366462172cc631e5f8ccc11.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (30688, N'HDA CHICKEN COMBO with Lemongrass Sauce', 13.2500, N'e163664f16771722839cdbbade640b42.png')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (32587, N'Seaweed soup', 1.0000, N'sup-rong-bien.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (34308, N'Pizza cheese frame', 5.4400, N'5a.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (37813, N'Pepsi', 0.7400, N'5e4916a53760b1066988b835c648ff7a.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (38786, N'Mochi chocolate (1)', 1.0000, N'Mochi-socola(1c).png')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (39912, N'Chiken Sause Bechame', 5.3600, N'cooky-recipe-cover-r36594.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (43211, N'Pizza Vegetable', 3.3500, N'1.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (53752, N'Mochi matcha (1)', 1.0000, N'Mochi-tra-xanh(1c).png')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (54093, N'Fried Fish Sticks', 1.0000, N'ca-thanh(3t).jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (55357, N'Burger bò tràn phô mai', 4.5700, N'8.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (57948, N'Pizza double seafood pesto', 10.5300, N'2a.png')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (62481, N'7Up', 0.7400, N'fc75bb4ca38fab6dc611df08a7a308f2.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (64036, N'Burger Siêu nhân phô mai', 2.1300, N'1.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (67074, N'Egg cake (4)', 2.5000, N'banh-trung(4c).jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (74596, N'Cheese balls (6)', 6.0000, N'pho-mai-vien(6v).jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (74728, N'Pizza Seafood Black Pepper Sauce', 10.5300, N'4.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (75216, N'Burger bò phô mai', 2.0500, N'4.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (76041, N'Mirinda Orange', 0.7400, N'mirinda-cam-330ml-sleek-lon-2-org.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (81479, N'Peach tea', 1.0000, N'tra-dao.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (87791, N'Burger Whopper Bò phô mai', 5.1800, N'3.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (88650, N'Burger bò thịt heo xông khói', 4.5700, N'7.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (89134, N'Combo pasta pepsi', 1.9100, N'mi-y-sot.png')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (92726, N'Burger 2 miếng bò phô mai', 7.7900, N'10.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (94124, N'Guava Chia Seed Mocktail', 1.2600, N'b.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (94874, N'cheese balls (4)', 4.0000, N'pho-mai-vien(4v).jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (97356, N'Sticky chicken rice', 15.3600, N'comgaxienque.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (99306, N'Seafood Pizza with Pesto Sauce', 5.4400, N'6b.jpg')
GO
SET IDENTITY_INSERT [dbo].[foodCategory] ON 

INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (1, N'Dishes', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (2, N'Nuts & Green', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (3, N'Smoothies', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (4, N'Vegetables', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (5, N'Takeaway Pack', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (6, N'Fresh Fruits', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (7, N'Drink', N'Type of drink')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (8, N'Hamburger', N'Type of hamburger')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (9, N'Chicken', N'Type of chicken')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (10, N'Others', N'Other food')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (11, N'Pizza', N'Type of pizza')
SET IDENTITY_INSERT [dbo].[foodCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[size] ON 

INSERT [dbo].[size] ([size_id], [name]) VALUES (1, N'small')
INSERT [dbo].[size] ([size_id], [name]) VALUES (2, N'medium')
INSERT [dbo].[size] ([size_id], [name]) VALUES (3, N'large')
SET IDENTITY_INSERT [dbo].[size] OFF
GO


SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([comment_id], [food_id], [username], [content], [createdate]) VALUES (1, 15089, N'vuongnm', N'Quá tuyệt vời!!', CAST(N'2021-12-13T20:53:59.480' AS DateTime))
INSERT [dbo].[comment] ([comment_id], [food_id], [username], [content], [createdate]) VALUES (2, 19951, N'vuongnm', N'Ngon quá nha!!', CAST(N'2021-12-13T21:41:34.510' AS DateTime))
INSERT [dbo].[comment] ([comment_id], [food_id], [username], [content], [createdate]) VALUES (3, 15089, N'vuongnm', N'Hơi nhạt nha!!', CAST(N'2021-12-13T21:42:14.317' AS DateTime))
INSERT [dbo].[comment] ([comment_id], [food_id], [username], [content], [createdate]) VALUES (4, 39912, N'vuongnm', N'Ngon quá xá !!!', CAST(N'2021-12-13T21:43:30.983' AS DateTime))
INSERT [dbo].[comment] ([comment_id], [food_id], [username], [content], [createdate]) VALUES (7, 37813, N'phuocqd', N'Wowy đã mua pepsi tại đây và uống cùng Binz', CAST(N'2021-12-13T21:51:20.397' AS DateTime))
INSERT [dbo].[comment] ([comment_id], [food_id], [username], [content], [createdate]) VALUES (8, 37813, N'vuongnm', N'Anh có vài người bạn anh ở Bồng Sơn. ', CAST(N'2021-12-13T21:52:15.000' AS DateTime))
INSERT [dbo].[comment] ([comment_id], [food_id], [username], [content], [createdate]) VALUES (5, 37813, N'dathx', N'Bung cùng rap việt :)', CAST(N'2021-12-13T21:49:29.147' AS DateTime))
INSERT [dbo].[comment] ([comment_id], [food_id], [username], [content], [createdate]) VALUES (6, 37813, N'phucvh', N'OTD Westside :))))  Make some noise. Risky star number 1. ', CAST(N'2021-12-13T21:50:37.603' AS DateTime))
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
SET IDENTITY_INSERT [dbo].[favorite] ON 

INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (3, 2, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (4, 3, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (5, 2, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (6, 2, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (7, 6, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (11, 7, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (39, 7, N'dathx')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (40, 8, N'dathx')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (42, 2, N'phucvh')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (43, 2, N'phuocqd')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (44, 7, N'phuocqd')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (45, 7, N'phucvh')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (46, 2, N'user03')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (47, 2, N'user04')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (48, 7, N'user04')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (49, 8, N'user04')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (50, 8, N'phucvh')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (51, 6, N'phucvh')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (52, 19951, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (53, 39912, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (54, 8, N'vuongnm')
SET IDENTITY_INSERT [dbo].[favorite] OFF
GO
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (1, 1, 1, N'no', 1, N'feature-item-1.jpg', N'feature-item-1.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (2, 1, 1, N'no', 2, N'feature-item-2.jpg', N'feature-item-2.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (3, 4, 1, N'no', 1, N'feature-item-3.jpg', N'feature-item-3.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (4, 5, 1, N'no', 2, N'feature-item-4.jpg', N'feature-item-4.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (5, 2, 1, N'no', 3, N'feature-item-5.jpg', N'feature-item-5.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (6, 5, 1, N'no', 3, N'feature-item-6.jpg', N'feature-item-6.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (7, 1, 1, N'no', 1, N'feature-item-1.jpg', N'feature-item-1.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (8, 1, 1, N'no', 2, N'feature-item-2.jpg', N'feature-item-2.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (1575, 8, 1, N'Burger bò nướng khoai tây lát, với độ mịn của bánh và những lát khoai tây giòn tan trong miệng sẽ phù hợp với mọi khẩu vị', 2, N'5.jpg', N'5.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (4230, 7, 1, N'• Sữa lúa mạch MILO ít đường đóng vai trò quan trọng trong việc giải phóng năng lượng, tăng cường chức năng cơ và hệ xương, hỗ trợ tích cực cho các hoạt động thể chất và não bộ của trẻ.
• Hương vị thơm ngon trẻ yêu thích và giàu dinh dưỡng với sự hòa quyện của cacao, sữa và lúa mạch', 2, N't?i xu?ng.jpg', N'uong-sua-milo-co-tang-chieu-cao-hay-khong.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (4715, 10, 1, N'Bánh mochi mềm mịn, dẻo ngon sẽ càng hấp dẫn hơn khi được nướng thơm lừng và kết hợp cùng phô mai béo ngậy, mằn mặn ăn vào cực thích miệng mà không bị ngán. Chị em nhanh lưu lại cách làm bánh mochi phô mai nướng này và làm ngay nhé.', 3, N'Mochi-tra-xanh(3c).png', N'Mochi-tra-xanh(3c).png')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (4804, 8, 1, N'Burger siêu nhân phô mai bò Deluxe với độ mịn của bánh, độ thơm ngon của miếng bò Deluxe cung cấp cho bạn nguồn dinh dưỡng dồi dào', 2, N'2.jpg', N'2.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (5113, 10, 1, N'Món bánh khoai tây viên phô mai thơm ngon với từng viên bánh nhỏ xinh, lớp vỏ ngoài giòn tan còn bên trong lại béo ngậy vị phô mai khiến ai ăn cũng mê tít.', 3, N'khoai-tay-vien-nhan-gravy(5v).jpg', N'khoai-tay-vien-nhan-gravy(5v).jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (5874, 10, 1, N'Món bánh khoai tây viên phô mai thơm ngon với từng viên bánh nhỏ xinh, lớp vỏ ngoài giòn tan còn bên trong lại béo ngậy vị phô mai khiến ai ăn cũng mê tít.', 2, N'khoai-tay-vien-nhan-gravy(3v).jpg', N'khoai-tay-vien-nhan-gravy(3v).jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (11342, 11, 1, N'Pizza Cơn Lốc Hải Sản Với Hải Sản (MựC, Thanh Cua) Nhân Đôi Cùng Với Thơm, Ớt Chuông Xanh, HàNh Tây, Phủ Phô Mai Mozzarella Từ New Zealand Trên Nền XốT Cheesy Mayo.', 2, N'3.jpg', N'3a.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (12364, 9, 1, N'If you’re new to working with lemongrass, don’t worry — it’s a really simple ingredient to use and I will walk you through everything you need to know. So scout out a few stalks the next time you’re at the grocery store, and let’s buy and enjoy some lemongrass chicken together!', 2, N'acddfc1dff7536ef271af943646bc32e.jpg', N'93555ac3f1cadf4112a5e272903a6320.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (12528, 9, 1, N'If you''ve wanted to eat crispy fried chicken, this is the recipe for you. Always a picnic favorite, this deep-fried chicken recipe is delicious either hot or cold. Kids call it my Kentucky Fried Chicken!', 3, N'Facetune_06-10-2020-15-37-58-500x375.jpg', N'551-636042654371000655.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (14273, 11, 1, N'Thơm Ngon Và Giàu Protein Với Thịt Xông Khói, Xúc Xích, ThịT Bò, Giăm Bông Và Pepperoni', 2, N'8a.jpg', N'8b.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (14982, 8, 1, N'Burger gà nướng với hương thơm từ gà nướng sẽ tạo ra 1 loại burger hương vị đậm đà và gây ghiện', 2, N'9.jpg', N'9.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (15089, 7, 1, N'Nước suối đóng chai Aquafina được lấy từ nguồn nước ngầm đảm bảo trải qua quy trình khử trùng, lọc sạch các tạp chất. Sản phẩm đã đạt tới trình độ nước tinh khiết có tác dụng dịu cơn khát, khi uống sẽ có cảm giác hơi ngọt ở miệng, rất dễ uống.', 2, N'aquafinavn.jpg', N'aquafina-1.5l-lit-hp73by.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (18371, 10, 1, N'Mì ý được biết đến là món ăn nổi tiếng trong nền văn hóa ẩm thực phương Tây. Những sợi mì vàng tươi, mềm thơm phủ nước sốt sánh mịn làm bùng nổ vị giác của bất cứ ai từng nếm thử. Không chỉ ngon miệng mà cách làm mì Ý còn rất đơn giản.', 2, N'mi-y.png', N'mi-y.png')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (18964, 10, 1, N'Mì ý được biết đến là món ăn nổi tiếng trong nền văn hóa ẩm thực phương Tây. Những sợi mì vàng tươi, mềm thơm phủ nước sốt sánh mịn làm bùng nổ vị giác của bất cứ ai từng nếm thử. Không chỉ ngon miệng mà cách làm mì Ý còn rất đơn giản.', 3, N'mi-y-sot-ga.png', N'mi-y-sot-ga.png')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (19951, 9, 1, N'Là một trong những loại bánh ngọt trứ danh đối với hội sành ăn trên khắp thế giới, bánh tart có bề ngoài nhỏ nhắn, nhưng sở hữu hương vị vô thơm ngon khó cưỡng.', 1, N'banh-trung(1c).jpg', N'banh-trung(1c).jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (20736, 10, 1, N'Bánh mochi mềm mịn, dẻo ngon sẽ càng hấp dẫn hơn khi được nướng thơm lừng và kết hợp cùng phô mai béo ngậy, mằn mặn ăn vào cực thích miệng mà không bị ngán. Chị em nhanh lưu lại cách làm bánh mochi phô mai nướng này và làm ngay nhé.', 3, N'Mochi-socola(3c).png', N'Mochi-socola(3c).png')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (24306, 8, 1, N'Burger bò tắm phô mai, là sự lựa chọn không thể bỏ qua cho các bạn trẻ với hương thơm và độ béo của phô mai sẽ khiến bạn say đắm', 2, N'6.jpg', N'6.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (25625, 9, 1, N'This better-than-takeout main dish cuts the grease and loads up on fresh vegetables. Get your kids involved by letting them choose which vegetables they want to include.', 2, N'bbq-rice-210628-m3.png', N'e428881b9c857b69db729e69e3b853f9_output.jpeg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (30688, 9, 1, N'We’ve been on a major Vietnamese food kick lately, trying to master some of our favorite dishes here at home (especially since good Vietnamese is hard to find here in Barcelona). And I have to say that our most recent attempt mayyy have even better than the restaurant version that inspired it — lemongrass chicken!', 3, N'190a629414d1f8ba3e07d2e45ab29ba7.jpg', N'b2a6fcd7f1c2d9ddc62fc75763a5b3fc.png')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (32587, 10, 1, N'Rong biển là một trong những thực phẩm từ thiên nhiên mang lại nhiều lợi ích cho sức khỏe. Mang hương vị của biển nên rong biển có vị tanh. Ai e ngại với vị tanh thì khi ăn rong biển sẽ khiến bạn có cảm giác ăn không quen. Nhưng khi kết hợp với súp hải sản, rong biển đã tạo ra một món ăn độc đáo và cực kỳ bổ dưỡng.', 2, N'sup-rong-bien.jpg', N'sup-rong-bien.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (34308, 11, 1, N'Cùng thưởng thức 2 loại nhân phủ thơm ngon trên cùng 1 bánh pizza. Pizza Half Half - vị ngon nhân đôi.', 2, N'5b.jpg', N'5.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (37813, 7, 1, N'* Nước Ngọt Có Gas Pepsi Không Calo với hương cola hấp dẫn kết hợp cùng vị chanh thanh mát, không chỉ mang lại cảm giác sảng khoái, giải nhiệt tức thì mà còn tốt cho sức khỏe.
* Với bao bì chất liệu Matte độc đáo, lần đầu tiên trong ngành hàng Nước uống có Gaz cùng thiết kế dạng lon giúp bạn có thể dễ dàng bảo quản cũng như mang theo sản phẩm trong các chuyến dã ngoại hay các buổi thi đấu, luyện tập thể thao.
* Thế hệ Pepsi-Cola mới với kết hợp đột phá cùng vị chanh, không calo đem đến một trải nghiệm hoàn toàn mới mẻ đầy thú vị. Sảng khoái hết mình, bung hết chất mình.', 1, N'hqdefault.jpg', N'images.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (38786, 10, 1, N'Bánh mochi mềm mịn, dẻo ngon sẽ càng hấp dẫn hơn khi được nướng thơm lừng và kết hợp cùng phô mai béo ngậy, mằn mặn ăn vào cực thích miệng mà không bị ngán. Chị em nhanh lưu lại cách làm bánh mochi phô mai nướng này và làm ngay nhé.', 1, N'Mochi-socola(1c).png', N'Mochi-socola(1c).png')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (39912, 9, 1, N'Chicken: in this recipe, Feel free to use boneless skinless chicken thighs instead or even leftover roasted chicken or turkey. Let''s enjoy it now!', 2, N'3eb4ca5007d1a17081f42c3054dd4aca.png', N'9041eefa68563d44aeb4a731e41dcbca.png')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (43211, 11, 1, N'Thanh Nhẹ Với Ô Liu Đen Tuyệt Hảo, Cà Chua Bi Tươi Ngon, Nấm, Thơm, Bắp, Hành Tây Và Phô Mai Mozzarella Cho Bạn Bữa Tiệc Rau Củ Tròn Vị', 2, N'1a.png', N'1b.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (53752, 10, 1, N'Bánh mochi mềm mịn, dẻo ngon sẽ càng hấp dẫn hơn khi được nướng thơm lừng và kết hợp cùng phô mai béo ngậy, mằn mặn ăn vào cực thích miệng mà không bị ngán. Chị em nhanh lưu lại cách làm bánh mochi phô mai nướng này và làm ngay nhé.', 1, N'image-df.jpg', N'image-df.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (54093, 10, 1, N'Thanh cá chiên xù, vỏ ngoài giòn rụm vàng ươm, phần cá bên trong tươi mềm, ngọt thịt, lại thoang thoảng vị phô mai thơm phức', 3, N'ca-thanh(3t).jpg', N'ca-thanh(3t).jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (55357, 8, 1, N'Burger bò khoai giòn tràn phô mai, với sự pha trôn từ thịt bò và khoai tây giòn tràn trong phô mai hương vị sẽ được đẩy lên cao rất đáng để thưởng thức', 1, N'8.jpg', N'8.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (57948, 11, 1, N'Pizza Hải Sản Xốt Pesto Với Hải Sản (Tôm, Mực) Nhân Đôi Cùng Với Nấm Trên Nền Xốt Pesto Đặc Trưng, Phủ Phô Mai Mozzarella Từ New Zealand Và Quế Tây.', 3, N'2b.png', N'2.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (62481, 7, 1, N'7Up vị chanh 320 ml chứa nhiều vitamin C cho cơ thể khỏe khoắn và tinh thần luôn tươi vui mỗi ngày, là nước giải khát Có Gaz với hương chanh tự nhiên mát lạnh, mang đến cho bạn cảm giác sảng khoái.
Với thiết kế dạng lon tiện dụng, gọn nhẹ bạn có thể dễ dàng bảo quản cũng như mang theo sản phẩm trong các chuyến dã ngoại hay các buổi thi đấu, luyện tập thể thao.', 2, N'nuoc-ngot-7-up-vi-chanh-320ml-giao-mau-ngau-nhien-202110301624104937.jpg', N'2111_b7b2e9efff6d40d6ba6c9203e5dd57dd_17aea90978cf4b8e93483262fc3e1d9e_32090e425aa041ae8edb63114225ca2d.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (64036, 8, 1, N'Burger siêu nhân phô mai với độ mịn của bánh, dộ béo của phô mai sẽ làm các bạn tan chảy. Trong lần trãi nghiệm đầu tiên', 1, N'2.jpg', N'3.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (67074, 10, 1, N'Là một trong những loại bánh ngọt trứ danh đối với hội sành ăn trên khắp thế giới, bánh tart có bề ngoài nhỏ nhắn, nhưng sở hữu hương vị vô thơm ngon khó cưỡng.', 3, N'banh-trung(4c).jpg', N'banh-trung(4c).jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (74596, 10, 1, N'Món viên phô mai thơm ngon với từng viên bánh nhỏ xinh, lớp vỏ ngoài giòn tan còn bên trong lại béo ngậy vị phô mai khiến ai ăn cũng mê tít.', 3, N'pho-mai-vien(6v).jpg', N'pho-mai-vien(6v).jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (74728, 11, 1, N'Pizza Hải Sản Xốt Tiêu Đen Với Hải Sản (Tôm, Mực, Thanh Cua) Nhân Đôi Cùng Với Hành Tây, Thơm Phủ Xốt Tiêu Đen Thơm Nóng Và Phô Mai Mozzarella Từ New Zealand.', 3, N'4a.png', N'4b.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (75216, 8, 1, N'Burger bò phô mai với sự hòa quyện vị béo của vô mai và độ thơm ngon của thịt bò, sẽ tạo nên nguồn cảm hứng cho bạn', 1, N'4.jpg', N'4.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (76041, 7, 1, N'Thương hiệu Mirinda (Việt Nam)
Sản xuất tại Việt Nam
Loại nước Nước ngọt có ga
Hương vị vị cam
Thành phần Nước bão hoà CO2, đường mía, đường HFCS, chất điều chỉnh độ acid, tinh bột biến tính, chất bảo quản, chất nhũ hoá, hương cam tự nhiên, màu tổng hợp
Thể tích 330ml
Số lượng Thùng 24 lon
Sử dụng Ngon hơn khi uống lạnh
Thành phần
Nước bão hòa CO2, chất điều chỉnh độ axit, đường mía, hương cam tổng hợp, màu thực phẩm.', 2, N'Y7QrF2Q.jpg', N'mirinda-cam-330ml-sleek-lon-2-org.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (81479, 7, 1, N'Ghé ngay nhà hàng J5Va để thưởng thức món “Trà đào PEACHAA” với giá dùng thử chỉ 29.000 đồng. Hoặc chọn ngay các combo Trà đào A giá 82.000 đồng bao gồm 2 miếng gà rán và ly Trà sữa đào; combo Trà sữa đào B giá chỉ 87.000 đồng gồm miếng gà rán, burger tôm và ly Trà sữa đào', 2, N'tra-dao-cam-sa.jpg', N'quan-tra-dao-cam-sa-ngon-nhat-tai-hai-phong-305960.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (87791, 8, 1, N'Burger Whopper Bò Siêu nhân phô mai, với sự hòa quyện vị béo của vô mai và độ thơm ngon của thịt bò, sẽ tạo nên nguồn cảm hứng cho bạn', 3, N'3.jpg', N'3.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (88650, 8, 1, N'Burger bò thịt heo xông khói với vị đặc trưng của thịt heo xông khói và sự pha trộn cùng với thịt bò, sẽ là sự lựa chọn đỉnh cao cho nhưng bạn có niềm đam mê ăn uống', 3, N'7.jpg', N'7.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (89134, 10, 1, N'Mì ý được biết đến là món ăn nổi tiếng trong nền văn hóa ẩm thực phương Tây. Những sợi mì vàng tươi, mềm thơm phủ nước sốt sánh mịn làm bùng nổ vị giác của bất cứ ai từng nếm thử. Không chỉ ngon miệng mà cách làm mì Ý còn rất đơn giản.', 2, N'mi-y-sot.png', N'mi-y-sot.png')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (92726, 8, 1, N'Burger 2 miếng bò khoai giòn tràn phô mai, với 2 miếng bò sẽ cho bạn tận hưởng những vị ngon đầy ấp miệng gây sản khoái cho người ăn', 3, N'10.jpg', N'10.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (94124, 7, 1, N'Mocktail Ổi Hạt Chia, đặc trưng với màu hồng và mùi vị tự nhiên của nước ép Ổi pha với soda mát lạnh, topping thêm trên cùng hạt thủy tinh hạt chia vị đào thơm, tạo nên món nước mocktail độc đáo giúp giải khát và thích hợp cho mọi lứa tuổi!', 2, N'a.jpg', N'POSTER-OI-HAT-CHIA.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (94874, 10, 1, N'Món viên phô mai thơm ngon với từng viên bánh nhỏ xinh, lớp vỏ ngoài giòn tan còn bên trong lại béo ngậy vị phô mai khiến ai ăn cũng mê tít.', 2, N'pho-mai-vien(4v).jpg', N'pho-mai-vien(4v).jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (97356, 9, 1, N'Add flair to your midweek meals with this sweet sticky chicken recipe with jasmine rice. What are you waiting for? let''s buy it now!', 2, N'36227503c3ec95248380c7edb19e4494.jpg', N'Untitled-9.png')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (99306, 11, 1, N'Tôm, Mực Và Nấm Trên Nền Xốt Pesto Đặc Trưng, Phủ Phô Mai Mozzarella', 2, N'6.jpg', N'6a.jpg')
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (1, N'phuocqd', CAST(N'2021-09-29' AS Date), 10, N'', 5, N'HCM')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (2, N'phucvh', CAST(N'2021-09-29' AS Date), 10, N'', 1, N'HCM')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (3, N'phuocqd', CAST(N'2021-09-29' AS Date), 5, N'', 4, N'HCM')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (4, N'phucvh', CAST(N'2021-09-29' AS Date), 10, N'', 4, N'HCM')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (5, N'phucvh', CAST(N'2021-09-29' AS Date), 20, N'', 4, N'HCM')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (6, N'vuongnm', CAST(N'2021-10-28' AS Date), 0, N'', 1, N'ptttt')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (7, N'vuongnm', CAST(N'2021-10-28' AS Date), 0, N'', 4, N'pttt')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (8, N'vuongnm', CAST(N'2021-10-30' AS Date), 0, N'', 4, N'ssss')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (9, N'vuongnm', CAST(N'2021-10-30' AS Date), 0, N'', 4, N'5555')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (10, N'vuongnm', CAST(N'2021-10-31' AS Date), 0, N'', 4, N'a')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (11, N'vuongnm', CAST(N'2021-10-31' AS Date), 0, N'', 4, N'2')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (12, N'vuongnm', CAST(N'2021-11-02' AS Date), 0, N'', 4, N'sa')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (13, N'phuocqd', CAST(N'2021-11-03' AS Date), 0, N'Giao s?m nhé', 4, N'HCM')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (14, N'vuongnm', CAST(N'2021-11-03' AS Date), 0, N'', 4, N'ASSA')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (15, N'vuongnm', CAST(N'2021-11-03' AS Date), 0, N'', 4, N'HCM')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (16, N'phuocqd', CAST(N'2021-11-03' AS Date), 0, N'', 4, N'BINH TAN')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (17, N'vuongnm', CAST(N'2021-11-03' AS Date), 0, N'', 4, N'PhanThiet')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (18, N'vuongnm', CAST(N'2021-11-03' AS Date), 0, N'', 4, N'PHANTHIET')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (19, N'vuongnm', CAST(N'2021-11-03' AS Date), 0, N'', 4, N'PHANTHIET1')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (20, N'vuongnm', CAST(N'2021-11-06' AS Date), 0, N'GIAO NHANH', 5, N'BINH THUAN')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (21, N'vuongnm', CAST(N'2021-11-06' AS Date), 0, N'', 1, N'HOT')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (22, N'vuongnm', CAST(N'2021-11-06' AS Date), 0, N'', 1, N'HOT')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (23, N'vuongnm', CAST(N'2021-11-06' AS Date), 0, N'', 1, N'HOT')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (24, N'vuongnm', CAST(N'2021-11-07' AS Date), 0, N'', 1, N'HT')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (25, N'vuongnm', CAST(N'2021-11-07' AS Date), 0, N'', 1, N'hot')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (26, N'vuongnm', CAST(N'2021-01-01' AS Date), 0, N'', 1, N'PT01')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (27, N'vuongnm', CAST(N'2021-02-02' AS Date), 0, N'', 1, N'PT02')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (28, N'vuongnm', CAST(N'2021-03-03' AS Date), 0, N'', 1, N'PT03')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (29, N'vuongnm', CAST(N'2021-04-04' AS Date), 0, N'', 1, N'PT04')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (30, N'vuongnm', CAST(N'2021-05-05' AS Date), 0, N'', 1, N'PT05')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (31, N'vuongnm', CAST(N'2021-06-06' AS Date), 0, N'', 5, N'PT06')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (32, N'vuongnm', CAST(N'2021-07-07' AS Date), 0, N'', 1, N'PT07')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (33, N'vuongnm', CAST(N'2021-08-08' AS Date), 0, N'', 5, N'PT08')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (34, N'vuongnm', CAST(N'2021-11-17' AS Date), 0, N'PT, BT', 5, N'PhanThiet, Binh Thuan')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (1034, N'dathx', CAST(N'2021-11-19' AS Date), 0, N'Carefully', 3, N'12 Duong Thi Muoi Street, District 12, HCM City')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (1035, N'dathx', CAST(N'2021-11-19' AS Date), 0, N'Good Luck', 1, N'20 Dong Bac Street, District 12, HCM City')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (1036, N'vuongnm', CAST(N'2021-11-19' AS Date), 0, N'Good Luck', 2, N'8 Truong Chinh Street, Phan Thiet City')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (1038, N'vuongnm', CAST(N'2021-12-11' AS Date), 0, N'sss', 1, N'ss')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (1039, N'vuongnm', CAST(N'2021-12-11' AS Date), 0, N'sss', 1, N'ss')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (1040, N'vuongnm', CAST(N'2021-12-11' AS Date), 0, N'abc', 1, N'abc')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (1041, N'dathx', CAST(N'2021-12-11' AS Date), 0, N'Giao hàng vào gi? hành chính. C?m on.', 1, N'thành phố Buôn Mê Thuộc, tỉnh Đắk Lắk')
INSERT [dbo].[orders] ([order_id], [username], [orderDate], [discount], [note], [status], [address]) VALUES (1042, N'vuongnm', CAST(N'2021-12-13' AS Date), 0, N'', 4, N'đường số 8.')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO

SET IDENTITY_INSERT [dbo].[orderDetail] ON 

INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1, 1, 1, 1, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (2, 2, 1, 1, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (3, 3, 2, 1, 30.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (4, 4, 2, 1, 30.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (5, 5, 3, 1, 52.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (6, 6, 1, 4, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (7, 7, 1, 4, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (8, 10, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (9, 11, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (10, 12, 6, 3, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (11, 12, 1, 1, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (12, 13, 6, 3, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (17, 14, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (19, 15, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (22, 16, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (23, 20, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (34, 25, 2, 24, 30.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (47, 30, 6, 6, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1051, 1034, 7, 26, 10.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1052, 1034, 6, 15, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1053, 1035, 2, 22, 30.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1054, 1035, 4, 23, 25.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1055, 1036, 7, 1, 10.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1056, 1036, 8, 21, 15.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1057, 1036, 1, 23, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1058, 1036, 6, 24, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1059, 1036, 2, 24, 30.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1061, 1038, 7, 1, 10.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1062, 1040, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1063, 1040, 8, 4, 15.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1064, 1041, 7, 1, 10.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1065, 1042, 19951, 4, 0.9000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1066, 1042, 15089, 3, 0.6500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1067, 1042, 37813, 1, 0.7400)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1068, 1042, 12364, 1, 8.2300)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1069, 1042, 39912, 1, 5.3600)
SET IDENTITY_INSERT [dbo].[orderDetail] OFF
GO

/****** Object:  StoredProcedure [dbo].[sp_bestSellingProduct]    Script Date: Monday, 13, 12, 2021 22:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   PROC [dbo].[sp_bestSellingProduct](@Month int, @Year int)
AS
   BEGIN
      select food_id, sum(ordD.quantity) as 'luong san pham'
      from dbo.orders ord inner join dbo.orderDetail ordD 
      on ord.order_id = ordD.order_id
      where year(ord.orderDate) = @Year and MONTH(ord.orderDate) = @Month
      group by food_id
      order by sum(ordD.quantity) desc
   END;
GO
/****** Object:  StoredProcedure [dbo].[sp_cancelPaypal]    Script Date: Monday, 13, 12, 2021 22:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[sp_cancelPaypal]
as
begin
   delete from dbo.orders where order_id in (
select max(order_id) from dbo.orders
)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindRevenueByMonth]    Script Date: Monday, 13, 12, 2021 22:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    PROC  [dbo].[sp_FindRevenueByMonth](@Month int)
	AS
		BEGIN
			SELECT SUM(ordD.quantity*ordD.price)
			FROM dbo.orders ord inner join dbo.orderDetail ordD
			ON ord.order_id = ordD.order_id
			WHERE MONTH(ord.orderDate) = @Month and ord.status = 4
	END;
GO
