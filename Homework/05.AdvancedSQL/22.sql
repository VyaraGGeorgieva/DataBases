/*Problem 22.	Write SQL statements to insert in the Users table the names of all employees from the Employees table.
Combine the first and last names as a full name. For username use the first letter of the first name + the last name (in lowercase). Use the same for the password, and NULL for last login time.
You should submit a SQL file as a part of your homework.
*/

INSERT INTO Users (UserName, FullName, Pass, LastLoginTime )
SELECT 
	 LEFT(FirstName, 1) + LOWER(LastName),
	 FirstName + ' ' + LastName AS [Full Name],
	 FirstName+LastName,
	 NULL
FROM Employees