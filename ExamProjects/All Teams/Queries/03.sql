/*Problem 3.	Countries and Currency (Eurzone)
Find all countries along with information about their currency. Display the country name, country code and information if the country is in the Eurozone or not (the currency is EUR or not): either "Inside" or "Outside". Sort the results by country name alphabetically. Submit for evaluation the result grid with headers.*/

USE Football
GO

SELECT c.CountryName, c.CountryCode, 
	CASE
		WHEN c.CurrencyCode LIKE 'EUR' THEN 'Inside'
		WHEN c.CurrencyCode <> 'EUR' THEN 'Outside'
		WHEN c.CurrencyCode IS NULL THEN 'Outside'
	END
	AS [Eurozone]
FROM Countries c
ORDER BY c.CountryName