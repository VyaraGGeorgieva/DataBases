/*Problem 2.	Biggest Countries by Population
Find the 50 biggest countries by population. Display the country name and population. Sort the results by population (from biggest to smallest), then by country alphabetically. Submit for evaluation the result grid with headers.*/
Use Football
GO

SELECT TOP 50 c.CountryName,c.Population
FROM Countries c
ORDER BY c.Population DESC, c.CountryName