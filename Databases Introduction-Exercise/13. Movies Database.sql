CREATE DATABASE [Movies]
GO

USE [Movies]
GO

CREATE TABLE [Directors]
(
	[Id] INT PRIMARY KEY IDENTITY(1,1)
	,[DirectorName] VARCHAR(50) NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Genres]
(
	[Id] INT PRIMARY KEY IDENTITY(1,1)
	,[GenreName] VARCHAR(50) NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Categories]
(
	[Id] INT PRIMARY KEY IDENTITY(1,1)
	,[CategoryName] VARCHAR(50) NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Movies]
( 
	[Id] INT PRIMARY KEY IDENTITY(1,1)
	,[Title] VARCHAR(50) NOT NULL
	,[DirectorId] INT FOREIGN KEY REFERENCES [Directors]([Id]) NOT NULL
	,[CopyrightYear] INT NOT NULL
	,[Length] TIME NOT NULL
	,[GenreId] INT FOREIGN KEY REFERENCES [Genres]([Id]) NOT NULL
	,[CategoryId] INT FOREIGN KEY REFERENCES [Categories]([Id]) NOT NULL
	,[Rating] DECIMAL(2, 1) NOT NULL
	,[Notes] NVARCHAR(MAX)
)

INSERT INTO [Directors] 
        VALUES
	('Director1', 'Note..' )
	,('Director2', 'Note.. ')
	,('Director3', NULL)
	,('Director4', NULL)
	,('Director5', NULL)

INSERT INTO [Genres] 
        VALUES
	('Thriller', 'Note..')
	,('Action', 'Note..')
	,('Comedy', NULL)
	,('Horror', NULL)
	,('Drama', NULL)
	
INSERT INTO [Categories] 
        VALUES
	('Mystery', 'Note..')
	,('Drama', 'Note..')
	,('Musicals', NULL)
	,('Horror', NULL)
	,('Fantasy', NULL)

INSERT INTO [Movies] 
        VALUES
        ('Avatar: The Way of Water', 1, 2022, '03:12:00', 2, 5, 5.9, 'Note..')
	,('The Menu', 3, 2022, '01:47:00', 3, 4, 5.8, 'Note..')
	,('White Noise', 2, 2022, '02:16:00', 5, 1, 5.7, 'Note..')
	,('M3GAN', 5, 2022, '01:42:00', 1, 4, 5.6, 'Note..')
	,('The Banshees of Inisherin', 4, 2022, '01:54:00', 3, 2, 5.5, 'Note..')