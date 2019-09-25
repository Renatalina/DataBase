USE master
GO
IF NOT EXISTS (SELECT 'True' FROM sys.databases WHERE name = 'SantaBelinda')
	CREATE DATABASE SantaBelinda
ELSE
	PRINT 'Database already exsists'
GO
USE SantaBelinda
GO
CREATE TABLE People (
	ID bigint IDENTITY NOT NULL 
		CONSTRAINT PK_People PRIMARY KEY 
		 CHECK(ID BETWEEN 0 AND 9999999999),
	Surname nvarchar(20) NOT NULL 
		CHECK(Surname LIKE '%[А-Яа-я]%'),
	Name nvarchar(15) NOT NULL 
		CHECK(Name LIKE '%[А-Яа-я]%'),
	Sex tinyint NOT NULL 
		DEFAULT 1 CHECK(Sex IN (0,1)),
	DateOfBirth datetime NOT NULL 
		CHECK(DateOfBirth BETWEEN 
		CONVERT(datetime, '1/1/1753', 103) and CONVERT(datetime, '1/1/2018', 103)),
	DateD datetime NULL 
		CHECK(DateD BETWEEN CONVERT(datetime, '1/1/1753', 103) and CONVERT(datetime, '1/1/2018', 103)),
	Father nvarchar(20) NULL 
		CHECK(Father LIKE '%[А-Яа-я]%'),
	Mother nvarchar(20) NULL 
		CHECK(Mother LIKE '%[А-Яа-я]%')
)
GO
INSERT INTO People VALUES(N'Иванов',N'Иван',0,'1/1/1985',NULL,N'Сергей',N'Ирина')
INSERT INTO People VALUES(N'Никольский',N'Иван',0,'1/1/1985',NULL,N'Сергей',N'Ирина')
INSERT INTO People VALUES(N'Петорова',N'Ольга',1,'1/1/1995',NULL,N'Кирилл',N'Светлана')
INSERT INTO People VALUES(N'Никольский',N'Кирилл',0,'1/1/1965',NULL,N'Петр',N'Елизавета')
INSERT INTO People VALUES(N'Никольская',N'Ирина',1,'1/1/1968',NULL,N'Александр',N'Юлия')
INSERT INTO People VALUES(N'Сергеев',N'Кирилл',0,'1/1/1968',NULL,N'Александр',N'Юлия')
INSERT INTO People VALUES(N'Якольский',N'Кирилл',0,'1/1/1965',NULL,N'Петр',N'Елизавета')
INSERT INTO People VALUES(N'Ольская',N'Ирина',1,'1/1/1968',NULL,N'Александр',N'Юлия')
INSERT INTO People VALUES(N'Игеев',N'Кирилл',0,'1/1/1968',NULL,N'Александр',N'Юлия')
GO
CREATE TABLE House (
ID int IDENTITY NOT NULL 
	CONSTRAINT PK_House PRIMARY KEY  CHECK(ID BETWEEN 0 AND 99999999),
Addres varchar(50) NOT NULL 
	UNIQUE,
DateBuild datetime NOT NULL 
	CHECK(DateBuild BETWEEN CONVERT(datetime, '1/1/1753', 103) and CONVERT(datetime, '1/1/2018', 103)),
DateDem datetime NULL 
	CHECK(DateDem BETWEEN CONVERT(datetime, '1/1/1753', 103) and CONVERT(datetime, '1/1/2018', 103)),
Area float(6) NOT NULL 
	CHECK(Area BETWEEN 0 AND 9999)
)
GO
INSERT INTO House VALUES(N'ул.Кленовая, 8',N'1/1/1958',NULL,115.5)
INSERT INTO House VALUES(N'ул.Кленовая, 9',N'1/1/1958',NULL,165.5)
INSERT INTO House VALUES(N'ул.Кленовая, 10',N'1/1/1958',NULL,165.5)
INSERT INTO House VALUES(N'ул.Кленовая, 11',N'1/1/1958',NULL,65.5)

CREATE TABLE Occupant
(
ID int identity primary key,
IdPeople bigint NOT NULL CONSTRAINT FK_Occupant_IdPeople
							FOREIGN KEY REFERENCES People(ID)
							ON UPDATE CASCADE
							ON DELETE CASCADE,
IdHouse int NOT NULL CONSTRAINT FK_Occupant_IdHouse
							FOREIGN KEY REFERENCES House(ID)
							ON UPDATE CASCADE
							ON DELETE CASCADE,
DateIn datetime NOT NULL 
	CHECK(DateIn BETWEEN CONVERT(datetime, '1/1/1753', 103) and CONVERT(datetime, '1/1/2018', 103)),
DateOut datetime NULL
	CHECK(DateOut BETWEEN CONVERT(datetime, '1/1/1753', 103) and CONVERT(datetime, Getdate(), 103))
)
INSERT INTO Occupant VALUES(4,1,'5/1/1968',NULL)
INSERT INTO Occupant VALUES(5,1,'5/1/1985',NULL)
INSERT INTO Occupant VALUES(2,1,'5/1/1986',NULL)

INSERT INTO Occupant VALUES(1,2,'5/1/1985',NULL)

INSERT INTO Occupant VALUES(3,3,'5/1/1986',NULL)
INSERT INTO Occupant VALUES(6,4,'5/1/1986',NULL)

GO
CREATE TABLE Craft
(
	ID smallint IDENTITY NOT NULL 
		CONSTRAINT PK_Craft PRIMARY KEY CHECK(ID BETWEEN 0 AND 999),
	Name varchar(20) NOT NULL 
		CONSTRAINT AK_Craft UNIQUE,
	Description varchar(200) NULL
)
GO
INSERT INTO Craft VALUES('СТО','ремонт машин')
INSERT INTO Craft VALUES('Булочная','выпечка хлеба'),('Строительство','строительство дорог'),
('Аптека','продажа лекарств'),('Магазин','продажа товаров')
CREATE TABLE BusinessMans
(
ID int identity primary key,
IdPeople bigint NOT NULL CONSTRAINT FK_BusinessMans_IdPeople
							FOREIGN KEY REFERENCES People(ID)
							ON UPDATE CASCADE
							ON DELETE CASCADE,
IdCraft smallint NOT NULL CONSTRAINT FK_BusinessMans_IdCraft 
							FOREIGN KEY REFERENCES Craft(ID)
							ON UPDATE CASCADE
							ON DELETE CASCADE,
DateCom datetime NOT NULL 
	CHECK(DateCom BETWEEN CONVERT(datetime, '1/1/1753', 103) and CONVERT(datetime, '1/1/2018', 103)),
DateEx datetime NULL 
	CHECK(DateEx BETWEEN CONVERT(datetime, '1/1/1753', 103) and CONVERT(datetime, '1/1/2018', 103)),
Reason varchar(80) NULL,
Workmans smallint NOT NULL DEFAULT 0 CHECK(Workmans BETWEEN 0 AND 999)
)
INSERT INTO BusinessMans VALUES(4,1,'1/1/1983',NULL,NULL,3)
INSERT INTO BusinessMans VALUES(8,2,'1/1/1998',NULL,NULL,2)

INSERT INTO BusinessMans VALUES(9,3,'1/1/2003',NULL,NULL,13)

INSERT INTO BusinessMans VALUES(5,4,'1/1/2008',NULL,NULL,4)

INSERT INTO BusinessMans VALUES(1,5,'1/1/2008',NULL,NULL,2)