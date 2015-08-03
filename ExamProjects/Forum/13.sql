/*1.	Create a table Towns(Id, Name). Use auto-increment for the primary key. Add a new column TownId in the Users table to link each user to some town (non-mandatory link). Create a foreign key between the Users and Towns tables.*/

USE FORUM
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('Towns') IS NOT NULL
  DROP TABLE Towns

CREATE TABLE Towns(
Id int IDENTITY,
Name nvarchar(100) NOT NULL,
CONSTRAINT PK_Towns PRIMARY KEY (Id)
)
GO

ALTER TABLE Users
ADD 
TownId int FOREIGN KEY REFERENCES Towns(Id)
GO

INSERT INTO Towns(Name) VALUES ('Sofia'), ('Berlin'), ('Lyon')
UPDATE Users SET TownId = (SELECT Id FROM Towns WHERE Name='Sofia')
INSERT INTO Towns VALUES
('Munich'), ('Frankfurt'), ('Varna'), ('Hamburg'), ('Paris'), ('Lom'), ('Nantes')
GO

/*3.	Write and execute a SQL command that changes the town to "Paris" for all users with registration date at Friday.*/

UPDATE Users
SET TownId = 
	(SELECT Id 
	FROM Towns 
	WHERE Name='Paris')
WHERE DATENAME(WEEKDAY, RegistrationDate ) = 'Friday'

/*4.	Write and execute a SQL command that changes the question to “Java += operator” of Answers, answered at Monday or Sunday in February*/

UPDATE Questions
SET Title = 'Java += operator'
WHERE Id IN (
SELECT 
	 QuestionId 
FROM Answers a
WHERE DATENAME(DW, CreatedOn) IN ('Monday', 'Sunday') AND MONTH(a.CreatedOn) = 2)
GO

CREATE TABLE AnswersIds(
	AnswerId int)
GO
/*2.	Insert into [#AnswerIds] table all answer ids where sum of answer votes are negative number.*/
INSERT INTO AnswersIds
SELECT a.Id
FROM Answers a
	JOIN Votes v
	ON a.Id = v.AnswerId
GROUP BY a.Id, v.Value
HAVING SUM(v.Value)<0
GO

DELETE Votes
WHERE AnswerId IN (SELECT * FROM AnswersIds)

DELETE Answers
WHERE Id IN (SELECT * FROM AnswersIds)
GO

INSERT INTO Questions (Title, Content, CreatedOn, CategoryId, UserId)
VALUES ('Fetch NULL values in PDO query', 'When I run the snippet, NULL values are converted to empty strings. How can fetch NULL values?', GETDATE(), 4, 32)

/*7.	Find the count of the answers for the users from town. Display the town name, username and answers count. Sort the results by answers count in descending order, then by username. Name the columns exactly like in the table below. */
SELECT 
	t.Name AS Town,
	u.Username,
	COUNT(a.Id) AS AnswersCount
FROM Towns AS t
LEFT JOIN Users AS u
	ON t.Id = u.TownId
LEFT JOIN Answers AS a
	ON a.UserId = u.Id
GROUP BY t.Name, u.Username
ORDER BY AnswersCount DESC, u.Username ASC
GO

 