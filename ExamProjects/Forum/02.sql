/*02.Find all answers created between 15-June-2012 (00:00:00) and 21-Mart-2013 (23:59:59) sorted by date. Name the columns exactly like in the table below.*/

USE Forum
GO

SELECT a.Content, a.CreatedOn
FROM Answers a
WHERE a.CreatedOn
	BETWEEN '2012-06-15' AND '2013-03-22'
ORDER BY a.CreatedOn