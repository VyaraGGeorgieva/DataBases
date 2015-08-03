/*Problem 2.	Create a stored procedure
Your task is to create a stored procedure that accepts a number as a parameter and returns all persons who have more money in their accounts than the supplied number.
*/

USE Bank
GO
CREATE PROC dbo.usp_Balance (@minBalanceAvailable int)
AS
	SELECT p.FirstName + ' ' +  p.LastName as [Full name], ac.Balance
	FROM Accounts ac
		JOIN Persons p
		ON p.PersonsId = ac.PersonId
	WHERE ac.Balance>=@minBalanceAvailable
	ORDER BY ac.Balance
GO
EXEC usp_Balance 7000

