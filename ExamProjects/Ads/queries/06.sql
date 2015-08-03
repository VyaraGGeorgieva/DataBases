/*Find all ads along with their categories, towns and statuses sorted by Id. Display the ad title, category name, town name and status. Include all ads without town or category or status. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/

SELECT a.Title, c.Name as [CategoryName], t.Name as 'TownName', st.Status
FROM Ads a
	LEFT JOIN Categories c 
	ON c.Id = a.CategoryId
	LEFT JOIN Towns t
	ON t.Id = a.TownId
	LEFT JOIN AdStatuses st
	ON st.Id = a.StatusId