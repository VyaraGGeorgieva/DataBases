/*Problem 23.	Write a SQL statement that changes the password to NULL for all users that have not been in the system since 10.03.2010.
You should submit a SQL file as a part of your homework.*/
UPDATE USERS
SET LastLoginTime = '2010-02-08'
WHERE UserID = 52
GO

UPDATE Users
SET Pass = 'NULLPASS'
WHERE LastLoginTime <= '2010-03-10'
