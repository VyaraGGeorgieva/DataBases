/*Problem 7.	Filtered Ads with Category, Town and Status
Find all Published ads from Sofia, Blagoevgrad or Stara Zagora, along with their category, town and status sorted by title. Display the ad title, category name, town name and status. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/
SELECT a.Title, c.Name as [CategoryName], t.Name as 'TownName', st.Status
FROM Ads a
	LEFT JOIN Categories c 
	ON c.Id = a.CategoryId
	LEFT JOIN Towns t
	ON t.Id = a.TownId
	
	LEFT JOIN AdStatuses st
	ON st.Id = a.StatusId
WHERE (t.Name LIKE 'Sofia'
	OR t.Name LIKE 'Blagoevgrad'
	OR t.Name LIKE 'Stara Zagora')
	AND st. Status like 'Published'
ORDER BY a.Title