/*Problem 24.	Write an SQL query to find the names of all employees from the departments "Sales" and "Finance" whose hire year is between 1995 and 2005.*/
SELECT	e. FirstName, e.LastName, e.HireDate, d.Name
FROM Employees e
	JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales' 
	OR d.Name = 'Finance'
	AND e.HireDate BETWEEN '1995-1-1' AND '2005-12-31'
