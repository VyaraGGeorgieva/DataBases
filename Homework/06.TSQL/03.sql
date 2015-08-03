/*Problem 3.	Create a function with parameters
Your task is to create a function that accepts as parameters – sum, yearly interest rate and number of months. It should calculate and return the new sum. Write a SELECT to test whether the function works as expected.*/
USE Bank
GO

CREATE FUNCTION ufn_CalculateFutureSum (@sum money, @yearlyIntRate money, @numMonths int)
	RETURNS money
AS
	BEGIN
		DECLARE @monthlyIntRate money
		SET
			@monthlyIntRate = @yearlyIntRate/12
		RETURN
			@sum *(1 + @numMonths * @monthlyIntRate /100)
	END
	GO

	SELECT p.FirstName, p.LastName, dbo.ufn_CalculateFutureSum(ac.Balance, 7, 24) AS [Future Sum]
	FROM Persons p
	 JOIN Accounts ac
	 ON p.PersonsId = ac.PersonId