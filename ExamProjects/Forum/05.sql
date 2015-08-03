/*Problem 5.	Answers with their Question with their Category and User 
Find top 50 answers along with their questions, along with question category, along with answer author sorted by Category Name, then by Answer Author, then by CreatedOn. Display the answer content, created on, question title, category name and author username. Name the columns exactly like in the table below.*/
USE Forum
GO

SELECT 
	TOP 50 
	a.Content as [Answer Content], 
	a.CreatedOn,
    u.Username as [Answer Author],
	q.Title as [Question Title],
	c.Name as [Category Name]	
FROM Answers a
	JOIN Users u
	ON u.Id = a.UserId
	JOIN Questions q
	ON q.Id= a.QuestionId
	JOIN Categories c
	ON c.Id = q.CategoryId
ORDER BY c.Name, u.Username, a.CreatedOn