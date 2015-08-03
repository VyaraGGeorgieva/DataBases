/*Problem 12.	Answers Count by Category and Username
Display the count of answers for category and each username. Sort the results by Answers count, then by Username. Display only non-zero counts. Display only users with phone number. Name the columns exactly like in the table below. 
*/

SELECT 
	c.Name AS [Category],
	u.Username,
	u.PhoneNumber,
	COUNT(a.Id) AS [Answers Count]
FROM Categories AS c
JOIN Questions AS q
	ON c.Id = q.CategoryId
JOIN Answers AS a
	ON a.QuestionId = q.Id
JOIN Users AS u
	ON u.Id = a.UserId AND u.PhoneNumber IS NOT NULL
GROUP BY c.Name, u.Username, u.PhoneNumber
ORDER BY [Answers Count] DESC, u.Username ASC