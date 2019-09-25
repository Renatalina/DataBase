use master;
GO
--drop DATABASE BookShop;

CREATE DATABASE BookShop;
GO 

use BookShop;
CREATE TABLE Autor (
ID int NOT NULL Primary Key identity,
Name nvarchar (50) NOT NULL     
)
GO

use BookShop;
CREATE TABLE Press (
ID int NOT NULL Primary Key identity,
Name nvarchar (50) NOT NULL 
)
GO


use BookShop;
CREATE TABLE Book (
ID int NOT NULL Primary Key,
Name nvarchar (50) NOT NULL, 
Pages int NOT NULL, 
Years int NOT NULL, 
ID_Autors int NOT NULL CONSTRAINT ID_Autor FOREIGN KEY REFERENCES Autor(ID)
                            ON UPDATE CASCADE
							ON DELETE CASCADE, 
ID_Press int NOT NULL CONSTRAINT ID_Pres FOREIGN KEY  REFERENCES Press(ID)
                            ON UPDATE CASCADE
							ON DELETE CASCADE
)
GO

use BookShop;
CREATE TABLE Store (
ID int NOT NULL Primary key identity(1,1),
ID_Book int NOT NULL CONSTRAINT ID_Books FOREIGN KEY REFERENCES Book(ID),
Cost_Price money NOT NULL,
Data_purchases datetime NOT NULL
)
GO

CREATE INDEX idx_bookName
ON Book(Name)
GO


use BookShop;
CREATE TABLE Seller (
ID int NOT NULL Primary Key identity,
FullName nvarchar (50) NOT NULL
                    CHECK(FullName LIKE '%[А-Яа-я]%'),
Phone bigint NOT NULL  CHECK(Phone BETWEEN 0 AND 9999999999) ,
Sallary money default(2000)
)
GO
use BookShop;
CREATE TABLE Customer (
ID int NOT NULL Primary Key  identity,
FullName nvarchar (50) NOT NULL  CHECK(FullName LIKE '%[А-Яа-я]%'),
Discount int,
TotalSum money,
Phone bigint NOT NULL  CHECK(Phone BETWEEN 0 AND 9999999999) 
)
GO

use BookShop;
CREATE TABLE SaleBook (
ID int NOT NULL Primary Key identity,
ID_Book int NOT NULL CONSTRAINT ID_Bookss FOREIGN KEY REFERENCES Book (ID)
                            ON UPDATE CASCADE
							ON DELETE CASCADE,  
ID_Seller int NOT NULL CONSTRAINT ID_Sellers FOREIGN KEY  REFERENCES Seller (ID)
                            ON UPDATE CASCADE
							ON DELETE CASCADE, 
ID_Customer int NOT NULL CONSTRAINT ID_Customers FOREIGN KEY  REFERENCES Customer (ID)
                            ON UPDATE CASCADE
							ON DELETE CASCADE, 
Price money NOT NULL,
Data_sale date NOT NULL, 
Time_sale time NOT NULL,
Quentity int CHECK (Quentity>0)
)
GO


use BookShop;
INSERT INTO Autor VALUES (N'Dan Brown');
INSERT INTO Autor VALUES (N'Marian Kotiyar');
INSERT INTO Autor VALUES (N'Orlando Blume');
INSERT INTO Autor VALUES (N'Kristoph Grange');
INSERT INTO Autor VALUES (N'Агата Кристи');
INSERT INTO Autor VALUES (N'Татьяна Полякова');
INSERT INTO Autor VALUES (N'Марина Устинова');
INSERT INTO Autor VALUES (N'Дарья Донцова');
INSERT INTO Autor VALUES (N'Stiven Pratt');
INSERT INTO Autor VALUES (N'Александр Никольский');
INSERT INTO Autor VALUES (N'Сергей Бегловой');
GO

use BookShop;
INSERT INTO Press VALUES (N'Эксмо москва');
INSERT INTO Press VALUES (N'РоссЭлит');
INSERT INTO Press VALUES (N'BerlinPress');
INSERT INTO Press VALUES (N'Tallin Paper');
INSERT INTO Press VALUES (N'American News');
INSERT INTO Press VALUES (N'Украинские Писатели');
INSERT INTO Press VALUES (N'Фортуна');
GO

