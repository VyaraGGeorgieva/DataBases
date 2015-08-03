/*Problem 9.	Latest 10 Ads
Find the latest 10 ads sorted by date in descending order. Display for each ad its title, date and status. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.
*/
SELECT TOP 10 a.Title, a.Date, st.Status
FROM Ads a 
	JOIN AdStatuses st
	ON a.StatusId = st.Id
Order by a.Date DESC