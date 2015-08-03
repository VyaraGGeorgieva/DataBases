/*Problem 16.	Write an SQL query to find all employees that have salary more than 50000. Order them in decreasing order by salary.*/
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 50000
ORDER BY Salary