use BookShop;
INSERT INTO Book VALUES (1, 'Bed Ideas',990, 2018,1,1);
INSERT INTO Book VALUES (2, 'Good Ideas',1190, 2018,7,1);
INSERT INTO Book VALUES (3, 'Rich Ideas',450, 2016,5,2);
INSERT INTO Book VALUES (4, 'My Ideas',830, 2013,11,4);
INSERT INTO Book VALUES (5, 'Your Ideas',750, 2013,10,6);
INSERT INTO Book VALUES (6, 'Big Ideas',610, 2015,3,4);
INSERT INTO Book VALUES (7, 'All Ideas',610, 2014,3,4);
INSERT INTO Book VALUES (8, 'NaN Ideas',790, 2016,9,4);
INSERT INTO Book VALUES (9, 'Perfict Ideas',120, 2017,5,6);
INSERT INTO Book VALUES (10, 'Full Ideas',790, 2017,7,3);
INSERT INTO Book VALUES (11, 'Great Ideas',790, 2015,7,5);
INSERT INTO Book VALUES (12, 'Lost Ideas',1000, 2009,2,2);
INSERT INTO Book VALUES (13, 'Rud Ideas',550, 2017,5,3);
INSERT INTO Book VALUES (14, 'Many Ideas',240, 2015,2,5);
INSERT INTO Book VALUES (15, 'Better Ideas',600, 2018,9,2);
INSERT INTO Book VALUES (16, 'Ideas',600, 2018,9,2);
GO

use BookShop;
INSERT INTO Store VALUES (1,5200,'2018-03-05');
INSERT INTO Store VALUES (1,5200,'2018-03-05');
INSERT INTO Store VALUES (1,5200,'2018-05-15');
INSERT INTO Store VALUES (1,4200,'2018-05-13');
INSERT INTO Store VALUES (1,4200,'2018-05-25');
INSERT INTO Store VALUES (2,3200,'2018-03-05');
INSERT INTO Store VALUES (2,2200,'2017-03-05');
INSERT INTO Store VALUES (2,2200,'2017-03-05');
INSERT INTO Store VALUES (2,2200,'2017-03-05');
INSERT INTO Store VALUES (2,2200,'2017-03-05');
INSERT INTO Store VALUES (2,3200,'2018-03-05');
INSERT INTO Store VALUES (2,3200,'2018-03-05');
INSERT INTO Store VALUES (3,420,'2018-06-05');
INSERT INTO Store VALUES (3,300,'2018-07-05');
INSERT INTO Store VALUES (3,300,'2018-08-05');
INSERT INTO Store VALUES (4,1300,'2018-05-05');
INSERT INTO Store VALUES (4,1500,'2018-10-16');
INSERT INTO Store VALUES (5,220,'2018-09-09');
INSERT INTO Store VALUES (5,200,'2018-06-09');
INSERT INTO Store VALUES (5,200,'2018-06-09');
INSERT INTO Store VALUES (5,200,'2018-06-09');
INSERT INTO Store VALUES (5,420,'2018-10-09');
INSERT INTO Store VALUES (6,750,'2018-04-11');
INSERT INTO Store VALUES (6,750,'2018-04-11');
INSERT INTO Store VALUES (6,750,'2018-01-11');
INSERT INTO Store VALUES (6,750,'2018-01-11');
INSERT INTO Store VALUES (7,950,'2018-07-11');
INSERT INTO Store VALUES (7,950,'2018-07-11');
INSERT INTO Store VALUES (8,1150,'2016-12-11');
INSERT INTO Store VALUES (9,150,'2018-11-01');
INSERT INTO Store VALUES (10,620,'2018-10-01');
INSERT INTO Store VALUES (10,620,'2018-10-01');
INSERT INTO Store VALUES (11,810,'2018-09-01');
INSERT INTO Store VALUES (12,2500,'2017-10-01');
INSERT INTO Store VALUES (13,520,'2017-12-01');
INSERT INTO Store VALUES (13,720,'2018-10-01');
INSERT INTO Store VALUES (14,520,'2018-02-03');
INSERT INTO Store VALUES (15,720,'2018-05-06');
GO

