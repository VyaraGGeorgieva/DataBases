/*Problem 17.	Write a SQL statement to create a table Groups. 
Groups should have unique name (use unique constraint). Define primary key and identity column.
You should submit a SQL file as a part of your homework.*/
CREATE TABLE Groups(
GroupID int IDENTITY NOT NULL,
Name nvarchar(50) NOT NULL,
CONSTRAINT PK_Users PRIMARY KEY(GroupID),
UNIQUE (Name)
)