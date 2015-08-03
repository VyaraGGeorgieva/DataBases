/*Problem 1.	Create a database with two tables
Persons (id (PK), first name, last name, SSN) and Accounts (id (PK), person id (FK), balance). Insert few records for testing. 
Write a stored procedure that selects the full names of all persons.*/
USE Bank
CREATE TABLE Persons(
PersonsId int IDENTITY,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
SSN nvarchar(20) NOT NULL,
CONSTRAINT PK_Persons PRIMARY KEY (PersonsId))

CREATE TABLE Accounts(
AccountsId int IDENTITY,
PersonId int NOT NULL,
Balance int NOT NULL,
CONSTRAINT PK_Accounts PRIMARY KEY (AccountsId),
CONSTRAINT FK_Persons_Accounts FOREIGN KEY (PersonId) REFERENCES Persons(PersonsId))

INSERT INTO Persons
VALUES ('Ivan' , 'Ivanov', '83923892'),
 ('Peter', 'Petrov', '458304953'),
 ('Marko', 'Markov', '49820498023')

 INSERT INTO Accounts
 VALUES 
 (1, 8767),
 (3, 7567),
 (2, 4560)

 USE Bank
 GO
 CREATE PROC dbo.usp_FullNames
 AS
	SELECT FirstName + ' ' + LastName as [Full Name]
	FROM Persons
 GO
 EXEC usp_FullNames