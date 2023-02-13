CREATE PROC [usp_GetEmployeesSalaryAboveNumber]
@number DECIMAL(18,4)
AS
BEGIN
	SELECT
		[FirstName]
		,[LastName]
	  FROM [Employees]
	 WHERE [Salary] >= @number
END