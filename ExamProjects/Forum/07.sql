/*Problem 7.	*Users without PhoneNumber and Questions
Find all users that have no phone and no questions sorted by RegistrationDate. Show all user data. Name the columns exactly like in the table below.*/

USE Forum
GO

SELECT u.Id, u.Username, u.FirstName, u.PhoneNumber, u.RegistrationDate, u.Email
FROM Users u
	LEFT JOIN Questions q
	ON q.UserId = u.Id
WHERE u.PhoneNumber IS NULL AND q.Title IS NULL
ORDER BY u.RegistrationDate