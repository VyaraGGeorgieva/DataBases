/*Problem 13.	Write an SQL query to find the salary of all employees whose salary is in the range [20000…30000].*/
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary
BETWEEN 20000 AND 30000