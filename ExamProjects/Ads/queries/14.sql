/*Find the count of ads for each town. Display the ads count and town name or "(no town)" for the ads without a town. Display only the towns, which hold 2 or 3 ads. Sort the results by town name. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/

SELECT 
	COUNT(a.Title) as [AdsCount], 
	ISNULL (t.Name, '(no town)') as [Town]
FROM Ads a
	LEFT JOIN Towns t
	ON t.Id = a.TownId
GROUP BY t.Name
HAVING COUNT (a.Title) IN (2,3)
ORDER BY t.Name