/*Problem 8.	Earliest and Latest Answer Date
Find the dates of the earliest answer for 2012 year and the latest answer for 2014 year. Name the columns exactly like in the table below.*/

USE Forum
GO 

SELECT MIN(amin.CreatedOn) as 'MinDate', MAX(amax.CreatedOn) as 'MaxDate'
FROM Answers amin, Answers amax
WHERE amin.CreatedOn>='2012-1-1'
	AND 
	   amax.CreatedOn<='2014-12-31'
