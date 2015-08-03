/*Problem 20.	Write an SQL query to find all employees along with their manager.*/
SELECT e.FirstName + ' ' + e.LastName + 'is managed by ' + m.LastName
FROM Employees e
	JOIN Employees m
	ON e.EmployeeID=m.ManagerID