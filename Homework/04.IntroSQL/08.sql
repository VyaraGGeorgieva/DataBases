/*Problem 8.	Write an SQL query to find the email addresses of each employee ex: John.Doe@softuni.bg.*/
SELECT FirstName +'.'+ LastName + '@softuni.bg' AS [Full Email Addresses]
FROM Employees