/*Display all question titles in ascending order. Name the columns exactly like in the table below*/
USE Forum
GO

SELECT q.Title
FROM Questions q
	ORDER BY q.Title