/*Consider the dates of the ads. Find among them all pairs of different dates, such that the second date is no later than 12 hours after the first date. Sort the dates in increasing order by the first date, then by the second date. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/
SELECT d1.Date as [FirstDate], d2.Date as [SecondDate]
FROM Ads d1, Ads d2
	WHERE 
		d2.Date>d1.Date
		AND
		DATEDIFF(hour, d1.Date, d2.Date)<12
GROUP BY d1.Date, d2.Date
ORDER BY d1.Date, d2.Date