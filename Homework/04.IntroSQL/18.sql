/*Problem 18.	Write an SQL query to find all employees along with their address.*/
SELECT e.FirstName, e.LastName, a.AddressText
FROM Employees e
	JOIN Addresses a
	ON e.AddressID = a.AddressID