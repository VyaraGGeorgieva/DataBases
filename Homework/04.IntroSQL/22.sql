/*Problem 22.	Write an SQL query to find all departments and all town names as a single list.*/
SELECT Name
FROM Departments
UNION
SELECT Name
FROM Towns