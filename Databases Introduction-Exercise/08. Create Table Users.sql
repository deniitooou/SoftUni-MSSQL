CREATE TABLE [Users]
(
	[Id] INT PRIMARY KEY IDENTITY
	,[Username] VARCHAR(30) NOT NULL
	,[Password] VARCHAR(26) NOT NULL
	,[ProfilePicture] IMAGE
	,[LastLoginTime] DATETIME2
	,[IsDeleted] BIT
)

INSERT INTO [Users] 
       VALUES
	('Username', 'Password', NULL, NULL, 1)
	,('Username2', 'Password2', NULL, NULL, 1)
	,('Username3', 'Password3', NULL, NULL, 0)
	,('Username4', 'Password4', NULL, NULL, 0)
	,('Username5', 'Password5', NULL, NULL, 1)