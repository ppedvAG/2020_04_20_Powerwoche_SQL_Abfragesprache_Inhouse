-- WH4

SELECT Country
FROM Customers

SELECT DISTINCT Country
FROM Customers

-- bringt nix, weil wir jetzt wieder so viele Zeilen wie Kunden haben
SELECT DISTINCT Country, CustomerID
FROM Customers


-- DISTINCT mit mehreren Spalten
SELECT DISTINCT Country, City
FROM Customers
-- 69 Treffer (so viele, wie Städte)


SELECT TOP 1 *
FROM Customers

-- nur bestimmte Spalten, aber nur eine Zeile
SELECT TOP 1 CustomerID
			, CompanyName
			, ContactName
--			, ...
FROM Customers
ORDER BY Country
-- WAS mein TOP 1 ist, ist immer abhängig vom ORDER BY

-- höchster Frachtkostenwert:
SELECT TOP 1 Freight
FROM Orders
ORDER BY Freight DESC

-- überprüfen:
SELECT Freight
FROM Orders
ORDER BY Freight -- DESC


-- Top 10% der niedrigsten Frachtkosten
SELECT TOP 10 PERCENT *
FROM Orders
ORDER BY Freight




-- SET-Operatoren: UNION, UNION ALL, INTERSECT, EXCEPT

-- Aggregatfunktionen: COUNT, SUM, AVG, MIN, MAX

SELECT    AVG(Freight) AS [durchschnittliche Frachtkosten pro Frächter]
		, ShipVia
FROM Orders
GROUP BY ShipVia

-- bringt nix:
SELECT    AVG(Freight) AS [durchschnittliche Frachtkosten pro Frächter]
		, ShipVia
		, OrderID
FROM Orders
GROUP BY ShipVia, OrderID
-- wir bekommen wieder alle Bestellungen heraus und keine Durchschnittswerte



-- Gib alle Regionen der Kunden und der Angestellten aus.
-- Füge eine Kategorie „C“ für Customer und „E“ für Employee hinzu.
SELECT Region, 'C' AS Category
FROM Customers
UNION
SELECT Region, 'E'
FROM Employees
-- UNION macht auch ein DISTINCT, doppelte Regionen werden NICHT angezeigt




-- Achtung, Fehlermeldung: CustomerID (ALFKI) hat NICHT den gleichen Datentyp wie EmployeeID!
SELECT CustomerID, Region, 'C' AS Category
FROM Customers
UNION
SELECT EmployeeID, Region, 'E'
FROM Employees


-- mit CAST gehts
SELECT    CustomerID AS ID
		, Region
		, 'C' AS Category
FROM Customers
UNION
SELECT    CAST(EmployeeID AS varchar) -- AS ID
		, Region
		, 'E'
FROM Employees
-- Sinn?? von Fall zu Fall überlegen




