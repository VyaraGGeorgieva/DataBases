/*Problem 10.	Not Published Ads from the First Month
Find all not published ads, created in the same month and year like the earliest ad. Display for each ad its id, title, date and status. Sort the results by Id. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/
SELECT a.Id, a.Title, a.Date, st.Status
FROM Ads a
	JOIN AdStatuses st
	ON st.Id = a.StatusId
WHERE st.Status NOT LIKE 'Published'
AND MONTH (Date) = (SELECT MONTH (MIN (Date))FROM Ads)
AND YEAR (Date) =(SELECT YEAR (Min(Date)) FROM Ads)
ORDER BY a.Id