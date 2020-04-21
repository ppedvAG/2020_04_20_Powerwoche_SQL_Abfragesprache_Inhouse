-- WHERE clause, WHERE-Klausel, WHERE-Bedingung
-- wenn wir nur bestimmte Ergebnisse ausgeben möchten


/*
	WHERE Operatoren:
		=, <, >, <=, >=
		!=, <>  -- darf NICHT diesem Wert entsprechen
		IN, BETWEEN, LIKE

		NOT IN, NOT BETWEEN, NOT LIKE

		-- besser positiv formulieren, !=, <> nicht so gut für Performance


	AND, OR

*/


-- alle Spalten der Customers Tabelle
SELECT *
FROM Customers

-- nur bestimmte Spalten der Customers Tabelle
SELECT	  CustomerID
		, CompanyName
		, ContactName
FROM Customers


-- nur die deutschen Kunden:
SELECT *
FROM Customers
WHERE Country = 'Germany'


SELECT	  CustomerID
		, CompanyName
		, Country
FROM Customers
WHERE Country = 'Germany'


SELECT	  OrderID
		, CustomerID
		, Freight
FROM Orders
WHERE Freight > 100



SELECT	  CustomerID
		, CompanyName
		, Country
		, City
FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'


SELECT	  CustomerID
		, CompanyName
		, Country
		, City
FROM Customers
WHERE Country = 'Germany' OR Country = 'Austria'



-- NICHT CASE-SENSITIVE
SELECT *
FROM customers
WHERE COUNTRY != 'germany' --  alle, die NICHT in D ansässig sind


-- ************************ Übungen ***************
-- Alle Kunden aus Frankreich
SELECT CompanyName
FROM Customers
WHERE Country = 'France'

-- Gib alle Kunden aus, die in Buenos Aires in Argentinien ansässig sind.
SELECT    CompanyName
		, Country
		, City
FROM Customers
WHERE Country = 'Argentina' AND City = 'Buenos Aires'

-- Gib alle portugiesischen und spanischen Kunden aus.
SELECT    CompanyName
		, Country
		, City
FROM Customers
WHERE Country = 'Spain' OR Country = 'Portugal'


-- Gib alle Produkte aus, von denen mehr als 100 vorhanden sind.
SELECT *
FROM Products
WHERE UnitsInStock > 100


-- alle Bestellungen, die vom Employee 3, 4 und 7 bearbeitet worden sind
SELECT *
FROM Orders
WHERE EmployeeID = 3 OR EmployeeID = 4 OR EmployeeID = 7
-- ... oder mit IN:

-- ******************** IN *****************************
SELECT *
FROM Orders
WHERE EmployeeID IN(3, 4, 7)

-- geht auch für Strings
SELECT    CompanyName
		, Country
		, City
FROM Customers
WHERE Country IN('Spain', 'Portugal', 'Argentina', 'Brazil')


-- alle Bestellungen, wo Frachtkosten >= 100 und <= 200 sind
SELECT *
FROM Orders
WHERE Freight >= 100 AND Freight <= 200


-- oder kürzer mit BETWEEN:

-- ********************** BETWEEN *****************************
SELECT *
FROM Orders
WHERE Freight BETWEEN 100 AND 200 -- inklusive 100 und 200


SELECT *
FROM Orders
WHERE Freight BETWEEN 101 AND 199 -- > 100 und < 200 mit between


SELECT *
FROM Customers
WHERE CustomerID BETWEEN 'HUNGO' AND 'MAISD'


-- Gib alle Produkte aus, deren ProduktID zwischen 10 und 15 (inklusive) liegt.
SELECT *
FROM Products
WHERE ProductID BETWEEN 10 AND 15

-- Gib alle Produkte aus, die vom Anbieter (SupplierID) 2, 7 oder 15 geliefert werden.
SELECT *
FROM Products
WHERE SupplierID IN(2, 7, 15)