/*1.	Create a table Countries(Id, Name). Use auto-increment for the primary key. Add a new column CountryId in the Towns table to link each town to some country (non-mandatory link). Create a foreign key between the Countries and Towns tables.*/

CREATE TABLE Countries(
	Id INT NOT NULL IDENTITY PRIMARY KEY,
	Name nvarchar(50) NOT NULL	
)
GO

ALTER TABLE Towns
ADD CountryId int 
GO

ALTER TABLE Towns
ADD CONSTRAINT FK_Towns_Countries 
FOREIGN KEY (CountryId) REFERENCES Countries(Id)
GO

INSERT INTO Countries(Name) VALUES ('Bulgaria'), ('Germany'), ('France')
UPDATE Towns SET CountryId = (SELECT Id FROM Countries WHERE Name='Bulgaria')
INSERT INTO Towns VALUES
('Munich', (SELECT Id FROM Countries WHERE Name='Germany')),
('Frankfurt', (SELECT Id FROM Countries WHERE Name='Germany')),
('Berlin', (SELECT Id FROM Countries WHERE Name='Germany')),
('Hamburg', (SELECT Id FROM Countries WHERE Name='Germany')),
('Paris', (SELECT Id FROM Countries WHERE Name='France')),
('Lyon', (SELECT Id FROM Countries WHERE Name='France')),
('Nantes', (SELECT Id FROM Countries WHERE Name='France'))

/*3.	Write and execute a SQL command that changes the town to "Paris" for all ads created at Friday.*/

UPDATE Ads
SET TownId = 
	(SELECT Id 
	FROM Towns 
	WHERE Name='Paris')
WHERE DATENAME(WEEKDAY, Date) = 'Friday'

/*4.	Write and execute a SQL command that changes the town to "Hamburg" for all ads created at Thursday.*/
UPDATE Ads
SET TownId =
	(SELECT Id
	FROM Towns
	WHERE Name = 'Hamburg')
WHERE DATENAME (WEEKDAY, Date) = 'Thursday'

/*5.	Delete all ads created by user in role "Partner".*/
DELETE FROM Ads
FROM Ads a
	JOIN AspNetUsers u ON a.OwnerId = u.Id
	JOIN AspNetUserRoles ur ON ur.UserId = u.Id
	JOIN AspNetRoles r ON r.Id = ur.RoleId
WHERE r.Name = 'Partner'

/*6.	Add a new add holding the following information: Title="Free Book", Text="Free C# Book", Date={current date and time}, Owner="nakov", Status="Waiting Approval".*/
INSERT INTO Ads (Title, Text, Date, OwnerId, StatusId)
VALUES ('Free Book','Free C# Book', GETDATE(),
(SELECT Id  FROM AspNetUsers WHERE UserName ='nakov'),
(SELECT Id FROM AdStatuses WHERE Status = 'Waiting Approval' ))

/*7.	Find the count of ads for each town. Display the ads count, the town name and the country name. Include also the ads without a town and country. Sort the results by town, then by country. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/

SELECT
  t.Name as Town,
  c.Name as Country,
  COUNT(a.Id) as AdsCount
FROM
  Ads a
 LEFT JOIN Towns t ON a.TownId = t.Id
 LEFT JOIN Countries c ON t.CountryId = c.Id
GROUP BY t.Name, c.Name
ORDER BY t.Name, c.Name
