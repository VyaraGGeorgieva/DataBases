/*Problem 12.	Ads by Town and Status
Display the count of ads for each town and each status. Sort the results by town, then by status. Display only non-zero counts. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/
SELECT t.Name as [Town Name], Status, COUNT(st.Status) as 'Count'
FROM Ads a
	JOIN AdStatuses st
	ON st.Id = a.StatusId
	JOIN Towns t
	ON t.Id = a.TownId
GROUP BY t.Name, st.Status
ORDER BY t.Name
