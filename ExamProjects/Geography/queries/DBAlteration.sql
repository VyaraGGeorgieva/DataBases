/* 1.	Create a table Monasteries(Id, Name, CountryCode). Use auto-increment for the primary key. Create a foreign key between the tables Monasteries and Countries*/

USE Geography
GO


-- Drop all existing Geography tables, so that we can create them
IF OBJECT_ID('Monasteries') IS NOT NULL
  DROP TABLE Monasteries

-- Create Table

CREATE TABLE Monasteries(
Id int IDENTITY,
Name varchar(50) NOT NULL,
CountryCode char (2) NOT NULL,
CONSTRAINT PK_Monasteries PRIMARY KEY (Id),
CONSTRAINT FK_MOnatseries_Countries FOREIGN KEY (CountryCode) REFERENCES Countries (CountryCode))
GO

/* 2.INSERT values*/

INSERT INTO Monasteries(Name, CountryCode) VALUES
('Rila Monastery “St. Ivan of Rila”', 'BG'), 
('Bachkovo Monastery “Virgin Mary”', 'BG'),
('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
('Kopan Monastery', 'NP'),
('Thrangu Tashi Yangtse Monastery', 'NP'),
('Shechen Tennyi Dargyeling Monastery', 'NP'),
('Benchen Monastery', 'NP'),
('Southern Shaolin Monastery', 'CN'),
('Dabei Monastery', 'CN'),
('Wa Sau Toi', 'CN'),
('Lhunshigyia Monastery', 'CN'),
('Rakya Monastery', 'CN'),
('Monasteries of Meteora', 'GR'),
('The Holy Monastery of Stavronikita', 'GR'),
('Taung Kalat Monastery', 'MM'),
('Pa-Auk Forest Monastery', 'MM'),
('Taktsang Palphug Monastery', 'BT'),
('Sümela Monastery', 'TR')

GO

/*3.	Write a SQL command to add a new Boolean column IsDeleted in the Countries table (defaults to false). Note that there is no "Boolean" type in SQL server, so you should use an alternative.*/

IF OBJECT_ID('IsDeleted') IS NOT NULL
  DROP TABLE IsDeleted 

ALTER TABLE Countries
ADD IsDeleted bit NOT NULL
DEFAULT 0 
GO

/*4.	Write and execute a SQL command to mark as deleted all countries that have more than 3 rivers.*/

USE Geography
GO

UPDATE Countries
SET IsDeleted = 1
WHERE CountryCode IN 
	(
	SELECT c.CountryCode
	FROM Countries c
		LEFT JOIN CountriesRivers cr
			ON cr.CountryCode = c.CountryCode
		LEFT JOIN Rivers r
			ON r.Id = cr.RiverId
		GROUP BY c.CountryCode
		HAVING Count(r.Id)>3
	)

	GO

	/*5.	Write a query to display all monasteries along with their countries sorted by monastery name. Skip all deleted countries and their monasteries. Submit for evaluation the result grid with headers.*/

	USE Geography
	GO
	
	SELECT m.Name as [Monastery], c.CountryName as [Country]
	FROM Monasteries m
		JOIN Countries c
		ON c.CountryCode = m.CountryCode
	WHERE c.IsDeleted = 0
	ORDER BY m.Name

	/*1.	Write and execute a SQL command that changes the country named "Myanmar" to its other name "Burma".*/

	UPDATE Countries
	SET CountryName = 'Burma'
	WHERE CountryName = (
	SELECT c.CountryName
	FROM Countries c
	WHERE c.CountryName LIKE 'Myanmar')

	/*2.	Add a new monastery holding the following information: Name="Hanga Abbey", Country="Tanzania".*/

	INSERT INTO Monasteries (Name, CountryCode)
	VALUES ('Hanga Abbey', 'TZ')

/*3.	Add a new monastery holding the following information: Name="Myin-Tin-Daik", Country="Myanmar".*/

INSERT INTO Monasteries (Name, CountryCode)
VALUES ('Myin-Tin-Daik', 'MM')

/*4.	Find the count of monasteries for each continent and not deleted country. Display the continent name, the country name and the count of monasteries. Include also the countries with 0 monasteries. Sort the results by monasteries count (from largest to lowest), then by country name alphabetically. Name the columns exactly like in the table below. Submit for evaluation the result grid with headers.*/

SELECT cont.ContinentName, cntr.CountryName, COUNT (m.Name) as 'MonasteriesCount' 
FROM Continents cont
	LEFT JOIN Countries cntr
	ON cont.ContinentCode = cntr.ContinentCode
	LEFT JOIN Monasteries m
	ON cntr.CountryCode = m.CountryCode
WHERE cntr.IsDeleted = 0
GROUP BY cont.ContinentName, cntr.CountryName
ORDER BY MonasteriesCount DESC, cntr.CountryName



