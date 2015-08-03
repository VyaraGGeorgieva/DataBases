/*Problem 27.	Write an SQL query to display the town where maximal number of employees work.*/
SELECT  TOP 1 COUNT(e.FirstName) as [Number of Employees], t.Name
FROM Employees e
JOIN Addresses a
	ON a.AddressID = e.AddressID
JOIN Towns t
	ON a.TownID = t.TownID
GROUP BY t.Name
ORDER BY [Number of Employees] DESC

