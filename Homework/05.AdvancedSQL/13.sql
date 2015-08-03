/*Problem 13.	Write an SQL query to find the names of all employees whose last name is exactly 5 characters long. 
Use the built-in LEN(str) function.*/
SELECT FirstName, LastName
FROM Employees
WHERE LEN(LastName)=5