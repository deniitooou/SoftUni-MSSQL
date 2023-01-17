CREATE DATABASE [CarRental]
GO

USE [CarRental]
GO

CREATE TABLE [Categories]
(
	[Id] INT PRIMARY KEY IDENTITY(1,1)
	,[CategoryName] VARCHAR(50) NOT NULL
	,[DailyRate] DECIMAL(10, 2) NOT NULL
	,[WeeklyRate] DECIMAL(10, 2) NOT NULL
	,[MonthlyRate] DECIMAL(10, 2) NOT NULL
	,[WeekendRate] DECIMAL(10, 2) NOT NULL
)

CREATE TABLE [Cars]
(
	[Id] INT PRIMARY KEY IDENTITY
	,[PlateNumber] VARCHAR(50) NOT NULL
	,[Manufacturer] VARCHAR(50) NOT NULL
	,[Model] VARCHAR(50) NOT NULL
	,[CarYear] INT NOT NULL
	,[CategoryId] INT FOREIGN KEY REFERENCES [Categories]([Id]) NOT NULL
	,[Doors] INT NOT NULL
	,[Picture] IMAGE
	,[Condition] NVARCHAR(100) NOT NULL
	,[Available] BIT NOT NULL
        ,CHECK ([Available] = 0 OR [Available] = 1)
)

CREATE TABLE [Employees]
(
	[Id] INT PRIMARY KEY IDENTITY(1,1)
	,[FirstName] VARCHAR(50) NOT NULL
	,[LastName] VARCHAR(50) NOT NULL
	,[Title] VARCHAR(100) NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Customers]
(
	[Id] INT PRIMARY KEY IDENTITY(1,1)
	,[DriverLicenceNumber] INT NOT NULL
	,[FullName] VARCHAR(50) NOT NULL
	,[Address] NVARCHAR(MAX) NOT NULL
	,[City] VARCHAR(50) NOT NULL
	,[ZIPCode] INT NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [RentalOrders]
(
	[Id] INT PRIMARY KEY IDENTITY
	,[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id]) NOT NULL
	,[CustomerId] INT FOREIGN KEY REFERENCES [Customers]([Id]) NOT NULL
	,[CarId] INT FOREIGN KEY REFERENCES [Cars]([Id]) NOT NULL
	,[TankLevel] INT NOT NULL
	,[KilometrageStart] INT NOT NULL
	,[KilometrageEnd] INT NOT NULL
	,[TotalKilometrage] INT NOT NULL
	,[StartDate] DATE NOT NULL
	,[EndDate] DATE NOT NULL
	,[TotalDays] INT NOT NULL
	,[RateApplied] DECIMAL(6, 2) NOT NULL
	,[TaxRate] DECIMAL(6, 2) NOT NULL
	,[OrderStatus] VARCHAR(50) NOT NULL
	,[Notes] NVARCHAR(MAX)
)

INSERT INTO [Categories] 
VALUES
	('First category', 10.00, 20.00, 30.00, 40.00)
	,('Second category', 10.00, 20.00, 30.00, 40.00)
	,('Third category', 10.00, 20.00, 30.00, 40.00)

INSERT INTO [Cars] 
VALUES
	('CA 1982 TX', 'VW', 'Golf 5', 2007, 2, 5, NULL, 'Very Good', 0)
	,('CA 1374 CB', 'BMW', 'M5', 2017, 3, 5, NULL, 'Good', 1)
	,('CA 1631 PK', 'Audi', 'RS7', 2019, 1, 5, NULL, 'Very Good', 1)

INSERT INTO [Employees] 
VALUES
	('Employee1', 'Ivanov', 'Title..', 'Note..')
	,('Employee2', 'Bogdanov', 'Title..', 'Note..')
	,('Employee3', 'Dimitrov', 'Title..', 'Note..')

INSERT INTO [Customers] 
VALUES
	('123', 'Customer1', 'Adress..', 'Sofia', 1000, 'Note..')
	,('1234', 'Customer2', 'Adress..', 'Varna', 9000, 'Note..')
	,('1235', 'Customer3', 'Adress..', 'Burgas', 8000, 'Note..')

INSERT INTO [RentalOrders] 
VALUES
	(1, 3, 2, 65, 80000, 180000, 500, '1996-07-05', '1996-07-29', 24, 100.00, 15.00, 'Approved', 'Note..')
	,(2, 2, 3, 50, 120000, 200000, 450, '2000-10-23', '2000-11-09', 16, 100.00, 15.00, 'Canceled', 'Note..')
	,(3, 1, 1, 55, 90000, 180000, 550, '2022-12-12', '2022-12-29', 17, 100.00, 15.00, 'Delivered', 'Note..')