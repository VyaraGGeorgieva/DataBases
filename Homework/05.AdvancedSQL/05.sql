/*Problem 5.	Write an SQL query to find the average salary in the "Sales" department.*/
SELECT AVG(e.Salary) AS [Average Salary for Sales Department]
FROM Employees e
	JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'