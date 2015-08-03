/*Problem 4.	Create a stored procedure that uses the function from the previous example.
Your task is to create a stored procedure that uses the function from the previous example to give an interest to a person's account for one month. It should take the AccountId and the interest rate as parameters.
*/
USE Bank
GO
CREATE PROC udp_interest_accounts(@accountId int, @interest float) AS
UPDATE Accounts 
SET Balance = dbo.ufn_CalculateFutureSum(Balance, @interest, 1) 
WHERE AccountsId = @accountId

GO

SELECT * 
FROM Accounts 
WHERE AccountsId = 2

EXEC udp_interest_accounts 1, 0.1

SELECT * 
FROM Accounts 
WHERE AccountsId = 1