/*Problem 14.	Write an SQL query to display the current date and time in the following format "day.month.year hour:minutes:seconds:milliseconds". */
SELECT 
	CONVERT
		(VARCHAR(10), GETDATE(), 104) + ' ' + 
		CONVERT(VARCHAR(12), GETDATE(), 114) 
		AS [DateTime];




