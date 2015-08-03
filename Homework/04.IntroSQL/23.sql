/*Problem 23.	Write an SQL query to find all the employees and the manager for each of them along with the employees that do not have manager. */
SELECT e.FirstName, e.LastName, m.LastName AS [Manager's Last Name]
FROM Employees e 
	LEFT OUTER JOIN Employees m
	ON e.EmployeeID = m.ManagerID