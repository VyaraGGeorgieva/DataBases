/*Problem 5.	International Matches
Find all international matches sorted by date. Display the country name of the home and away team. Sort the results starting from the newest date and ending with games with no date. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/

USE Football
GO

SELECT ht.CountryName as [Home Team], at.CountryName as [Away Team], im.MatchDate as [Match Date]
FROM Countries at
	JOIN InternationalMatches im
	ON im.AwayCountryCode = at.CountryCode
	JOIN Countries ht
	ON ht.CountryCode = im.HomeCountryCode
ORDER BY im.MatchDate DESC