/*Problem 3.	Write an SQL query to find the full name, salary and department of the employees that take the minimal salary in their department.*/
SELECT e.FirstName + ' ' + e.LastName AS [Full Name],
		e.Salary, d.Name AS 'Department'
FROM Employees e
JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
	WHERE e.Salary = (
		SELECT MIN(Salary)
		FROM Employees
		WHERE DepartmentID = d.DepartmentID)
		
