/*Problem 3.	Users with "1/0" Phones
Display usernames and last names along with a column named "Has Phone" holding "1" or "0" for all users sorted by their last name, then by id. Name the columns exactly like in the table below.
*/

USE Forum
Go

SELECT u.UserName, u.LastName, 
	CASE 
		WHEN u.PhoneNumber IS NULL THEN '0'
		ELSE '1'
END	
as [Has Phone]
FROM Users u
ORDER BY u.LastName, u.Id