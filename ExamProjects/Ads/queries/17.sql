/*Create a view "AllAds" in the database that holds information about ads: id, title, author (username), date, town name, category name and status, sorted by id. */

USE Ads
GO

CREATE VIEW AllAds
AS
SELECT a.Id, a.Title, u.UserName as 'Author', a.Date, t.Name as 'Town', c.Name as 'Category', st.Status
FROM Ads a
	LEFT JOIN AspNetUsers u
	ON u.Id = a.OwnerId
	LEFT JOIN Towns t
	ON t.Id = a.TownId
	LEFT JOIN Categories c
	ON c.Id = a.CategoryId
	LEFT JOIN AdStatuses st
	ON st.Id = a.StatusId

GO

SELECT *
FROM AllAds

/*create a stored function "fn_ListUsersAds" that returns a table, holding all users in descending order as first column, along with all dates of their ads (in ascending order) in format "yyyyMMdd", separated by "; " as second column.*/

IF (object_id(N'fn_ListUsersAds') IS NOT NULL)
DROP FUNCTION fn_ListUsersAds
GO

CREATE FUNCTION fn_ListUsersAds()
	RETURNS @tbl_UsersAds TABLE(
		UserName NVARCHAR(MAX),
		AdDates NVARCHAR(MAX)
	)
AS
BEGIN
	DECLARE UsersCursor CURSOR FOR
		SELECT UserName FROM AspNetUsers
		ORDER BY UserName DESC;
	OPEN UsersCursor;
	DECLARE @username NVARCHAR(MAX);
	FETCH NEXT FROM UsersCursor INTO @username;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @ads NVARCHAR(MAX) = NULL;
		SELECT
			@ads = CASE
				WHEN @ads IS NULL THEN CONVERT(NVARCHAR(MAX), Date, 112)
				ELSE @ads + '; ' + CONVERT(NVARCHAR(MAX), Date, 112)
			END
		FROM AllAds
		WHERE Author = @username
		ORDER BY Date;

		INSERT INTO @tbl_UsersAds
		VALUES(@username, @ads)
		
		FETCH NEXT FROM UsersCursor INTO @username;
	END;
	CLOSE UsersCursor;
	DEALLOCATE UsersCursor;
	RETURN;
END
GO

SELECT * FROM fn_ListUsersAds()
