/*Find all ads along with their towns sorted by Id. Display the ad title and town (even when there is no town). Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/
SELECT a.Title, t.Name as 'Town' 
FROM Ads a
	left join Towns t
	on a.TownId = t.Id
