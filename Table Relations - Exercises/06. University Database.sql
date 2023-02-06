CREATE TABLE [Majors]
(
	[MajorID] INT PRIMARY KEY NOT NULL 
	,[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE [Subjects]
(
	[SubjectID] INT PRIMARY KEY NOT NULL 
	,[SubjectName] VARCHAR(50) NOT NULL
)

CREATE TABLE [Students]
(
	[StudentID] INT PRIMARY KEY NOT NULL
	,[StudentNumber] INT NOT NULL
	,[StudentName] VARCHAR(50) NOT NULL
	,[MajorID] INT FOREIGN KEY REFERENCES [Majors](MajorID)
)

CREATE TABLE [Agenda]
(
	[StudentID] INT NOT NULL FOREIGN KEY REFERENCES [Students](StudentID)
	,[SubjectID] INT NOT NULL FOREIGN KEY REFERENCES [Subjects](SubjectID)
	CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID)
)

CREATE TABLE [Payments]
(
	[PaymentID] INT PRIMARY KEY NOT NULL 
	,[PaymentDate] DATE NOT NULL
	,[PaymentAmount] DECIMAL(8, 2)
	,[StudentID] INT NOT NULL FOREIGN KEY REFERENCES [Students](StudentID)
)
