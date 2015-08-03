/*Problem 8.	Earliest and Latest Ads
Find the dates of the earliest and the latest ads. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.
*/
SELECT MIN(Date) as MinDate, MAX(Date) as MaxDate
FROM Ads