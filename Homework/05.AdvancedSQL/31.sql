/*Problem 31.	Define a table WorkHoursLogs to track all changes in the WorkHours table with triggers.
For each change keep the old record data, the new record data and the command (insert / update / delete).
You should submit a SQL file as a part of your homework.*/

CREATE TABLE WorkHoursLogs
(
        Id int IDENTITY NOT NULL,
		Message nvarchar(150) NOT NULL,
		DateOfChange datetime NOT NULL,
		CONSTRAINT PK_WorkHoursLogs PRIMARY KEY (Id)
)

GO

CREATE TRIGGER  tr_WorkHoursInsert 
ON WorkHours
 FOR INSERT
AS 
	INSERT INTO WorkHoursLogs (Message, DateOfChange)
	VALUES('Added row', GETDATE ( ))
GO

CREATE TRIGGER  tr_WorkHoursDelete 
ON WorkHours
 FOR DELETE
AS 
	INSERT INTO WorkHoursLogs (Message, DateOfChange)
	VALUES('Deleted row', GETDATE ( ))
GO

CREATE TRIGGER  tr_WorkHoursUpdate
ON WorkHours
 FOR UPDATE
AS 
	INSERT INTO WorkHoursLogs (Message, DateOfChange)
	VALUES('Update row', GETDATE ( ))
GO

INSERT INTO WorkHours (EmployeeId, Date, Task)
	VALUES(10, GETDATE ( ), 'Bla-Bla')

INSERT INTO WorkHours (EmployeeId, Date, Task)
	VALUES(11, GETDATE ( ), 'Bla-Bla-2')

DELETE WorkHours
WHERE EmployeeId = 10

UPDATE WorkHours
SET Task = 'Bla-Bla Ura-a-a'
WHERE EmployeeId = 11

SELECT * FROM WorkHoursLogs