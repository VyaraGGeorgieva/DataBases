/*Problem 16.	Write an SQL statement to create a view that displays the users from the Users table that have been in the system today. */

CREATE VIEW vUsersLoggedToday AS
SELECT * 
FROM Users
WHERE DAY(LastLoginTime) = DAY(GETDATE())
GO
 