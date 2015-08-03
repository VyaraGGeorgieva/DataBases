/*Problem 25.	Write an SQL query to display the average employee salary by department and job title.*/
SELECT d.Name AS 'Department',
	   e.JobTitle AS 'Job Title',
	   AVG(e.Salary) AS [Average Salary]
FROM Employees e
	JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle
ORDER BY e.JobTitle


