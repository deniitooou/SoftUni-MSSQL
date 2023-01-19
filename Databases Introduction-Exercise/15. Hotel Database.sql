CREATE DATABASE [Hotel]
GO

USE [Hotel]
GO

CREATE TABLE [Employees]
(
	[Id] INT PRIMARY KEY IDENTITY
	,[FirstName] VARCHAR(50) NOT NULL
	,[LastName] VARCHAR(50) NOT NULL
	,[Title] VARCHAR(100) NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Customers]
(
    [Id] INT IDENTITY(1,1)
	,[AccountNumber] INT PRIMARY KEY NOT NULL
	,[FirstName] VARCHAR(50) NOT NULL
	,[LastName] VARCHAR(50) NOT NULL
	,[PhoneNumber] INT NOT NULL
	,[EmergencyName] VARCHAR(100)
	,[EmergencyNumber] INT NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [RoomStatus]
(
	[RoomStatus] VARCHAR(100) PRIMARY KEY NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [RoomTypes]
(
	[RoomType] VARCHAR(100) PRIMARY KEY NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [BedTypes]
(
	[BedType] VARCHAR(100) PRIMARY KEY NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Rooms]
(
	[RoomNumber] INT PRIMARY KEY IDENTITY
	,[RoomType] VARCHAR(100) FOREIGN KEY REFERENCES [RoomTypes]([RoomType]) NOT NULL
	,[BedType] VARCHAR(100) FOREIGN KEY REFERENCES [BedTypes]([BedType]) NOT NULL
	,[Rate] DECIMAL(4,2) NOT NULL
	,[RoomStatus] VARCHAR(100) FOREIGN KEY REFERENCES [RoomStatus]([RoomStatus]) NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Payments]
(
	[Id] INT PRIMARY KEY IDENTITY
        ,[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id]) NOT NULL	
	,[PaymentDate] DATE NOT NULL
	,[AccountNumber] INT FOREIGN KEY REFERENCES [Customers]([AccountNumber]) NOT NULL
	,[FirstDateOccupied] DATE NOT NULL
	,[LastDateOccupied] DATE NOT NULL
	,[TotalDays] INT NOT NULL
	,[AmountCharged] DECIMAL(5, 2) NOT NULL
	,[TaxRate] DECIMAL(4, 2) NOT NULL
	,[TaxAmount] DECIMAL(5, 2) NOT NULL
	,[PaymentTotal] DECIMAL(5, 2) NOT NULL
	,[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Occupancies]
(
	[Id] INT PRIMARY KEY IDENTITY
	,[EmployeeId] INT FOREIGN KEY REFERENCES [Employees](Id) NOT NULL
	,[DateOccupied] DATE NOT NULL
	,[AccountNumber] INT FOREIGN KEY REFERENCES [Customers]([AccountNumber]) NOT NULL
	,[RoomNumber] INT FOREIGN KEY REFERENCES [Rooms]([RoomNumber]) NOT NULL
	,[RateApplied] DECIMAL(4, 2) NOT NULL
	,[PhoneCharge] DECIMAL(4, 2) NOT NULL
	,[Notes] NVARCHAR(MAX)
)

INSERT INTO [Employees] 
     VALUES
	('Employee1', 'Ivanov', 'Boss', 'Note..')
	,('Employee2', 'Dimitrov', 'Manager', 'Note..')
	,('Employee3', 'Atanasov', 'Administrator', 'Note..')
		
INSERT INTO [Customers] 
     VALUES
	(123, 'Customer1', 'Bogdanov', 7777, 'Cust1', 123, 'Note..')
	,(234, 'Customer2', 'Petkov', 6666, 'Cust2', 345, 'Note..')
	,(345, 'Customer3', 'Ivanov', 3333, 'Cust3', 567, 'Note..')

INSERT INTO [RoomStatus] 
     VALUES
	('Reserved', 'Note..')
	,('Occupied', 'Note..')
	,('Free', 'Note..')
		
INSERT INTO [RoomTypes] 
     VALUES
	('Single', 'Note..')
	,('Double', 'Note..')
	,('Studio', 'Note..')
		
INSERT INTO [BedTypes] 
     VALUES
	('Single Bed', 'Note..')
	,('Double Bed', 'Note..')
	,('King Size', 'Note..')
		
INSERT INTO [Rooms] 
     VALUES
	('Single', 'Single Bed', 05.30, 'Occupied', 'Note..'),
	('Double', 'Double Bed', 05.90, 'Free', 'Note..'),
	('Studio', 'King Size', 06.00, 'Reserved', 'Note..')
		
INSERT INTO [Payments] 
     VALUES
	(1, '2023-01-01', 123, '2023-01-01', '2023-01-05', 5, 100.00, 10.00, 120.00, 500.00, 'Note..')
	,(2, '2023-01-02', 234, '2023-01-02', '2023-01-06', 5, 100.00, 20.00, 130.00, 550.00, 'Note..')
	,(3, '2023-01-03', 345, '2023-01-03', '2023-01-07', 5, 100.00, 30.00, 140.00, 580.00, 'Note..')

INSERT INTO [Occupancies] 
     VALUES
	(1, '2023-01-01', 123, 1, 06.00, 05.30, 'Note..')
	,(2, '2023-01-02', 234, 2, 05.90, 16.70, 'Note..')
	,(3, '2023-01-03', 345, 3, 05.96, 12.10, 'Note..')