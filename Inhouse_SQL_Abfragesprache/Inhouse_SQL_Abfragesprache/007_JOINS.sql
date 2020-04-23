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



-- RIGHT JOIN
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, c.Address
		, c.Country
FROM Customers c RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
-- in diesem Fall kommt zufällig das Gleiche raus wie beim INNER JOIN
-- wir bekommen nur die Kunden, die auch schon etwas bestellt haben
-- in der Orders-Tabelle stehen keine Kundennummern von Kunden, die noch nichts bestellt haben


-- LEFT JOIN
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, c.Address
		, c.Country
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
-- jetzt bekommen wir auch die Kunden heraus, die noch nichts bestellt haben

SELECT	*
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID



-- Wer hat noch nichts bestellt?
SELECT CustomerID
FROM Orders
WHERE CustomerID IS NULL
-- geht nicht - kein Ergebnis, weil wenn jemand noch nichts bestellt hat, steht er nicht in der Orders-Tabelle

SELECT CustomerID
FROM Customers
WHERE OrderID IS NULL
-- geht nicht, weil in Customer-Tabelle gibt es keine OrderID

-- mit LEFT JOIN:
SELECT c.CustomerID
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL

SELECT *
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL


SELECT    c.CustomerID
		, ContactName
		, Address
		, Phone
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL

-- oder mit RIGHT JOIN:
SELECT c.CustomerID
FROM Orders o RIGHT JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL


-- Kontaktinformationen von den Anbietern (Suppliers)
-- von den Anbietern mit der ID 3-7
-- die die Produkte mit der ProduktID 65-70 liefern
SELECT	  CompanyName
		, ContactName
		, Address
		, City
		, Phone
		, Fax
FROM Suppliers s INNER JOIN Products p ON s.SupplierID = p.SupplierID
WHERE s.SupplierID IN(3, 4, 5, 6, 7) AND p.ProductID IN(65, 66, 67, 68, 69, 70)

SELECT	  CompanyName
		, ContactName
		, Address
		, City
		, Phone
		, Fax
--		, s.SupplierID
--		, ProductID
FROM Suppliers s INNER JOIN Products p ON s.SupplierID = p.SupplierID
WHERE s.SupplierID BETWEEN 3 AND 7 AND p.ProductID BETWEEN 65 AND 70



-- Kundenbeschwerden bei den Bestellungen 10251, 10280, 10990, 11000
-- wer hat diese Bestellungen bearbeitet?
-- Name vom Angestellten (Vor- und Nachname)
-- Name in einem Feld als FullName ausgeben
SELECT	  OrderID
		, CONCAT(FirstName, ' ', LastName) AS FullName
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderID IN(10251, 10280, 10990, 11000)


-- Welche Kunden haben Chai Tee gekauft und wieviel?
-- (OrderID, CustomerID, CompanyName, ProductName, Quantity)

-- wie heißt denn eigentlich das Produkt in der Datenbank?
SELECT *
FROM Products
WHERE ProductName LIKE '%chai%'


SELECT	  o.OrderID
		, c.CustomerID
		, CompanyName
		, ProductName
		, Quantity
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE ProductName LIKE '%chai%'
ORDER BY CustomerID


-- Suche alle Bestellungen, bei denen Bier verkauft wurde. Welcher Kunde? Wieviel? Welches Bier?
--Tipp: Der Produktname kann „Bier“ oder „Lager“ enthalten oder mit „Ale“ enden.
--Nach Menge und Kundenname geordnet:
--	Menge absteigend (größte zuerst), 	Kundenname aufsteigend (A-Z)

SELECT	  o.OrderID
		, c.CustomerID
		, CompanyName
		, ProductName
		, Quantity
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE ProductName LIKE '%bier%' 
	OR ProductName LIKE '%lager%' 
	OR ProductName LIKE '%ale'
ORDER BY od.Quantity DESC, c.CompanyName ASC

-- Vorgesetzte??
-- so nicht:
SELECT	  FirstName
		, LastName
		, EmployeeID
FROM Employees
WHERE EmployeeID = ReportsTo
-- ... also das bringt gar nix...



-- Wer ist der Chef von wem?
-- Ausgabe:
-- Name Angestellter, ID Angestellter, Name Chef, ID vom Chef
SELECT	  emp.FirstName
		, emp.LastName
		, emp.EmployeeID
		, emp.ReportsTo
		, boss.FirstName
		, boss.LastName
		, boss.EmployeeID
FROM Employees emp INNER JOIN Employees boss ON emp.ReportsTo = boss.EmployeeID

-- mit INNER JOIN bekommen wir nur die Angestellten, die auch einen Chef haben
SELECT	  CONCAT(emp.FirstName, ' ', emp.LastName) AS Mitarbeitername
--		, emp.EmployeeID
		, emp.ReportsTo
		, CONCAT(boss.FirstName, ' ', boss.LastName) AS [Name Chef]
		, boss.EmployeeID
FROM Employees emp INNER JOIN Employees boss ON emp.ReportsTo = boss.EmployeeID


-- mit LEFT JOIN bekommen wir auch die Angestellten, denen entweder noch kein Chef zugeteilt wurde, oder die keinen Chef haben (weil sie selbst der Chef sind)
SELECT	  CONCAT(emp.FirstName, ' ', emp.LastName) AS Mitarbeitername
--		, emp.EmployeeID
		, emp.ReportsTo
		, CONCAT(boss.FirstName, ' ', boss.LastName) AS [Name Chef]
		, boss.EmployeeID
FROM Employees emp LEFT JOIN Employees boss ON emp.ReportsTo = boss.EmployeeID

-- Gib alle Kunden aus, die in der gleichen Stadt wohnen, wie ein anderer Kunde (nicht sie selbst).
-- Ausgabe:
-- Customer1, City1, Customer2, City2
SELECT	  c.CompanyName AS Customer1
		, c.City
		, cc.CompanyName AS Customer2
		, cc.City
FROM Customers c INNER JOIN Customers cc ON c.City = cc.City
WHERE c.CustomerID != cc.CustomerID
ORDER BY c.City, c.CompanyName