use BookShop;
INSERT INTO Seller(FullName,Phone) VALUES ('Яковлева Марина',0950010020);
INSERT INTO Seller(FullName,Phone) VALUES ('Мушкара Иван',0500010020);
GO

use BookShop;
INSERT INTO Customer VALUES (N'Лаврентьева Елизавета',40,8000,0950652312);
INSERT INTO Customer VALUES (N'Магилашвили Георгий',10,1100,0950652312);
INSERT INTO Customer VALUES (N'Зуев Даниил',15,1350,0950652312);
INSERT INTO Customer VALUES (N'Бережная Виталия',25,1600,0950652312);
INSERT INTO Customer VALUES (N'Мулиев Виктор',10,1000,0950652312);
INSERT INTO Customer VALUES (N'Калинина Екатерина',0,650,0950652312);
INSERT INTO Customer VALUES (N'Викторина Галина',25,10010,0950652312);
GO

--ID BOOK 15, ID Seller 2, ID Custom 7, Price, Data, Time 
use BookShop; 
INSERT INTO SaleBook VALUES (1,1,1,6100,'2018-10-01','12:30:25',5);
INSERT INTO SaleBook VALUES (3,2,2,500,'2018-10-11','15:30:25',2);
INSERT INTO SaleBook VALUES (4,1,4,1600,'2018-10-01','12:30:25',1);
INSERT INTO SaleBook VALUES (5,1,3,500,'2018-10-11','15:30:25',3);
INSERT INTO SaleBook VALUES (6,2,7,800,'2018-10-01','19:30:25',4);
INSERT INTO SaleBook VALUES (7,1,7,1100,'2018-10-11','14:30:25',1);
INSERT INTO SaleBook VALUES (8,1,7,800,'2018-10-01','15:30:25',5);
INSERT INTO SaleBook VALUES (9,1,7,1100,'2018-10-11','17:30:25',2);
INSERT INTO SaleBook VALUES (10,2,6,650,'2018-10-11','16:30:25',1);
INSERT INTO SaleBook VALUES (11,2,5,1000,'2018-10-11','15:00:25',2);
INSERT INTO SaleBook VALUES (12,1,7,1100,'2018-10-11','17:30:25',2);
INSERT INTO SaleBook VALUES (13,2,6,650,'2018-10-11','16:30:25',1);
INSERT INTO SaleBook VALUES (14,2,5,1000,'2018-10-11','15:00:25',2);
INSERT INTO SaleBook VALUES (15,2,6,650,'2018-10-11','16:30:25',1);
INSERT INTO SaleBook VALUES (16,2,5,1000,'2018-10-11','15:00:25',2);
GO
--•	Выбрать самые популярные 10 книг.
CREATE PROC PopularBook 
AS 
BEGIN 
 SELECT TOP 10 B.Name AS [NameBook]
  FROM dbo.Book AS B
  INNER JOIN dbo.SaleBook AS S ON S.ID_Book=B.ID
  ORDER BY Quentity DESC 
     
END
GO
exec PopularBook;

--•	Показать статистику времени покупки книг, в какое время больше всего, в какое меньше покупают книги.
CREATE PROC GoodTimeSale 
AS 
BEGIN 
Declare @morning int, @dinner int, @evening int
SET @morning=(SELECT COUNT (t)
FROM(SELECT S.Time_sale AS [GoodTime]
  FROM dbo.SaleBook AS S
  INNER JOIN dbo.Book AS B ON S.ID_Book=B.ID
  WHERE S.Time_sale < '12:00:00') AS mornin(t))
SET @dinner=(SELECT COUNT(t)
FROM (SELECT S.Time_sale AS [GoodTime]
  FROM dbo.SaleBook AS S
  INNER JOIN dbo.Book AS B ON S.ID_Book=B.ID
  WHERE S.Time_sale > '12:00:00' AND S.Time_sale <'16:00:00') AS sunday(t))
SET @evening=(SELECT COUNT(t)
FROM (SELECT S.Time_sale AS [GoodTime]
  FROM dbo.SaleBook AS S
  INNER JOIN dbo.Book AS B ON S.ID_Book=B.ID
  WHERE S.Time_sale > '16:00:00') AS night(t))
 
