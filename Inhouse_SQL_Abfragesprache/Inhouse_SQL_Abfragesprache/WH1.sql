-- WH 1

-- Was können wir in die Ausgabe schreiben?

/*
	Zahlen, Text

*/

SELECT 100

SELECT 'Text'

SELECT 'Test' AS [meine Überschrift]


-- alle Spalten mit *
SELECT *
FROM Customers


-- mehrere Spalten auswählen
SELECT	  CustomerID
		, CompanyName
		, ContactName
FROM Customers


SELECT 
  Freight -- AS Frachtkosten
, Freight * 0.19 AS MwSt
FROM Orders



-- vollständigen Namen in einer Spalte ausgeben

SELECT CONCAT(FirstName, ' ', LastName) AS [vollständiger Name]
FROM Employees


-- an einer bestimmten Stelle etwas einfügen
SELECT STUFF('Testtext', 5, 0, '***')


-- Zeichen ausschneiden
SELECT SUBSTRING('Testtext', 4, 2) -- tt
SELECT LEFT('Testtext', 2) -- Te
SELECT RIGHT('Testtext', 2) -- xt


-- bestimmte Zeichen ersetzen
SELECT REPLACE('Hallo', 'a', 'e')


-- Zeichen mehrfach ausgeben
SELECT REPLICATE('x', 5)