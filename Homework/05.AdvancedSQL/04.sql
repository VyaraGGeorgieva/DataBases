/*Problem 4.	Write an SQL query to find the average salary in the department #1.*/
SELECT AVG(SALARY) AS [Average Salary]
FROM Employees
WHERE DepartmentID = 1
 
	