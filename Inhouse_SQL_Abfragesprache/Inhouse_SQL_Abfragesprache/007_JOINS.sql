-- Tabellen miteinander verknüpfen: JOINS

-- INNER JOIN


					-- LEFT JOIN
-- OUTER JOINS
					-- RIGHT JOIN



-- INNER JOIN
SELECT *
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID



-- einschränken!
SELECT	  OrderID
		, Customers.CustomerID -- wenn gleicher Spaltenname: aus welcher Tabelle?
		, CompanyName
		, Address
		, Country
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- bei den anderen können wir dazuschreiben, aus welchen Tabellen die Information kommt, müssen aber nicht
SELECT	  Orders.OrderID
		, Customers.CustomerID -- wenn gleicher Spaltenname: aus welcher Tabelle?
		, Customers.CompanyName
		, Customers.Address
		, Customers.Country
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID


-- kürzere Schreibweise
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, c.Address
		, c.Country
FROM Customers AS c INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID


-- noch ein bisschen kürzer:
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, c.Address
		, c.Country
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID



-- mit WHERE einschränken:
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, c.Address
		, c.Country
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'Germany'
ORDER BY o.OrderID -- ich kann angeben, aus welcher Tabelle, muss aber nicht, wenn Name eindeutig


-- Gib alle Kunden (Firmenname) aus Brasilien und deren Frachtkosten aus.
-- Ordne die Ausgabe aufsteigend nach Frachtkosten.

SELECT    c.CompanyName
		, c.Country
		, o.Freight
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'Brazil'
ORDER BY o.Freight, c.CompanyName


-- Gib die Namen der Anbieter (Supplier), die Sauce verkaufen, aus. (CompanyName, ProductName, Ansprechperson, Telefonnummer). 
SELECT   s.SupplierID
        , CompanyName
        , ProductName
        , ContactName
        , Phone
FROM Products p INNER JOIN Suppliers s ON s.SupplierID = p.SupplierID
WHERE ProductName LIKE '%sauce%'
ORDER BY CompanyName




SELECT	  o.OrderID
		, p.ProductID
		, ProductName
		, Quantity
		, od.UnitPrice
FROM Orders o INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
			  INNER JOIN Products p ON p.ProductID = od.ProductID
WHERE Freight > 100 -- auch hier möglich, Freight kommt nicht im SELECT vor
ORDER BY ShipCountry -- theoretisch können wir auch nach Spalten ordnen, die im SELECT gar nicht vorkommen (Sinn? - von Fall zu Fall entscheiden)