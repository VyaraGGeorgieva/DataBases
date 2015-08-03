/*Problem 4.	Questions with their Author
Find all questions along with their user sorted by question title. Display the question title and author username. Name the columns exactly like in the table below.*/

SELECT q.Title as [Question Title], u.Username as [Author]
FROM Questions q
	JOIN Users u
	ON u.Id = q.UserId
ORDER BY q.Title
