/*Problem 10.	Write an SQL query to find the count of all employees in each department and for each town.*/
SELECT t.Name AS 'Town',d.Name AS 'Department', COUNT(e.EmployeeID) AS [Employees' Count]
FROM Employees e
	JOIN Departments d
	ON e.DepartmentID=d.DepartmentID
	JOIN Addresses a
	ON a.AddressID = e.AddressID
	JOIN Towns t
	ON t.TownID = a.TownID
GROUP BY d.Name, t.Name
ORDER BY d.Name
