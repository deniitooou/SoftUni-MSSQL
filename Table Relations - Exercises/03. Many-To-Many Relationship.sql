CREATE TABLE [Students]
(
    [StudentID] INT IDENTITY PRIMARY KEY
    ,[Name] VARCHAR(50) NOT NULL
)

INSERT INTO [Students] 
     VALUES
    ('Mila')
    ,('Toni')
    ,('Ron')

CREATE TABLE [Exams]
(
    [ExamID] INT IDENTITY(101,1) PRIMARY KEY
    ,[Name] VARCHAR(50) NOT NULL
)

INSERT INTO [Exams] 
      VALUES
    ('SpringMVC')
    ,('Neo4j')
    ,('Oracle 11g')

CREATE TABLE [StudentsExams]
(
    [StudentID] INT NOT NULL 
	    FOREIGN KEY REFERENCES [Students](StudentID)
    ,[ExamID] INT NOT NULL 
	    FOREIGN KEY REFERENCES [Exams](ExamID)
    CONSTRAINT PK_StudentExamID 
	    PRIMARY KEY (StudentID, ExamID)
)

INSERT INTO [StudentsExams] 
     VALUES
    (1, 101)
    ,(1, 102)
    ,(2, 101)
    ,(3, 103)
    ,(2, 102)
    ,(2, 103)