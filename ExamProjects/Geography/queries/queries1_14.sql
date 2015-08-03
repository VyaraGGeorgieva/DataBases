/*Problem 1.	All Mountain Peaks
Display all ad mountain peaks in alphabetical order. Submit for evaluation the result grid with headers.*/
SELECT p.PeakName
FROM Peaks p
Order BY p.PeakName

/*Find the 30 biggest countries by population from Europe. Display the country name and population. Sort the results by population (from biggest to smallest), then by country alphabetically. Submit for evaluation the result grid with headers.*/
SELECT TOP 30 c.CountryName, c.Population
FROM Countries c
JOIN Continents con
	ON con.ContinentCode = c.ContinentCode
WHERE con.ContinentName = 'Europe'
ORDER BY c.Population DESC, c.CountryName

/*Problem 3.	Countries and Currency (Euro / Not Euro)
Find all countries along with information about their currency. Display the country code, country name and information about its currency: either "Euro" or "Not Euro". Sort the results by country name alphabetically. Submit for evaluation the result grid with headers.*/

SELECT c.CountryName, c.CountryCode,
	CASE
		WHEN c.CurrencyCode = 'EUR'
			THEN 'Euro'
		WHEN c.CurrencyCode <>'EUR' 
			THEN 'Not Euro'
		WHEN c.CurrencyCode IS NULL 
		THEN 'Not Euro'
		
	END
	AS 'Currency'
FROM Countries c
ORDER BY c.CountryName

/*Problem 4.	Countries Holding 'A' 3 or More Times
Find all countries that holds the letter 'A' in their name at least 3 times (case insensitively), sorted by ISO code. Display the country name and ISO code. Submit for evaluation the result grid with headers.*/
SELECT c.CountryName as [Country Name], c.IsoCode as [ISO Code]
FROM Countries c
WHERE c.CountryName
	LIKE '%A%A%A%'
Order by c.IsoCode

/*Problem 5.	Peaks and Mountains
Find all peaks along with their mountain sorted by elevation (from the highest to the lowest), then by peak name alphabetically. Display the peak name, mountain range name and elevation. Submit for evaluation the result grid with headers.*/

SELECT p.PeakName, m.MountainRange as 'Mountain', p.Elevation
FROM Mountains m
	JOIN Peaks p
	ON p.MountainId = m.Id
ORDER BY p.Elevation DESC, p.PeakName

/*Problem 6.	Peaks with Their Mountain, Country and Continent
Find all peaks along with their mountain, country and continent. When a mountain belongs to multiple countries, display them all. Sort the results by peak name alphabetically, then by country name alphabetically. Submit for evaluation the result grid with headers.*/

SELECT p.PeakName, m.MountainRange as 'Mountain', cntr.CountryName, cont.ContinentName
FROM Peaks p
	JOIN Mountains m
	ON p.MountainId = m.Id
	JOIN MountainsCountries mc
	ON m.Id = mc.MountainId
	JOIN Countries cntr
	ON cntr.CountryCode = mc.CountryCode
	JOIN Continents cont
	ON cont.ContinentCode = cntr.ContinentCode
ORDER BY p.PeakName, cntr.CountryName

/*Problem 7.	* Rivers Passing through 3 or More Countries
Find all rivers that pass through to 3 or more countries. Display the river name and the number of countries. Sort the results by river name. Submit for evaluation the result grid with headers.*/
SELECT r.RiverName as 'River', COUNT(cntr.CountryName) as 'Countries Count'
FROM Rivers r
	JOIN CountriesRivers cr
	ON cr.RiverId = r.Id
	JOIN Countries cntr 
	ON cntr.CountryCode = cr.CountryCode

GROUP BY r.RiverName
HAVING COUNT(cntr.CountryName)>=3
ORDER BY r.RiverName

/*Problem 8.	Highest, Lowest and Average Peak Elevation
Find the highest, lowest and average peak elevation. Submit for evaluation the result grid with headers.*/
SELECT MAX(p.Elevation) as 'MaxElevation', MIN(p.Elevation) as 'MinElevation', AVG(p.Elevation) as 'AverageElevation'
FROM Peaks p

/*Problem 9.	Rivers by Country
For each country in the database, display the number of rivers passing through that country and the total length of these rivers. When a country does not have any river, display 0 as rivers count and as total length. Sort the results by rivers count (from largest to smallest), then by total length (from largest to smallest), then by country alphabetically. Submit for evaluation the result grid with headers.*/
SELECT c.CountryName, cont.ContinentName, COUNT(r.Id) as 'RiversCount', 
ISNULL(SUM(r.Length),0) as 'TotalLength'
FROM Countries c
	LEFT JOIN Continents cont
	ON cont.ContinentCode = c.ContinentCode
	LEFT JOIN CountriesRivers cr
	ON cr.CountryCode = c.CountryCode
	LEFT JOIN Rivers r
	ON r.Id = cr.RiverId
GROUP BY c.CountryName, cont.ContinentName
ORDER BY COUNT(r.Id) DESC, SUM(r.Length) DESC, c.CountryName

