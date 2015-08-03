/*Problem 11.	Write an SQL query to find all managers that have exactly 5 employees. Display their first name and last name. */
SELECT man.FirstName, man.LastName, COUNT(emp.EmployeeID) AS [Émployees'Count]
FROM Employees emp
	JOIN Employees man
	ON emp.ManagerID=man.EmployeeID
GROUP BY man.FirstName, man.LastName
HAVING COUNT(emp.EmployeeID)=5

