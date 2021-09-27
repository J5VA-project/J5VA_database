create database du_an_01
go
use du_an_01

go
create table dbo.customer
(
customer_id int primary key, 
username varchar(50) not null,
password varchar(50) not null,
fullName varchar(100) not null,
phone_No varchar(15),
address nvarchar(255),
email varchar(100) not null,
image varchar(255)
)

go
create table dbo.account
(
account_id int primary key,
username varchar(50) not null,
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
account_id int not null,
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
food_id int primary key identity(1,1),
food_name nvarchar(255) not null,
price money not null,
photo varchar(255)
)
go
create table dbo.favorite
(
favorite_id int primary key identity(1,1),
food_id int not null,
customer_id int not null
)
go
create table dbo.foodDetail
(
food_id int primary key identity(1,1),
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
account_id int not null,
customer_id int not null,
orderDate date not null,
discount int,
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
foreign key(account_id)
references dbo.account(account_id)

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

alter table dbo.orders
add constraint fk_orD_Acc
foreign key (account_id)
references dbo.Account(account_ID)

alter table dbo.orders
add constraint fk_orD_Cus
foreign key (customer_id)
references dbo.customer(customer_id)

alter table dbo.favorite
add constraint fk_fav_f
foreign key ( food_id)
references dbo.food(food_id)

alter table dbo.favorite
add constraint fk_fav_cus
foreign key (customer_id)
references dbo.customer(customer_id)