/*Problem 10.	Count of Countries by Currency
Find the number of countries for each currency. Display three columns: currency code, currency description and number of countries. Sort the results by number of countries (from highest to lowest), then by currency description alphabetically. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.
*/
SELECT cur.CurrencyCode, cur.Description as 'Currency', COUNT(cntr.CountryName) as 'NumberOfCountries'
FROM Currencies cur
	LEFT JOIN Countries cntr
	ON cntr.CurrencyCode = cur.CurrencyCode
GROUP BY cur.CurrencyCode, cur.Description
ORDER BY NumberOfCountries DESC, cur.Description

/*Problem 11.	* Population and Area by Continent
For each continent, display the total area and total population of all its countries. Sort the results by population from highest to lowest. Submit for evaluation the result grid with headers.*/
SELECT 
	cont.ContinentName, 
	SUM(CONVERT(numeric,cntr.AreaInSqKm)) as 'CountriesArea', 
	SUM(CONVERT(numeric, cntr.Population)) as 'CountriesPopulation'
FROM Continents cont
	JOIN Countries cntr
	ON cntr.ContinentCode = cont.ContinentCode
GROUP BY cont.ContinentName
ORDER BY CountriesPopulation DESC

/*Problem 12.	Highest Peak and Longest River by Country
For each country, find the elevation of the highest peak and the length of the longest river, sorted by the highest peak elevation (from highest to lowest), then by the longest river length (from longest to smallest), then by country name (alphabetically). Display NULL when no data is available in some of the columns. Submit for evaluation the result grid with headers.*/

SELECT 
	c.CountryName, 
	MAX(p.Elevation) as 'HighestPeakElevation',
	MAX (r.Length) as 'LongestRiverLength'
FROM Countries c
	LEFT JOIN MountainsCountries mc
	ON mc.CountryCode = c.CountryCode
	LEFT JOIN Mountains m
	ON m.Id = mc.MountainId
	LEFT JOIN Peaks p
	ON p.MountainId = m.Id
	LEFT JOIN CountriesRivers cr
	ON cr.CountryCode = c.CountryCode
	LEFT JOIN Rivers r
	ON r.Id = cr.RiverId
GROUP BY c.CountryName
ORDER BY 
	HighestPeakElevation DESC, 
	LongestRiverLength DESC,
	c.CountryName

	/*Problem 13.	Mix of Peak and River Names
Combine all peak names with all river names, so that the last letter of each peak name is the same like the first letter of its corresponding river name. Display the peak names, river names, and the obtained mix. Sort the results by the obtained mix. Submit for evaluation the result grid with headers.*/

SELECT p.PeakName, r.RiverName, 
LOWER(SUBSTRING (p.PeakName, 1 , LEN(p.PeakName) - 1) + (r.RiverName)) as 'Mix'
FROM Peaks p, Rivers r
WHERE 
	RIGHT(p.PeakName, 1) = LEFT (r.RiverName, 1)
ORDER BY Mix
	
/*Problem 14.	** Highest Peak Name and Elevation by Country
For each country, find the name and elevation of the highest peak, along with its mountain. When no peaks are available in some country, display elevation 0, "(no highest peak)" as peak name and "(no mountain)" as mountain name. When multiple peaks in some country have the same elevation, display all of them. Sort the results by country name alphabetically, then by highest peak name alphabetically. Submit for evaluation the result grid with headers.*/
SELECT
  c.CountryName AS [Country],
  p.PeakName AS [Highest Peak Name],
  p.Elevation AS [Highest Peak Elevation],
  m.MountainRange AS [Mountain]
FROM
  Countries c
  LEFT JOIN MountainsCountries mc ON c.CountryCode = mc.CountryCode
  LEFT JOIN Mountains m ON m.Id = mc.MountainId
  LEFT JOIN Peaks p ON p.MountainId = m.Id
WHERE p.Elevation =
  (SELECT MAX(p.Elevation)
   FROM MountainsCountries mc
     LEFT JOIN Mountains m ON m.Id = mc.MountainId
     LEFT JOIN Peaks p ON p.MountainId = m.Id
   WHERE c.CountryCode = mc.CountryCode)
   UNION
SELECT
  c.CountryName AS [Country],
  '(no highest peak)' AS [Highest Peak Name],
  0 AS [Highest Peak Elevation],
  '(no mountain)' AS [Mountain]
FROM
  Countries c
  LEFT JOIN MountainsCountries mc ON c.CountryCode = mc.CountryCode
  LEFT JOIN Mountains m ON m.Id = mc.MountainId
  LEFT JOIN Peaks p ON p.MountainId = m.Id
WHERE 
  (SELECT MAX(p.Elevation)
   FROM MountainsCountries mc
     LEFT JOIN Mountains m ON m.Id = mc.MountainId
     LEFT JOIN Peaks p ON p.MountainId = m.Id
   WHERE c.CountryCode = mc.CountryCode) IS NULL
ORDER BY c.CountryName, [Highest Peak Name]