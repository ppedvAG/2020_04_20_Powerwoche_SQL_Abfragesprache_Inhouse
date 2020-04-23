-- SET OPERATOREN: UNION, UNION ALL, INTERSECT und EXCEPT



-- ******************************* UNION ***************************************
-- bisher: Ergebnis in neuer Tabelle mit entsprechend mehr Spalten


SELECT    CompanyName
		, OrderID
		, Freight
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID



-- NEEEEEEEEIIINNNN!!!!!!
SELECT	  c.CompanyName
		, c.ContactName
		, c.Phone
		, s.CompanyName
		, s.ContactName
		, s.Phone
		, e.LastName
		, e.HomePhone
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON p.ProductID = od.ProductID
				 INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
				 INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID

-- hier habe ich auch nicht alle Informationen drin!
-- nur die Kunden, die schon etwas bestellt haben
-- nur die Suppliers, bei denen wir schon Produkte haben
-- nur die Employees, die schon Bestellungen bearbeitet haben




-- vereinfacht:
SELECT 'Test1'
UNION
SELECT 'Test2'


-- mit Überschrift
SELECT 'Test1' AS Testüberschrift
UNION
SELECT 'Test2'


-- Achtung: Anzahl Spalten
SELECT 'Test1' AS Test, 'AB' AS AB
UNION
SELECT 'Test2', 'CD'
-- gleiche Anzahl Spalten: funktioniert


-- wir müssen die gleiche Anzahl an Spalten in allen am UNION beteiligten SELECT-Statements haben!
SELECT 'Test1' AS Test, 'AB' AS AB
UNION
SELECT 'Test2', 'CD', 'de'
-- funktioniert NICHT: All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists.


-- ACHTUNG: Datentypen in einer Spalte müssen gleich sein!
SELECT 'Test1', 100
UNION
SELECT 'Test2', 'AB'
-- funktioniert nicht: Conversion failed when converting the varchar value 'AB' to data type int.

-- funktioniert: gleiche Datentypen in einer Spalte
SELECT 'Test1', 123
UNION
SELECT 'Test2', 345


-- Datentypen umwandeln geht
SELECT 'Test1', CAST(100 AS varchar)
UNION
SELECT 'Test2', 'AB'



-- fehlende Spalten können auch aufgefüllt werden
SELECT 'Test1', 123, 'AB'
UNION
SELECT 'Test2', 345, 'blabla'
-- geht, aber Sinn?

-- geht, aber SINN??
SELECT CompanyName, ContactName, Phone
FROM Customers
UNION
SELECT 'blabla', LastName, HomePhone
FROM Employees


-- NULL funktioniert, aber von Fall zu Fall entscheiden, ob das Sinn macht
SELECT 'Test1', 123, 'AB'
UNION
SELECT 'Test2', 345, NULL

-- gleiches Beispiel mit DB:
SELECT CompanyName, ContactName, Phone
FROM Customers
UNION
SELECT NULL, LastName, HomePhone
FROM Employees

-- mit Überschriften:
SELECT    CompanyName AS Firma
		, ContactName AS Anrede
		, Phone AS Tel
FROM Customers
UNION
SELECT	  NULL
		, LastName
		, HomePhone
FROM Employees



-- UNION macht auch ein DISTINCT
SELECT 'Test'
UNION
SELECT 'Test'


-- wenn ich das NICHT möchte, verwende ich ein UNION ALL
SELECT 'Test'
UNION ALL
SELECT 'Test'




-- *************************** INTERSECT, EXCEPT **************************

CREATE TABLE #a (id int)

CREATE TABLE #b (id int)

INSERT INTO #a VALUES (1), (NULL), (2), (1)
INSERT INTO #b VALUES (1), (NULL), (3), (1)


-- UNION
SELECT * FROM #a
UNION
SELECT * FROM #b
-- NULL, 1, 2, 3


-- UNION ALL
SELECT * FROM #a
UNION ALL
SELECT * FROM #b
-- 1, NULL, 2, 1, 1, NULL, 3, 1


-- INTERSECT
SELECT * FROM #a
INTERSECT
SELECT * FROM #b
-- NULL, 1


-- EXCEPT
SELECT * FROM #a
EXCEPT
SELECT * FROM #b
-- 2
-- "Was gibt es in Tabelle a, was es nicht in Tabelle b gibt?"

SELECT * FROM #b
EXCEPT
SELECT * FROM #a
-- 3
-- "Was gibt es in Tabelle b, was es nicht in Tabelle a gibt?"


-- großer Unterschied zwischen INTERSECT und INNER JOIN!!!!

SELECT *
FROM #a a INNER JOIN #b b ON a.id = b.id
/*
	Ergebnis:
	id  id
	1	1
	1	1
	1	1
	1	1

*/



-- UNION-Übung:
-- Gib den Firmennamen, die Kontaktperson und die Telefonnummern aller Kunden und aller Supplier in einer Liste aus.
-- Füge eine Kategorie „C“ für Customer und „S“ für Supplier hinzu.

SELECT	  CompanyName
		, ContactName
		, Phone
		, 'C' AS Category
FROM Customers
UNION
SELECT	  CompanyName
		, ContactName
		, Phone
		, 'S'
FROM Suppliers
ORDER BY Category


-- Übung: Wie bekomme ich den höchsten und den niedrigsten Frachktostenwert in einer Liste?
-- OrderID  Freight  Wert
-- 10965      0.02    niedrigster Wert
-- 11976      1000.7  höchster Wert

-- geht nicht:!!!
SELECT TOP 1 OrderID, Freight, 'niedrigster Wert' AS Wert
FROM Orders
ORDER BY Freight
UNION
SELECT TOP 1 OrderID, Freight, 'höchster Wert' AS Wert
FROM Orders
ORDER BY Freight DESC -- dieses ORDER BY würde für beide gelten


-- mit temporären Tabellen gehts!
SELECT TOP 1 OrderID, Freight, 'niedrigster Wert' AS Wert
INTO #nn
FROM Orders
ORDER BY Freight


SELECT TOP 1 OrderID, Freight, 'höchster Wert' AS Wert
INTO #hh
FROM Orders
ORDER BY Freight DESC


SELECT *
FROM #nn
UNION
SELECT *
FROM #hh


-- mit Aggregatfunktion??

SELECT MIN(Freight)
FROM Orders
UNION
SELECT MAX(Freight)
FROM Orders
-- nur mit min/max Wert geht es auch so


SELECT MIN(Freight), 'niedrigster Wert' AS Wert
FROM Orders
UNION
SELECT MAX(Freight), 'höchster Wert' AS Wert
FROM Orders
-- geht auch noch

SELECT OrderID, MIN(Freight), 'niedrigster Wert' AS Wert
FROM Orders
GROUP BY OrderID
UNION
SELECT OrderID, MAX(Freight), 'höchster Wert' AS Wert
FROM Orders
GROUP BY OrderID
-- faaaalsch! Wir bekommen jetzt 1660 Ergebnisse - einmal den niedrigsten und einmal den höchsten Wert "pro" Bestellung...