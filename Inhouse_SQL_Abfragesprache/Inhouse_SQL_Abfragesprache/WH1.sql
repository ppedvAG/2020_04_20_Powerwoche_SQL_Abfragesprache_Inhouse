-- WH 1

-- Was k�nnen wir in die Ausgabe schreiben?

/*
	Zahlen, Text

*/

SELECT 100

SELECT 'Text'

SELECT 'Test' AS [meine �berschrift]


-- alle Spalten mit *
SELECT *
FROM Customers


-- mehrere Spalten ausw�hlen
SELECT	  CustomerID
		, CompanyName
		, ContactName
FROM Customers


SELECT 
  Freight -- AS Frachtkosten
, Freight * 0.19 AS MwSt
FROM Orders



-- vollst�ndigen Namen in einer Spalte ausgeben

SELECT CONCAT(FirstName, ' ', LastName) AS [vollst�ndiger Name]
FROM Employees


-- an einer bestimmten Stelle etwas einf�gen
SELECT STUFF('Testtext', 5, 0, '***')


-- Zeichen ausschneiden
SELECT SUBSTRING('Testtext', 4, 2) -- tt
SELECT LEFT('Testtext', 2) -- Te
SELECT RIGHT('Testtext', 2) -- xt


-- bestimmte Zeichen ersetzen
SELECT REPLACE('Hallo', 'a', 'e')


-- Zeichen mehrfach ausgeben
SELECT REPLICATE('x', 5)