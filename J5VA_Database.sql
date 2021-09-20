GO 
CREATE DATABASE J5VA_version1
GO 
USE J5VA_version1
GO
/*
*
*/
CREATE TABLE Role (
  RoleID int Primary key Identity,
  RoleName nvarchar(100) not null


);


/*
*
*/
CREATE TABLE Authorized (
  ID int Primary key  Identity ,
  AccountID varchar(50),
  RoleID int


);


/*
*
*/
CREATE TABLE FoodCategory (
  FoodCategory_id int Primary key,
  FoodCategory_name nvarchar(100),
  Description nvarchar(255),
  Status int
	

);


/*
*
*/
CREATE TABLE Customer (
  Customer_Id varchar(50) Primary Key,
  Password varchar(50) not null,
  FullName nvarchar(30) not null,
  Phone_No varchar(15) unique not null,
  Address nvarchar(50),
  Email varchar(15) not null,
  Image varchar(15)


);


/*
*
*/
CREATE TABLE Account (
  AccountID varchar(50) primary key,
  Password nvarchar(50),
  Name nvarchar(100),
  Email nvarchar(100),
  Address nvarchar(250),
  Phone varchar(15),
  HireDate date,
  Salary money,
  Gender bit,
  BirthDate date,
  Image varchar(100)


);


/*
*
*/
CREATE TABLE Food (
  Food_id int primary key,
  Food_name nvarchar(70),
  idCategory int,
  Price money,
  Photo varchar(100),
  Sale int,
  Status bit,
  Descriptions nvarchar(255)


);


/*
*
*/
CREATE TABLE TableFood (
  TableFood_Id int primary key ,
  TableFood_Name nvarchar(30),
  Status int,
  TableCount int
);


/*
*
*/
CREATE TABLE Bill (
  Bill_Id int primary key,
  DateCheckIn Date,
  DateCheckIOut Date,
  idTable int,
  AccountID varchar(50),
  Discount int,
  Status int ,
  Customer_Id varchar(50) 


);


/*
*
*/
CREATE TABLE BillInfo (
  BillInfo_Id int primary key,
  idBill int,
  idFoood int,
  Quantities int,
  Price money


);


/*
*
*/
CREATE TABLE FeedBack (
  FeedBack_Id int ,
  Bill_Id int primary key,
  Rate int ,
  Description nvarchar(100),
  DateFeedBack date


);

alter table dbo.Authorized 
add constraint fk_Au_Role
foreign key (RoleID)
references dbo.Role(RoleID)

alter table dbo.Food
add constraint fk_Food_Cate
foreign key(idCategory)
references dbo.FoodCategory(FoodCategory_id)


alter table dbo.Authorized
add constraint fn_Acc_Au
foreign key (AccountID)
references dbo.Account(AccountID)


alter table dbo.Bill
add constraint fk_Bill_Cus
foreign key (Customer_Id)
references dbo.Customer(Customer_Id)

alter table dbo.Bill
add constraint fk_Bill_Tab
foreign key(idTable)
references dbo.TableFood(TableFood_Id)

alter table dbo.BillInfo
add constraint fk_BillInfo_Bill
foreign key(idBill)
references dbo.Bill(Bill_Id)

alter table dbo.Bill
add constraint fk_Bill_Acc
foreign key(AccountID)
references dbo.Account(AccountID)

alter table dbo.FeedBack
add constraint fk_Fb_Bill
foreign key (Bill_Id)
references dbo.Bill(Bill_Id)

alter table dbo.BillInfo
add constraint fk_BillInfo_Food
foreign key(idFoood)
references dbo.Food(Food_id)

