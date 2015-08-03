/*Problem 28.	Write a SQL query to display the number of managers from each town.*/
SELECT mt.Town, COUNT(*) AS [Number of manager]
FROM (SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName, t.Name AS Town
FROM Employees e 
	JOIN Employees m
		ON m.ManagerID = e.EmployeeID
	JOIN Addresses a
		ON  a.AddressID = e.AddressID
	JOIN Towns t
		ON a.TownID = t.TownID) AS mt
GROUP BY mt.Town
ORDER BY mt.Town