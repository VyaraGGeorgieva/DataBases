/*Problem 7.	Define function in the SoftUni database.
Define a function in the database SoftUni that returns all Employee's names (first or middle or last name) and all town's names that are comprised of given set of letters. 
Example: 'oistmiahf' will return 'Sofia', 'Smith', but not 'Rob' and 'Guy'.
*/

USE SoftUni

GO
CREATE FUNCTION ufn_ContainingLetters (@Word nvarchar(50), @Letters nvarchar(50))
RETURNS bit
AS
BEGIN
	DECLARE @WordLength int;
	DECLARE @Counter int;
	DECLARE @CurrentLetter nvarchar(1);

	SET @Counter = 1;
	SET @WordLength = LEN(@Word);

	-- Check Input
	IF @WordLength = 0 OR @Word IS NULL
		RETURN 0;
	WHILE @Counter <= @WordLength
		BEGIN
			SET @CurrentLetter = SUBSTRING(@Word, @Counter, 1);
			IF CHARINDEX(@CurrentLetter, @Letters) = 0
				BEGIN
					RETURN 0;
				END
			SET @Counter = @Counter + 1;
		END
	RETURN 1;
END
GO

CREATE FUNCTION ufn_FindEmployeesContainingLetters ( @Letters nvarchar(50) )
RETURNS TABLE
AS
RETURN
	SELECT emp.FirstName, emp.MiddleName, emp.LastName, Towns.Name as 'Town'
	FROM Employees AS emp
	JOIN Addresses AS adr
	ON emp.AddressID = adr.AddressID
	JOIN Towns
	ON adr.TownID = Towns.TownID
	WHERE 
		dbo.ufn_ContainingLetters(LOWER(Towns.Name), @Letters) = 1
		AND (
			dbo.ufn_ContainingLetters(LOWER(emp.FirstName), @Letters) = 1
			OR 
			dbo.ufn_ContainingLetters(LOWER(ISNULL(emp.MiddleName, '')), @Letters) = 1
			OR 
			dbo.ufn_ContainingLetters(LOWER(emp.LastName), @Letters) = 1
			)
GO

SELECT * FROM ufn_FindEmployeesContainingLetters('oistmiahf')

GO