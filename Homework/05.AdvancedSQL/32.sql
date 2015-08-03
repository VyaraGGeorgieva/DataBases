/*Problem 32.	Start a database transaction, delete all employees from the 'Sales' department along with all dependent records from the pother tables. At the end rollback the transaction.*/
BEGIN TRAN
DELETE Employees

SELECT *
FROM Employees e
 JOIN Departments d
 ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'
ROLLBACK TRAN
