-- einfache Tabellenabfragen
-- SELECT auf Tabellen
-- immer überprüfen, in welcher Datenbank wir uns befinden!!

-- Syntax:
/*
	SELECT	  Spalte1
			, Spalte2
			, Spalte3
			, ...
	FROM Tabellenname

*/


SELECT ContactName
FROM Customers


-- ALIAS angeben (andere Spaltenüberschrift)
SELECT ContactName AS Kontaktperson
FROM Customers

-- Das * bedeutet: alle Spalten
-- KEINE schöne Schreibweise!
-- in der Realität sollten IMMER ALLE Spalten hingeschrieben werden!!
SELECT *
FROM Customers

-- mehrere Spalten:
SELECT	  CompanyName
		, ContactName
--		, ...
FROM Customers



-- alias hinzufügen
SELECT	  CompanyName AS Firmenname
		, ContactName AS Kontaktperson
--		, ...
FROM Customers



SELECT	  CustomerID AS KundenID
		, CompanyName AS Firmenname
		, ContactName AS Kontaktperson
		, Phone AS Telefonnummer
FROM Customers


-- Gib die ProduktID, den Produktnamen und den Stückpreis aus.
SELECT	  ProductID AS ProduktID
		, ProductName AS Produktname
		, UnitPrice AS Stückpreis
FROM Products



-- Gib die Nettofrachtkosten, Bruttofrachtkosten und die Mehrwertsteuer aus (Berechnung).


-- Berechnungen:

SELECT 100*3


SELECT	  Freight AS Nettofrachtkosten
		, Freight * 1.19 --AS Bruttofrachtkosten
		, Freight * 0.19 --AS MwSt
FROM Orders



