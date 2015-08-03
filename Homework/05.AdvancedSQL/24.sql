/*Problem 24.	Write an SQL statement that deletes all users without passwords (NULL password).
You should submit a SQL file as a part of your homework.
*/
DELETE FROM Users
WHERE Pass = 'NULLPASS' /*ISNULL*/
