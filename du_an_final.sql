create database du_an_06
go
use du_an_06
GO
/****** Object:  Table [dbo].[account]    Script Date: Sunday, 12, 12, 2021 00:56:04 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorized]    Script Date: Sunday, 12, 12, 2021 00:56:04 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorite]    Script Date: Sunday, 12, 12, 2021 00:56:04 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food]    Script Date: Sunday, 12, 12, 2021 00:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food](
	[food_id] [int]  NOT NULL,
	[food_name] [nvarchar](255) NOT NULL,
	[price] [money] NOT NULL,
	[photo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foodCategory]    Script Date: Sunday, 12, 12, 2021 00:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foodCategory](
	[foodCategory_id] [int]  NOT NULL identity(1,1),
	[foodCategory_name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[foodCategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foodDetail]    Script Date: Sunday, 12, 12, 2021 00:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foodDetail](
	[food_id] [int]  NOT NULL,
	[category_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[description] [nvarchar](max) NULL,
	[size_id] [int] NOT NULL,
	[image_title1] [varchar](255) NULL,
	[image_title2] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: Sunday, 12, 12, 2021 00:56:04 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: Sunday, 12, 12, 2021 00:56:04 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: Sunday, 12, 12, 2021 00:56:04 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: Sunday, 12, 12, 2021 00:56:04 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

create table dbo.comment
(
comment_id int identity(1,1),
food_id int not null, 
username varchar(50) not null,
content nvarchar(max),
createdate datetime
)
alter table dbo.comment
add constraint fk_cmt_f
foreign key(food_id)
references dbo.food(food_id)

alter table dbo.comment
add constraint fk_cmt_acc
foreign key(username)
references dbo.account(username)

alter table dbo.authorized
add constraint fk_au_role
foreign key (role_id)
references dbo.role(role_id)

alter table dbo.authorized
add constraint fk_au_acc
foreign key(username)
references dbo.account(username)

alter table dbo.foodDetail
add constraint fk_fd_fc
foreign key ( category_id)
references dbo.foodCategory(FoodCategory_id)

alter table dbo.foodDetail
add constraint fk_fd_f
foreign key(food_id)
references dbo.food(food_id)

alter table dbo.foodDetail
add constraint fk_fd_size
foreign key(size_id)
references dbo.size(size_id)

alter table dbo.orderDetail
add constraint fk_orD_Od
foreign key (order_id)
references dbo.orders(order_id)

alter table dbo.orderDetail
add constraint fk_orD_F
foreign key (food_id)
references dbo.food(food_id)

alter table dbo.favorite
add constraint fk_fav_f
foreign key ( food_id)
references dbo.food(food_id)

alter table dbo.favorite
add constraint fk_favorite_acc
foreign key (username)
references dbo.account(username)

alter table dbo.orders
add constraint fk_orders_acc
foreign key(username)
references dbo.account(username)


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
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (3, N'Boss')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (4, N'Chef')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (5, N'Guest')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[size] ON 

INSERT [dbo].[size] ([size_id], [name]) VALUES (1, N'small')
INSERT [dbo].[size] ([size_id], [name]) VALUES (2, N'medium')
INSERT [dbo].[size] ([size_id], [name]) VALUES (3, N'large')
SET IDENTITY_INSERT [dbo].[size] OFF
GO
SET IDENTITY_INSERT [dbo].[authorized] ON 

INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (1, N'vuongnm', 1)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (2, N'vuongnm', 2)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (3, N'dathx', 4)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (4, N'dathx', 2)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (5, N'phucvh', 5)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (6, N'phuocqd', 5)
INSERT [dbo].[authorized] ([authorized_id], [username], [role_id]) VALUES (11, N'user04', 1)
SET IDENTITY_INSERT [dbo].[authorized] OFF
GO

INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (1, N'Chicken In Teriyaki1111', 22.3500, N'feature-item-1.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (2, N'Hotdog With Sausage', 30.3500, N'feature-item-2.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (3, N'Breakfast With Sweet', 52.3500, N'feature-item-3.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (4, N'Grilled Chicken Stick', 25.3500, N'feature-item-4.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (5, N'Chicken Barista platter', 32.3500, N'feature-item-5.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (6, N'French Fries Pack', 15.3500, N'feature-item-6.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (7, N'Banh Mi', 10.0000, N'banh-mi.jpg')
INSERT [dbo].[food] ([food_id], [food_name], [price], [photo]) VALUES (8, N'Donuts', 15.0000, N'donut.jpg')

GO
SET IDENTITY_INSERT [dbo].[foodCategory] ON 

INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (1, N'Dishes', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (2, N'Nuts & Green', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (3, N'Smoothies', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (4, N'Vegetables', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (5, N'Takeaway Pack', N'no')
INSERT [dbo].[foodCategory] ([foodCategory_id], [foodCategory_name], [description]) VALUES (6, N'Fresh Fruits', N'no')
SET IDENTITY_INSERT [dbo].[foodCategory] OFF

GO
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (1, 1, 1, N'no', 1, N'feature-item-1.jpg', N'feature-item-1.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (2, 1, 1, N'no', 2, N'feature-item-2.jpg', N'feature-item-2.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (3, 4, 1, N'no', 1, N'feature-item-3.jpg', N'feature-item-3.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (4, 5, 1, N'no', 2, N'feature-item-4.jpg', N'feature-item-4.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (5, 2, 1, N'no', 3, N'feature-item-5.jpg', N'feature-item-5.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (6, 5, 1, N'no', 3, N'feature-item-6.jpg', N'feature-item-6.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (7, 1, 1, N'no', 1, N'feature-item-1.jpg', N'feature-item-1.jpg')
INSERT [dbo].[foodDetail] ([food_id], [category_id], [status], [description], [size_id], [image_title1], [image_title2]) VALUES (8, 1, 1, N'no', 2, N'feature-item-2.jpg', N'feature-item-2.jpg')

GO
SET IDENTITY_INSERT [dbo].[favorite] ON 

INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (3, 2, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (4, 3, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (5, 2, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (6, 2, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (7, 6, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (8, 30, N'vuongnm')
INSERT [dbo].[favorite] ([favorite_id], [food_id], [username]) VALUES (9, 36, N'vuongnm')
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
SET IDENTITY_INSERT [dbo].[favorite] OFF
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
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (13, 13, 30, 3, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (14, 13, 42, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (15, 13, 36, 6, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (16, 14, 30, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (17, 14, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (18, 14, 42, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (19, 15, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (20, 15, 20, 1, 752.5700)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (21, 15, 17, 1, 578.7100)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (22, 16, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (23, 20, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (24, 20, 30, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (25, 20, 42, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (26, 21, 30, 22, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (27, 21, 30, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (28, 22, 30, 22, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (29, 22, 30, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (30, 23, 36, 21, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (31, 24, 42, 22, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (32, 25, 31, 39, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (33, 25, 38, 23, 30.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (34, 25, 2, 24, 30.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (35, 26, 37, 1, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (36, 26, 31, 1, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (37, 27, 42, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (38, 27, 36, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (39, 27, 31, 1, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (40, 27, 37, 1, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (41, 28, 30, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (42, 28, 42, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (43, 28, 31, 3, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (44, 29, 30, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (45, 29, 36, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (46, 29, 42, 6, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (47, 30, 6, 6, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (48, 31, 42, 6, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (49, 32, 37, 5, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (50, 33, 31, 7, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (51, 34, 36, 50, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1051, 1034, 7, 26, 10.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1052, 1034, 6, 15, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1053, 1035, 2, 22, 30.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1054, 1035, 4, 23, 25.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1055, 1036, 7, 1, 10.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1056, 1036, 8, 21, 15.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1057, 1036, 1, 23, 22.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1058, 1036, 6, 24, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1059, 1036, 2, 24, 30.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1060, 1037, 7, 1, 10.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1061, 1038, 7, 1, 10.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1062, 1040, 6, 1, 15.3500)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1063, 1040, 8, 4, 15.0000)
INSERT [dbo].[orderDetail] ([orderDetail_id], [order_id], [food_id], [quantity], [price]) VALUES (1064, 1041, 7, 1, 10.0000)
SET IDENTITY_INSERT [dbo].[orderDetail] OFF
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

GO
create   proc [dbo].[sp_cancelPaypal]
as
begin
   delete from dbo.orders where order_id in (
select max(order_id) from dbo.orders
)
end

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


create table dbo.comment
(
comment_id int identity(1,1),
food_id int not null, 
username varchar(50) not null,
content nvarchar(max),
createdate datetime
)
alter table dbo.comment
add constraint fk_cmt_f
foreign key(food_id)
references dbo.food(food_id)

alter table dbo.comment
add constraint fk_cmt_acc
foreign key(username)
references dbo.account(username)


