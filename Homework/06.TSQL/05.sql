/*Problem 5.	Add two more stored procedures WithdrawMoney and DepositMoney.
Add two more stored procedures WithdrawMoney (AccountId, money) and DepositMoney (AccountId, money) that operate in transactions.
*/
USE Bank
GO
CREATE PROC dbo.usp_DepositMoney(@accountId int, @moneyDeposited money) 
AS
UPDATE Accounts 
SET Balance = Balance + @moneyDeposited 
WHERE AccountsId = @accountId
GO
EXEC usp_DepositMoney 2, 1000

USE Bank
GO
CREATE PROC dbo.usp_WithdrawMoney(@accountId int, @moneyWithdrawn money)
AS
UPDATE Accounts
SET Balance = Balance - @moneyWithdrawn
WHERE AccountsId = @moneyWithdrawn
GO
EXEC usp_WithdrawMoney 2, 100