IF (@morning>@dinner AND @morning>@evening)
BEGIN
PRINT N'Morning- good day for the shopping!'
END
IF (@morning<@dinner AND @dinner>@evening)
BEGIN
PRINT N'Dinner- good day for the shopping!'
END  
IF (@morning<@evening AND @dinner<@evening)
BEGIN
PRINT N'Evening- good day for the shopping!'
END      
END
GO

exec GoodTimeSale;
GO
--•	Какие авторы пользуются наибольшей популярностью у покупателей
CREATE PROC PopularAutors
AS 
BEGIN 
SELECT DISTINCT TOP 3 A.Name, Quentity
FROM dbo.Autor AS A
INNER JOIN dbo.Book AS B ON B.ID_Autors=A.ID
INNER JOIN dbo.SaleBook AS S ON S.ID_Book=B.ID 
ORDER BY Quentity DESC

END 
GO
exec PopularAutors;

use Bookshop;
--•	Максимальная и минимальная стоимость книги.
GO
CREATE PROC MinMaxPrice 
AS 
BEGIN 
DECLARE @maxprice money, @minprice money
SET @maxprice=(SELECT MAX(S.Price) 
FROM dbo.SaleBook AS S)
SET @minprice=(SELECT MIN(S.Price) 
FROM dbo.SaleBook AS S)
PRINT N'Max price deside '+ cast (@maxprice as nvarchar(20)) + N'  Min price deside ' + cast (@minprice as nvarchar(20));
END

exec MinMaxPrice;

--•	Список продавцов, которые продали максимальное количество книг за указанный период.
GO
CREATE PROC MaxSeller
AS 
BEGIN 
   SELECT TOP 1 SL.FullName AS [ Better Seller]
   FROM dbo.Seller AS SL    
  INNER JOIN dbo.SaleBook AS S ON S.ID_Seller=SL.ID
  ORDER BY Quentity DESC
END 
exec MaxSeller;

--•	Сумму премий каждого продавца. Предположим, что премия рассчитывается по следующему алгоритму: 
--o	100000-129900 грн премия 10% от закупочной стоимости книг
--o	130000-149900 грн премия 15% от закупочной стоимости книг
--o	150000-199900 грн премия 25% от закупочной стоимости книг
--o	200000-300000 грн премия 40% от закупочной стоимости книг
GO 
CREATE PROC PremierSeller
@seller int
AS 
BEGIN 
Declare @primier int
 SET @primier=(SELECT SUM(ST.Cost_Price)
 FROM dbo.Store AS ST 
 INNER JOIN dbo.Book AS B ON B.Id=ST.ID_Book
 INNER JOIN dbo.SaleBook AS S ON S.ID_Book=B.ID
 WHERE S.ID_Seller=@seller)
 DECLARE @sumFirst int
 if (@primier>100000 AND @primier<129900)
  BEGIN
      SET @sumFirst=@primier*0.1	  
  END 
   if (@primier>130000 AND @primier<149900)
  BEGIN
      SET @sumFirst=@primier*0.15	  
  END
  if (@primier>150000 AND @primier<199900)
  BEGIN
      SET @sumFirst=@primier*0.25	  
  END
  if (@primier>200000 AND @primier<300000)
  BEGIN
      SET @sumFirst=@primier*0.40	  
  END
  if(@primier<100000)
  BEGIN 
  PRINT N'Sorry, you haven`t premier!';
  END
  Print N'Your premier deside ' + cast (@sumFirst as nvarchar (20))
END 

exec PremierSeller 1;
exec PremierSeller 2;


--4.	Реализовать хранимые процедуры для выполнения операций добавления, удаления и обновления данных хранящихся в таблицах базы данных.
GO
CREATE PROC AddBook
@ID_B int, 
@NameBook nvarchar(50),
@Pages int,
@Years int,
@ID_Autors int,
@ID_Press int
AS 
BEGIN 
INSERT INTO dbo.Book(ID,Name,Pages,Years,ID_Autors,ID_Press) VALUES(@ID_B,@NameBook, @Pages,@Years, @ID_Autors, @ID_Press);
END
GO

