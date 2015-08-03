/*Problem 4.	Teams Holding Numbers
Find all teams that holds numbers in their name, sorted by country code. Display the team name and country code. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/
USE Football
GO

SELECT t.TeamName as [Team Name], c.CountryCode as [Country Code]
FROM Countries c
	JOIN Teams t
	ON t.CountryCode = c.CountryCode
WHERE t.TeamName LIKE '%[0-9]%'
ORDER BY c.CountryCode