USE [Minions]

CREATE TABLE [Minions]
(
	[Id] INT PRIMARY KEY,
	[Name] VARCHAR(100) NOT NULL,
	[Age] INT,
)

CREATE TABLE [Towns]
(
	[Id] INT PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL
)