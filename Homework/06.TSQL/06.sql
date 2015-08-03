/*Problem 6.	Create table Logs.
Create another table – Logs (LogID, AccountID, OldSum, NewSum). Add a trigger to the Accounts table that enters a new entry into the Logs table every time the sum on an account changes.
*/
USE Bank
GO
CREATE TABLE Logs(
LogId int IDENTITY,
AccountId int NOT NULL,
OldSum money NOT NULL,
NewSum money NOT NULL,
CONSTRAINT PK_Logs PRIMARY KEY (AccountId))
GO

USE Bank
GO
CREATE TRIGGER tr_LogsNewEntry
ON Accounts
FOR UPDATE
AS
INSERT INTO Logs
	SELECT d.PersonId, d.Balance, i.Balance
	FROM deleted d, inserted i
GO
EXEC usp_DepositMoney 2,100

SELECT *
FROM Logs
GO
