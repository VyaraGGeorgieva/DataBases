/*Problem 9.	Write a SQL query to find all departments and the average salary for each of them.*/
SELECT d.Name AS 'Department', AVG(e.Salary) AS [Average Salary]
FROM Employees e	
	JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.Name
ORDER BY d.Name