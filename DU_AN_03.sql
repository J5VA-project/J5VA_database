drop database du_an_03
create database du_an_05
go
use du_an_05

go
create table dbo.account
(
username varchar(50) primary key,
password varchar(50) not null,
fullname nvarchar(100),
email varchar(100),
address nvarchar(250),
phone varchar(15),
hire_date date not null,
salary money not null,
gender bit,
birthdate date,
image varchar(255)
)

go
create table dbo.role
(
role_id int primary key identity(1,1),
role_name nvarchar(100) not null
)

go
create table dbo.authorized
(
authorized_id int primary key identity(1,1),
username varchar(50) not null,
role_id int not null
)

go
create table dbo.size
(
size_id int primary key identity(1,1),
name nvarchar(30) not null
)

go
create table dbo.foodCategory
(
foodCategory_id int primary key identity(1,1),
foodCategory_name nvarchar(100) not null,
description nvarchar(255) not null
)

go
create table dbo.food
(
food_id int primary key ,
food_name nvarchar(255) not null,
price money not null,
photo varchar(255)
)

go
create table dbo.favorite
(
favorite_id int primary key identity(1,1),
food_id int not null,
username varchar(50) not null
)

go
create table dbo.foodDetail
(
food_id int primary key,
category_id int not null,
status bit not null,
description nvarchar(255),
size_id int not null,
image_title1 varchar(255),
image_title2 varchar(255)
)

go
create table dbo.orders
(
order_id int primary key identity(1,1),
username varchar(50) not null,
orderDate date not null,
discount int,
note nvarchar(255),
status int not null,
address nvarchar(255) not null
)

go
create table dbo.orderDetail
(
orderDetail_id int primary key identity(1,1),
order_id int not null,
food_id int not null,
quantity int not null,
price money
)

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

----
--dbo.size
SET IDENTITY_INSERT dbo.size ON
insert into dbo.size (size_id, name) values
('1','small'),
('2','medium'),
('3','large')
SET IDENTITY_INSERT dbo.size OFF
--dbo.foodCategory
SET IDENTITY_INSERT dbo.foodCategory ON
insert into dbo.foodCategory (foodCategory_id, foodCategory_name, description) values
('1','Dishes','no'),
('2','Nuts & Green','no'),
('3','Smoothies','no'),
('4','Vegetables','no'),
('5','Takeaway Pack','no'),
('6','Fresh Fruits','no')
SET IDENTITY_INSERT dbo.foodCategory OFF
--dbo.food
insert into dbo.food (food_id, food_name, price, photo) values
('1','Chicken In Teriyaki','22.35','feature-item-1.jpg'),
('2','Hotdog With Sausage','30.35','feature-item-2.jpg'),
('3','Breakfast With Sweet','52.35','feature-item-3.jpg'),
('4','Grilled Chicken Stick','25.35','feature-item-4.jpg'),
('5','Chicken Barista platter','32.35','feature-item-5.jpg'),
('6','French Fries Pack','15.35','feature-item-6.jpg')

--dbo.foodDetail
insert into dbo.foodDetail (food_id, category_id, status, description, size_id, image_title1, image_title2) values
('1','1','1','no','1','feature-item-1.jpg','feature-item-1.jpg'),
('2','1','1','no','2','feature-item-2.jpg','feature-item-2.jpg'),
('3','4','1','no','1','feature-item-3.jpg','feature-item-3.jpg'),
('4','5','1','no','2','feature-item-4.jpg','feature-item-4.jpg'),
('5','2','1','no','3','feature-item-5.jpg','feature-item-5.jpg'),
('6','5','1','no','3','feature-item-6.jpg','feature-item-6.jpg')

--dbo.account
insert into dbo.account (username, password, fullname, email, address, phone, hire_date, salary, gender, birthdate, image) values
('vuongnm','123','Nguyen Minh Vuong','vuongnm@gmail.com','Binh Thuan','0375578190','2017/05/05','2500','1','1999/05/15','photo.jpg'),
('dathx','123','Hoang Xuan Dat','dathx@gmail.com','Dak Lak','0375578191','2017/05/05','2700','1','1998/04/25','photo.jpg'),
('phucvh','123','Vu Hoang Phuc','phucvh@gmail.com','Dong Thap','0375578192','2017/05/05','2300','1','1997/03/05','photo.jpg'),
('phuocqd','123','Quach Diem Phuoc','phuocqd@gmail.com','TPHCM','0375578193','2017/05/05','2200','1','1999/07/23','photo.jpg')

--dbo.favorite
SET IDENTITY_INSERT dbo.favorite ON
insert into dbo.favorite(favorite_id, food_id, username) values
('1','1','vuongnm'),
('2','1','dathx'),
('3','2','vuongnm'),
('4','3','vuongnm')
SET IDENTITY_INSERT dbo.favorite OFF

--dbo.role
SET IDENTITY_INSERT dbo.role ON
insert into dbo.role (role_id, role_name) values
('1','Manager'),
('2','Staff'),
('3','Boss'),
('4','Chef'),
('5','Guest')
SET IDENTITY_INSERT dbo.role OFF

--dbo.authorized
SET IDENTITY_INSERT dbo.authorized ON
insert into dbo.authorized (authorized_id, username, role_id) values
('1','vuongnm','1'),
('2','vuongnm','2'),
('3','dathx','4'),
('4','dathx','2'),
('5','phucvh','5'),
('6','phuocqd','5')
SET IDENTITY_INSERT dbo.authorized OFF
--dbo.orders
SET IDENTITY_INSERT dbo.orders ON
insert into dbo.orders (order_id,  username, orderDate,note, discount, status, address) values
('1','phuocqd','2021/09/29','','10','1','HCM'),
('2','phucvh','2021/09/29','','10','1','HCM'),
('3','phuocqd','2021/09/29','','5','1','HCM'),
('4','phucvh','2021/09/29','','10','1','HCM'),
('5','phucvh','2021/09/29','','20','1','HCM')
SET IDENTITY_INSERT dbo.orders OFF
--dbo.orderDetail
SET IDENTITY_INSERT dbo.orderDetail ON
insert into dbo.orderDetail (orderDetail_id, order_id, food_id, quantity, price) values
('1','1','1','1','22.35'),
('2','2','1','1','22.35'),
('3','3','2','1','30.35'),
('4','4','2','1','30.35'),
('5','5','3','1','52.35')
SET IDENTITY_INSERT dbo.orderDetail OFF
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