/*Problem 6.	*Teams with their League and League Country
Find all teams, along with the leagues, they play in and the country of the league. If the league does not have a country, display "International" instead. Sort the results by team name. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/

USE Football
GO

SELECT 
	TeamName as [Team Name], 
	LeagueName as [League],
	CASE
		WHEN l.CountryCode IS NULL THEN 'International'
		ELSE c.CountryName 
	END
		as  [League Country]
FROM Teams t
	JOIN Leagues_Teams lt
	ON lt.TeamId = t.Id
	JOIN Leagues l
	ON l.Id = lt.LeagueId
	LEFT JOIN Countries c
	ON c.CountryCode = l.CountryCode
ORDER BY t.TeamName