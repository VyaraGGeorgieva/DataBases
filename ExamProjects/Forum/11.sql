/*Problem 11.	Answers count for Category
Display the count of answers in each category. Sort the results by answers count in descending order. Name the columns exactly like in the table below.*/

USE Forum
GO
SELECT c.Name as [Category], COUNT(a.Id) as [Answers Count]
FROM Categories c
	LEFT JOIN Questions q
	ON q.CategoryId = c.Id
	LEFT JOIN Answers a
	ON a.QuestionId = q.Id
GROUP BY c.Name
ORDER BY COUNT(c.Id) DESC