/*Problem 15.	Write an SQL query to find all employees that do not have manager.*/
SELECT FirstName, LastName
FROM Employees
WHERE ManagerID
IS NULL