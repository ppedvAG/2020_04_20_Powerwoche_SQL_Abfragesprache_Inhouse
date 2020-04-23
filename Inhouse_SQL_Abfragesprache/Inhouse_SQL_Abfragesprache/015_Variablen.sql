-- Variablen

/*
	-- lokale
	-- @varName
	-- Zugriff nur von der Session, wo sie erstellt wurde

	-- globale
	-- @@varName
	-- Zugriff auch von außerhalb der Session


	-- Lebenszeit: nur solange der Batch läuft

	-- Variable deklarieren
	-- welchen Datentyp soll diese Variable bekommen
	-- Wert zuweisen


	Bsp.:
	DECLARE @varName AS Datentyp

*/

-- Variable deklarieren
DECLARE @var1 AS int

-- Wert zuweisen
SET @var1 = 100


-- Beispiel mit FORMAT
DECLARE @myDate datetime2 = SYSDATETIME();
SELECT FORMAT(@myDate, 'dd.MM.yyyy')

-- Variable für sich allein bringt nicht viel - die gibts nur so lange, wie der Batch läuft
DECLARE @var2 AS int

SET @var2 = 100

SELECT *
FROM Orders
WHERE Freight < @var2