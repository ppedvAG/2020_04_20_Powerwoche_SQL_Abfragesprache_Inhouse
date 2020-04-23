-- WH3
-- Quiz auf quizizz.com

-- Übungen

-- Gib die Datumsdifferenz zwischen Lieferdatum und Wunschtermin der Bestellungen aus.
SELECT    DATEDIFF(dd, ShippedDate, RequiredDate) AS Datumsdifferenz
		, ShippedDate
		, RequiredDate
FROM Orders


/*

Gib die Bestellnummer,
     den Wunschtermin,
      das Lieferdatum und
     die Lieferverzögerung aus.
Ergebnisse von Bestellungen, die noch nicht geliefert wurden, sollen nicht ausgegeben werden.
Ordne das Ergebnis absteigend von der größten zur kleinsten Lieferverzögerung.
*/

SELECT	  OrderID
		, FORMAT(RequiredDate, 'd', 'de-de') AS [RequiredDate mit FORMAT]
		, CONVERT(varchar, ShippedDate, 104) AS [ShippedDate mit CONVERT]
		, DATEDIFF(DD, RequiredDate, ShippedDate) AS Lieferverzögerung
FROM Orders
WHERE ShippedDate IS NOT NULL
ORDER BY Lieferverzögerung DESC



--Gib die Mitarbeiternummer, den vollständigen Namen (in einer Spalte), die Anrede, das Geburtsdatum (ohne Zeitangabe) und die Telefonnummer aller Angestellten aus.
SELECT
          EmployeeID
        , CONCAT(FirstName, ' ', LastName) AS Fullname
        , TitleOfCourtesy
        , CONVERT(varchar, BirthDate, 104) AS BirthDate
        , HomePhone
FROM Employees 