-- einfache Tabellenabfragen
-- SELECT auf Tabellen
-- immer �berpr�fen, in welcher Datenbank wir uns befinden!!

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


-- ALIAS angeben (andere Spalten�berschrift)
SELECT ContactName AS Kontaktperson
FROM Customers

-- Das * bedeutet: alle Spalten
-- KEINE sch�ne Schreibweise!
-- in der Realit�t sollten IMMER ALLE Spalten hingeschrieben werden!!
SELECT *
FROM Customers

-- mehrere Spalten:
SELECT	  CompanyName
		, ContactName
--		, ...
FROM Customers



-- alias hinzuf�gen
SELECT	  CompanyName AS Firmenname
		, ContactName AS Kontaktperson
--		, ...
FROM Customers



SELECT	  CustomerID AS KundenID
		, CompanyName AS Firmenname
		, ContactName AS Kontaktperson
		, Phone AS Telefonnummer
FROM Customers


-- Gib die ProduktID, den Produktnamen und den St�ckpreis aus.
SELECT	  ProductID AS ProduktID
		, ProductName AS Produktname
		, UnitPrice AS St�ckpreis
FROM Products



-- Gib die Nettofrachtkosten, Bruttofrachtkosten und die Mehrwertsteuer aus (Berechnung).


-- Berechnungen:

SELECT 100*3


SELECT	  Freight AS Nettofrachtkosten
		, Freight * 1.19 --AS Bruttofrachtkosten
		, Freight * 0.19 --AS MwSt
FROM Orders



