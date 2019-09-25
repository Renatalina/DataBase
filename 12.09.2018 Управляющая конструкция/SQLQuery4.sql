go
--example 1
CREATE PROC AllCrafts
AS
BEGIN
SELECT C.ID[�], C.Name[�������],
C.Description [�������� �������]
 FROM dbo.Craft AS C
END
go
--exec AllCrafts
--example 2
CREATE PROC FindCraft--�������� ���
@craftName varchar(20)--�������� ��������
AS
BEGIN
SELECT C.ID[�], C.Name[�������],C.Description [�������� �������]
FROM dbo.Craft AS C
WHERE C.Name=@craftName--�������� �������
END
go

exec FindCraft '���'
exec FindCraft '������'
exec FindCraft '��������'
exec FindCraft '��������������'

DECLARE @k int, @name varchar(20);
--������ ��������
SET @k=0;
SET @name='Group'
--������
--�) 
SELECT @k AS [@k], @name AS [@name]
--�)
print cast (@k as varchar(20))+' '+ @name
print convert (varchar(20), @k)+' '+ @name

print @k 
print @name

go 

DECLARE @k int 
SELECT @k=(SELECT COUNT(*) FROM dbo.Craft) --������ ����� ����� � ������� ������

SELECT @k AS [���������� �������]

print cast (@k as varchar(20))+' '+ @name
print @k 
GO

exec AllCrafts
GO

SELECT C.ID AS [�], [������ ��� �������� �������]=case C.ID%2 
when 0 then '������ �������'
when 1 then '�������� �������'
end,
 C.Name[�������],
C.Description [�������� �������]
 FROM dbo.Craft AS C
 GO


 SELECT DATEDIFF(DAY,GETDATE(),'2018-12-31') --���������� ���������� ���� �� ������ ����  
 SELECT DATEDIFF(DAY,GETDATE(),'2019-06-08')-- �� �� �������
 SELECT DATEDIFF(MONTH,GETDATE(),'2019-02-14')-- �� ����� D�


 ----------------------------
 ALTER PROC FindCraft--�������� ���
@craftName varchar(20)--�������� ��������
AS
BEGIN
IF NOT EXISTS (                                                   ------ ���� �� ����� IF NOT EXISTS
SELECT C.ID[�], C.Name[�������],C.Description [�������� �������]
FROM dbo.Craft AS C
WHERE C.Name=@craftName--�������� �������
)
select 'Not have this job'
ELSE                                                            --- ���� ��� ����� ELSE 

SELECT C.ID[�], C.Name[�������],C.Description [�������� �������]
FROM dbo.Craft AS C
WHERE C.Name=@craftName--�������� �������

END
go
------------
exec FindCraft '���'--
---------
exec FindCraft '������'--
----------
exec FindCraft '��������'--
------------
exec FindCraft '��������������'--������ ������
------------
-----------
CREATE PROC CraftsCount 
@amount int output -- output �������� ����� ���������� ������ �� �� ������� ������ �� ����������
AS 
BEGIN 
SELECT @amount=(
SELECT COUNT(*) FROM dbo.Craft)
END
go

DECLARE @k int 
exec CraftsCount @k output -- � ��� ����� ��� ������ �� ������� ���� ����������
SELECT @k AS [@k]
GO
-------------------------




