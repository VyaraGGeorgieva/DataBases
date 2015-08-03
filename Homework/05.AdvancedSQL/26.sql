/*Problem 26.	Write an SQL query to display the minimal employee salary by department and job title along with the name of some of the employees that take it.*/
SELECT 
	d.Name AS 'Department',
	e.JobTitle AS [Job Title],
    MIN(e.FirstName) AS [FirstName],
	MIN(e.Salary) AS [Min Salary]
FROM Employees e
	JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle, Salary
ORDER BY d.Name