/*Problem 6.	Category with Questions
Find all categories along with their questions sorted by category name and question title. Display the category name, question title and created on columns. Name the columns exactly like in the table below.
*/

USE Forum
GO

SELECT c.Name as [Category], q.Title as [Question], q.CreatedOn
FROM Categories c
	LEFT JOIN Questions q
	ON q.CategoryId = c.Id
ORDER BY c.Name, q.Title