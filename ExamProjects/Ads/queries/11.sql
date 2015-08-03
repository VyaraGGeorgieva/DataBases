/*Problem 11.	Ads by Status
Display the count of ads in each status. Sort the results by status. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.
*/
SELECT  Status, COUNT(st.Status) as 'Count'
FROM Ads a
	JOIN AdStatuses st
	ON st.Id = a.StatusId
GROUP BY st.Status

