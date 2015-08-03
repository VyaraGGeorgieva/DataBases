/*Display all ad titles and dates along with a column named "Has Image" holding "yes" or "no" for all ads sorted by their Id. Submit for evaluation the result grid with headers.*/
SELECT Title, 
		Date,
	CASE 
		WHEN ImageDataURL IS NULL THEN 'no'
		WHEN ImageDataURL IS NOT NULL THEN 'yes'
	END
	AS [Has Image]
FROM Ads
ORDER BY Id