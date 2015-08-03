/*Problem 21.	Write a SQL query to find all employees, along with their manager and their address.*/
SELECT e.FirstName + ' ' + e.LastName AS [Employee's Name], m.LastName AS [Manager's Last Name], a.AddressText AS 'Address'
FROM Employees e
	JOIN Employees m 
	ON e.EmployeeID = m.ManagerID
	JOIN Addresses a
	ON e.EmployeeID = a.AddressID