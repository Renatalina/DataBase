use master;
GO 

CREATE DATABASE Musicshop;
GO

use Musicshop;
CREATE TABLE Format (
id int primary key NOT NULL,
name varchar (20) NOT NULL
)
GO

INSERT INTO Format VALUES (1,'audio');
INSERT INTO Format VALUES (4,'mp3');
GO 

use Musicshop;
CREATE TABLE Bands (
id int primary key NOT NULL,
name nvarchar (20) NOT NULL,
year int)
GO

INSERT INTO Bands (id,name) VALUES (1,'��������');
INSERT INTO Bands VALUES (2,'������',2002);
INSERT INTO Bands VALUES (3,'����',1984);
INSERT INTO Bands VALUES (4,'�������',1995);
INSERT INTO Bands VALUES (5,'�������',1984);
INSERT INTO Bands VALUES (6,'��������',1983);
GO


use Musicshop;
CREATE TABLE CD (
id int primary key NOT NULL,
name nvarchar (50) NOT NULL,
CD_Date int NOT NULL,
id_band int NOT NULL FOREIGN KEY REFERENCES Bands(id),
id_format int NOT NULL FOREIGN KEY REFERENCES Format(id),
)
GO
INSERT INTO CD VALUES (1,'����',2004,1,1);
INSERT INTO CD VALUES (2,'���� �����',2002,2,1);
INSERT INTO CD VALUES (3,'�������� �����',2003,3,1);
INSERT INTO CD VALUES (4,'��� �������',2005,4,4);----
INSERT INTO CD VALUES (5,'��� �������',2005,5,4);--
INSERT INTO CD VALUES (6,'������ �����',2005,3,4);--
INSERT INTO CD VALUES (8,'���������',1997,6,4);--
INSERT INTO CD VALUES (9,'���������', 1997,6,1);
INSERT INTO CD VALUES (10,'������',1997,6,1);
GO


use Musicshop;
CREATE TABLE Sellers (
id int primary key NOT NULL,
name nvarchar (30) NOT NULL
)
GO
INSERT INTO Sellers VALUES (1,'������� ������');
INSERT INTO Sellers VALUES (2,'����� ���������');
GO

use Musicshop;
CREATE TABLE Selling (
id int primary key NOT NULL,
id_seller int NOT NULL FOREIGN KEY REFERENCES Sellers(id),
id_cd int NOT NULL FOREIGN KEY REFERENCES CD(id)
)
GO
INSERT INTO Selling VALUES (1,1,1);
INSERT INTO Selling VALUES (2,1,2);
INSERT INTO Selling VALUES (3,1,3);
INSERT INTO Selling VALUES (4,1,4);
INSERT INTO Selling VALUES (5,1,5);
INSERT INTO Selling VALUES (6,2,6);
INSERT INTO Selling VALUES (7,2,1);
INSERT INTO Selling VALUES (8,2,8);
INSERT INTO Selling VALUES (9,1,9);
INSERT INTO Selling VALUES (10,2,10);
GO


--    1. �������� ��� ���������� � ��������.
use Musicshop; 
SELECT CD.name AS [��� ������],CD.CD_Date AS [��� �������], Format.name AS [������], Sl.name AS [��� ��������]
FROM dbo.CD
INNER JOIN dbo.Format ON Format.id=CD.id
INNER JOIN dbo.Selling AS S ON S.id_cd=CD.id
INNER JOIN dbo.Sellers AS Sl ON Sl.id=S.id_seller
GO

--   2. �������� ���-�� ��������� ������ �� ������ �� �����. 
use Musicshop;
SELECT COUNT (S.id_cd) AS [���������� ���������], B.name AS [A�����]
FROM dbo.Selling AS S
INNER JOIN dbo.CD  ON CD.id=S.id_cd
INNER JOIN dbo.Bands AS B ON B.id=CD.id_band
GROUP BY B.name
ORDER BY COUNT(S.id_cd)


--   3. �������� ����� ���������� ������. 
use Musicshop;
SELECT  COUNT (CD.id_band), B.name AS [A�����]
FROM dbo.CD 
INNER JOIN dbo.Bands AS B ON B.id=CD.id_band
GROUP BY B.name
ORDER BY COUNT(CD.id_band)
GO


use Musicshop;
SELECT MAX (CD.id_band) AS [Album], B.name AS [A�����]
FROM dbo.CD
INNER JOIN dbo.Bands AS B ON B.id=CD.id_band
WHERE CD.id_band=(
SELECT  COUNT (CD.id_band) 
FROM dbo.CD 
--INNER JOIN dbo.Bands AS B ON B.id=CD.id_band
GROUP BY B.name
ORDER BY COUNT(CD.id_band))
GO

