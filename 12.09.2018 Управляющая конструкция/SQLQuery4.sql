go
--example 1
CREATE PROC AllCrafts
AS
BEGIN
SELECT C.ID[№], C.Name[Ремесло],
C.Description [Описание ремесла]
 FROM dbo.Craft AS C
END
go
--exec AllCrafts
--example 2
CREATE PROC FindCraft--Изменили имя
@craftName varchar(20)--добавили аргумент
AS
BEGIN
SELECT C.ID[№], C.Name[Ремесло],C.Description [Описание ремесла]
FROM dbo.Craft AS C
WHERE C.Name=@craftName--добавили условие
END
go

exec FindCraft 'СТО'
exec FindCraft 'Аптека'
exec FindCraft 'Булочная'
exec FindCraft 'Парикмахерская'

DECLARE @k int, @name varchar(20);
--задали значения
SET @k=0;
SET @name='Group'
--вывели
--а) 
SELECT @k AS [@k], @name AS [@name]
--б)
print cast (@k as varchar(20))+' '+ @name
print convert (varchar(20), @k)+' '+ @name

print @k 
print @name

go 

DECLARE @k int 
SELECT @k=(SELECT COUNT(*) FROM dbo.Craft) --запрос нужно брать в круглые скобки

SELECT @k AS [Количество ремесел]

print cast (@k as varchar(20))+' '+ @name
print @k 
GO

exec AllCrafts
GO

SELECT C.ID AS [№], [Четное или нечетное ремесло]=case C.ID%2 
when 0 then 'четное ремесло'
when 1 then 'нечетное ремесло'
end,
 C.Name[Ремесло],
C.Description [Описание ремесла]
 FROM dbo.Craft AS C
 GO


 SELECT DATEDIFF(DAY,GETDATE(),'2018-12-31') --высчитвыем количество дней до нового года  
 SELECT DATEDIFF(DAY,GETDATE(),'2019-06-08')-- до ДР Игорюши
 SELECT DATEDIFF(MONTH,GETDATE(),'2019-02-14')-- до моего DР


 ----------------------------
 ALTER PROC FindCraft--Изменили имя
@craftName varchar(20)--добавили аргумент
AS
BEGIN
IF NOT EXISTS (                                                   ------ если не нашли IF NOT EXISTS
SELECT C.ID[№], C.Name[Ремесло],C.Description [Описание ремесла]
FROM dbo.Craft AS C
WHERE C.Name=@craftName--добавили условие
)
select 'Not have this job'
ELSE                                                            --- если все нашли ELSE 

SELECT C.ID[№], C.Name[Ремесло],C.Description [Описание ремесла]
FROM dbo.Craft AS C
WHERE C.Name=@craftName--добавили условие

END
go
------------
exec FindCraft 'СТО'--
---------
exec FindCraft 'Аптека'--
----------
exec FindCraft 'Булочная'--
------------
exec FindCraft 'Парикмахерская'--просто поиски
------------
-----------
CREATE PROC CraftsCount 
@amount int output -- output позволит после завершения работы ХП не удалить данные из переменной
AS 
BEGIN 
SELECT @amount=(
SELECT COUNT(*) FROM dbo.Craft)
END
go

DECLARE @k int 
exec CraftsCount @k output -- и вот здесь при вызове мы получим наше количество
SELECT @k AS [@k]
GO
-------------------------




