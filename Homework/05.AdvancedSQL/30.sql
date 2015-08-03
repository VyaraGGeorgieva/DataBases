/*Problem 30.	Issue few SQL statements to insert, update and delete of some data in the table.*/
INSERT INTO WorkHours 
	VALUES
	(3,GETDATE(), 'Get all things done', 5, 'Don`t forget to wash the floor too.')
INSERT INTO WorkHours 
	VALUES
	(5,GETDATE(), 'Finish the report', 7, 'You have not done anything so far.')
UPDATE WorkHours SET WorkHours = 4
WHERE EmployeeID = 3
