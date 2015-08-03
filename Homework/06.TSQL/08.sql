/*Problem 8.	Using database cursor write a T-SQL
Using database cursor write a T-SQL script that scans all employees and their addresses and prints all pairs of employees that live in the same town.
*/
USE SoftUni
GO
DECLARE Employees_Cursor CURSOR READ_ONLY FOR
 
SELECT fe.FirstName, fe.LastName, ft.Name AS [Town Name], se.FirstName, se.LastName
FROM Employees fe
JOIN Addresses fa
ON fe.AddressID = fa.AddressID
JOIN Towns ft
ON fa.TownID = ft.TownID
CROSS JOIN Employees se
JOIN Addresses sa
ON se.AddressID = sa.AddressID
JOIN Towns st
ON sa.TownID = st.TownID
WHERE ft.Name = st.Name AND fe.EmployeeID != se.EmployeeID
ORDER BY fe.FirstName, se.FirstName
 
OPEN Employees_Cursor
DECLARE @firstName1 NVARCHAR(50), @lastName1 NVARCHAR(50), @town NVARCHAR(50), 
	@firstName2 NVARCHAR(50), @lastName2 NVARCHAR(50)

FETCH NEXT FROM Employees_Cursor INTO 
	@firstName1, @lastName1, @town, @firstName2, @lastName2
 
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 
		@town + ': ' + 
		@firstName1 + ' ' + @lastName1 +
		', ' +
		@firstName2 + ' ' + @lastName2
	FETCH NEXT FROM Employees_Cursor INTO
		@firstName1, @lastName1, @town, @firstName2, @lastName2
END
 
CLOSE Employees_Cursor
DEALLOCATE Employees_Cursor