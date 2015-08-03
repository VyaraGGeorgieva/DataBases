/*Find all ads created between 26-December-2014 (00:00:00) and 1-January-2015 (23:59:59) sorted by date. Submit for evaluation the result grid with headers.*/
SELECT Title, Date
FROM Ads
WHERE Date 
BETWEEN '2014-12-26' AND '2015-01-02'
ORDER BY Date