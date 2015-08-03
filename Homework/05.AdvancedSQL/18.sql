/*Problem 18.	Write an SQL statement to add a column GroupID to the table Users.
Fill some data in this new column and as well in the Groups table. Write a SQL statement to add a foreign key constraint between tables Users and Groups tables.
You should submit a SQL file as a part of your homework.*/

ALTER TABLE Users
ADD GroupID int NOT NULL,
FOREIGN KEY (GroupID) REFERENCES Groups (GroupID);

