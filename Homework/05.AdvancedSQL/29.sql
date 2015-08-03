/*Problem 29.	Write a SQL to create table WorkHours to store work reports for each employee.
Each employee should have id, date, task, hours and comments. Don't forget to define identity, primary key and appropriate foreign key.
*/
CREATE TABLE WorkHours
(
WorkHourID int PRIMARY KEY IDENTITY Not NUll,
	EmployeeId int FOREIGN KEY REFERENCES Employees(EmployeeId) NOT NULL,
Date datetime NULL,
Task nvarchar(MAX) NOT NULL,
WorkHours int NOT NULL,
Comments ntext NOT NULL
)
