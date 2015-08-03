/*Problem 4.	Ads without Town, Category or Image
Find all ads that have no town or no category or no image sorted by Id. Show all their data. Submit for evaluation the result grid with headers.
*/
SELECT *
FROM Ads
WHERE TownId IS NULL
	OR
	CategoryId IS NULL
	OR
	ImageDataURL IS NULL
ORder BY Id