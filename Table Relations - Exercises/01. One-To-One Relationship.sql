CREATE DATABASE [TableRelations]
GO

USE [TableRelations]
GO

CREATE TABLE [Passports]
(
	[PassportID] INT IDENTITY (101,1) NOT NULL
	,[PassportNumber] VARCHAR(8) NOT NULL
)

ALTER TABLE [Passports]
ADD CONSTRAINT PK_PassportId 
PRIMARY KEY (PassportId)

INSERT INTO [Passports] 
     VALUES
	('N34FG21B')
	,('K65LO4R7')
	,('ZE657QP2')

CREATE TABLE [Persons]
(
	[PersonId] INT IDENTITY(1,1) NOT NULL
	,[FirstName] NVARCHAR(50) NOT NULL
	,[Salary] DECIMAL(15, 2) NOT NULL
	,[PassportID] INT NOT NULL
)

ALTER TABLE [Persons]
ADD CONSTRAINT PK_PersonId
PRIMARY KEY (PersonId)

ALTER TABLE [Persons]
ADD CONSTRAINT FK_Persons_Passports
FOREIGN KEY (PassportId) 
REFERENCES [Passports](PassportId)

INSERT INTO [Persons] 
     VALUES
	('Roberto', 43300.00, 102)
	,('Tom', 56100.00, 103)
	,('Yana', 60200.00, 101)