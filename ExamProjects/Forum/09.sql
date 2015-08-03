/*Problem 9.	Find the last ten answers
Find the last 10 answers sorted by date of creation in ascending order. Display for each ad its content, date and author. Name the columns exactly like in the table below.*/

USE Forum
GO

SELECT TOP 10 a.Content as [Answer], a.CreatedOn, u.Username
FROM Answers a
	JOIN Users u
	ON u.Id = a.UserId
ORDER BY a.CreatedOn DESC