exec AddBook 17,N'First Ideas',800,2017,2,2;

CREATE PROC DeleteBook
@NameBook nvarchar(20)
AS 
BEGIN 
IF EXISTS(SELECT B.Name FROM dbo.Book AS B WHERE B.Name=@NameBook)
   BEGIN 
   DECLARE @Num int
   SET @Num=(SELECT B.ID FROM dbo.Book AS B WHERE B.Name=@NameBook)
   DELETE FROM Book WHERE Book.ID=@Num
   END 
END
GO 

exec DeleteBook N'Ideas';

GO
CREATE PROC UpdateBook 
@ID_B int,
@NameBook nvarchar(50),
@Pages int,
@Years int,
@ID_Autors int,
@ID_Press int
AS 
BEGIN 
IF EXISTS (SELECT B.ID FROM dbo.Book AS B WHERE B.ID=@ID_B)
 BEGIN 
 UPDATE dbo.Book  SET Name=@NameBook, Pages=@Pages, Years=@Years,
 ID_Autors=@ID_Autors, ID_Press=@ID_Press
 WHERE Book.ID=@ID_B
 END
END
GO


--5.	Реализовать триггеры выполняющие следующие задачи:
--•	Возможность добавления новый книги только в том случае если остаток на складе не превышает 25 штук.
CREATE TRIGGER NewBook
ON  Book
FOR INSERT, UPDATE
AS 
DECLARE @add int 
SELECT @add=(SELECT COUNT (ST.ID_Book) -- прoверяем если товарa больше 25 штук, 
FROM dbo.Store AS ST 
JOIN inserted AS I ON I.ID=ST.ID_Book)
IF @add>=25 
BEGIN
rollback tran  -- делаем откат 
raiserror ('You have more 25 products',16,1)
END
GO 

--•	Удалить (списать) книги только тогда, когда срок хранение на складе превысил 1 год.
CREATE TRIGGER DelBook
ON  Store
FOR DELETE
AS 
DECLARE @del date 
SELECT @del=(SELECT ST.Data_purchases 
FROM dbo.Store AS ST 
JOIN deleted AS d ON d.ID=ST.ID_Book)
IF @del<=(CONVERT(datetime, '1/1/2017', 1)) 
BEGIN
rollback tran  
raiserror ('You can`t delete this book!',16,1)
END
GO 


--6.	Реализовать пользовательскую функцию, которая считает скидку покупателя(по его ID). Предположим: 
--•	покупка на сумму 100-299 гривен скидка составляет 2% 
--•	300-499 гривен скидка 5%
--•	500-999 гривен скидка 7%
--•	1000 и более скидка 10% 

CREATE FUNCTION Amount(@Id_Custom int, @Sum money)
RETURNS int 
AS 
BEGIN 
DECLARE @amount int
IF (@Sum >100 AND @Sum <299)
 BEGIN
 SET @amount=2
 END
IF (@Sum >300 AND @Sum <499)
 BEGIN
 SET @amount=5
 END
IF (@Sum >500 AND @Sum <999)
 BEGIN
 SET @amount=7
 END
IF (@Sum >1000)
 BEGIN
 SET @amount=10
 END
return @amount
END
go


--8.	Для доступа к серверу БД создать 2 пользователей с правами(админа)
-- для руководителя магазина и обычного пользователя(продавцов). 
--Вам необходимо самостоятельно выбрать, какими ролями уровня БД будет наделен каждый из этих пользователей.

exec sp_addlogin @loginame='Principal', @passwd='King', @defdb='BookShop'

ALTER SERVER ROLE dbcreator ADD MEMBER Principal
ALTER SERVER ROLE db_securityadmin ADD MEMBER Principal
ALTER SERVER ROLE db_datareader ADD MEMBER Principal
ALTER SERVER ROLE db_datawriter ADD MEMBER Principal

exec sp_addlogin @loginame='Seller', @passwd='Work', @defdb='BookShop'
ALTER SERVER ROLE db_datareader ADD MEMBER Principal
ALTER SERVER ROLE db_datawriter ADD MEMBER Principal

 
