-- TOP Abfragen
-- ORDER BY verwenden!!! um sicherzustellen, dass es in einer für uns nachvollziehbaren Ordnung ausgegeben wird

SELECT *
FROM Customers
--ORDER BY Country



-- nur 1 Zeile ausgeben mit TOP 1
SELECT TOP 1 *
FROM Customers

-- nur 1. Zeile mit bestimmten Spalten
SELECT TOP 1  CustomerID
			, CompanyName
			, ContactName
--			, ...
FROM Customers


-- WAS ist die erste Zeile????
SELECT TOP 1  CustomerID
			, CompanyName
			, ContactName
--			, ...
FROM Customers
ORDER BY CustomerID
-- so würden wir korrekt alphabetisch geordnet nach CustomerID die "1. Zeile" ausgeben
-- ALFKI

SELECT TOP 1  CustomerID
			, CompanyName
			, ContactName
--			, ...
FROM Customers
ORDER BY Country
-- CACTU


-- mit WHERE
SELECT TOP 1  CustomerID
			, CompanyName
			, ContactName
--			, ...
FROM Customers
WHERE Region IS NOT NULL
ORDER BY Country
-- COMMI


-- geht auch mit Prozent... PERCENT ausschreiben, % funktioniert nicht
SELECT TOP 3 PERCENT *
FROM Customers
ORDER BY CustomerID


SELECT TOP 3 PERCENT  CustomerID
					, CompanyName
					, ContactName
--					,...
FROM Customers
ORDER BY CustomerID


-- mehrere Zeilen ausgeben:
SELECT TOP 5 *
FROM Customers
ORDER BY CustomerID


-- wie bekomme ich die letzten 5?
SELECT TOP 5 *
FROM Customers
ORDER BY CustomerID DESC





SELECT TOP 17 WITH TIES OrderID
			, CustomerID
			, Freight
--			, ...
FROM Orders
ORDER BY Freight



-- Gib das teuerste Produkt aus.

SELECT TOP 1  ProductID
			, ProductName
			, UnitPrice
FROM Products
ORDER BY UnitPrice DESC


-- Suche die Top 10% der Produkte mit den größten Verkaufsmengen (ProductName, Quantity).
-- Einschließlich Produkte mit der gleichen Einkaufsmenge wie das letzte in der ursprünglichen Ausgabe.
SELECT TOP 10 PERCENT WITH TIES
          p.ProductID
        , ProductName
        , od.Quantity
FROM Products p INNER JOIN [Order Details] od on p.ProductID = od.ProductID
ORDER BY od.Quantity DESC



-- Gib die drei Mitarbeiter, die als erste eingestellt wurden, aus (die schon am längsten beim Unternehmen sind).
-- Wähle nicht alle, sondern nur einige in diesem Zusammenhang sinnvolle Spalten aus.
SELECT	TOP 3  EmployeeID
		, CONCAT(FirstName, ' ', LastName) as Fullname
		, Title
		, HireDate
		, FORMAT(HireDate, 'd', 'de-de') AS [HireDate mit FORMAT]
		, CONVERT(varchar, HireDate, 104) as [HireDateDE mit CONVERT]
FROM Employees
ORDER BY HireDate ASC
-- ASC deshalb, weil das kleinste Datum bedeutet, dass der Mitarbeiter schon am längsten dabei ist (1992 eingestellt ist länger dabei als 1993)





