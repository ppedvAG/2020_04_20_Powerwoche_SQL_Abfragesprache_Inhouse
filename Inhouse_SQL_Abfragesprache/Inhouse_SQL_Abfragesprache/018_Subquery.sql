-- Unterabfragen, Subselect
-- subquery

-- Unterabfrage wie Spalte, wie Tabelle oder im WHERE verwenden möglich


-- Subquery wie Spalte verwenden:
SELECT	  'Text'
		, Freight
		, (SELECT TOP 1 Freight FROM Orders ORDER BY Freight)
FROM Orders
-- wenn Unterabfrage wie eine Spalte verwendet wird, darf da nur 1 Wert drinstehen



-- Subquery wie Tabelle verwenden
-- Subquery als Datenquelle
SELECT *
FROM -- Tabelle??
		(SELECT OrderID, Freight FROM Orders WHERE EmployeeID = 3) t1
-- wenn wir Subquery als Datenquelle verwenden (also wie eine Tabelle), dann müssen wir auch einen Namen (ALIAS) vergeben (hier t1)



-- Unterabfrage im WHERE unterbringen
 

 -- alle Bestellungen, wo die Frachtkosten größer sind als die durchschnittlichen Frachtkosten
 SELECT *
 FROM Orders
 WHERE Freight > (SELECT AVG(Freight) FROM Orders) -- 78,2442
 ORDER BY Freight
 -- da müssen wir EINEN ganz bestimmten Wert herausbekommen, denn wir wollen ja überprüfen, ob Freight größer ist als dieser Wert
 -- hier können wir nicht mehrere Spalten eingeben


 -- auch mit AND kombinierbar
 SELECT *
 FROM Orders
 WHERE Freight > (SELECT AVG(Freight) FROM Orders) AND Freight < 200
 ORDER BY Freight

 -- auch mehrere wären möglich (aber Sinn? und Performance)
 SELECT *
 FROM Orders
 WHERE Freight > (SELECT AVG(Freight) FROM Orders) AND Freight < (SELECT SUM(Freight) FROM Orders)
 ORDER BY Freight


 -- Gib alle Kunden aus, die in einem Land wohnen, in das auch Bestellungen verschifft werden
 SELECT *
 FROM Customers
 WHERE Country IN(SELECT DISTINCT ShipCountry FROM Orders)



 -- Gib die SupplierID, den CompanyName, die Kontaktinformation und das Land aller Supplier aus, die aus dem gleichen Land sind wie der Supplier Nr. 2.
SELECT SupplierID
		, CompanyName
		, ContactName
		, Phone
		, Country
FROM Suppliers
WHERE Country = (SELECT Country FROM Suppliers WHERE SupplierID = 2)


-- Gib die Namen und das Einstellungsdatum der Mitarbeiter aus, die im selben Jahr eingestellt wurden wie Mr. Robert King.
--Titel, Vorname und Nachname sollen überprüft werden.
--Uhrzeit soll nicht mit ausgegeben werden

-- wann ist denn Robert King eingestellt worden?
SELECT YEAR(HireDate) FROM Employees WHERE FirstName = 'Robert' AND LastName = 'King' AND TitleOfCourtesy = 'Mr.'

-- wie bekomme ich alle Angestellten, die in einem bestimmten Jahr eingestellt worden sind?
SELECT *
FROM Employees
WHERE YEAR(HireDate) = 1994

-->
SELECT *
FROM Employees
WHERE YEAR(HireDate) = (SELECT YEAR(HireDate) FROM Employees WHERE FirstName = 'Robert' AND LastName = 'King' AND TitleOfCourtesy = 'Mr.')

-->
SELECT	  FirstName
		, LastName
		, FORMAT(HireDate, 'd', 'de-de') AS HireDate
FROM Employees
WHERE YEAR(HireDate) = (SELECT YEAR(HireDate) FROM Employees WHERE FirstName = 'Robert' AND LastName = 'King' AND TitleOfCourtesy = 'Mr.')

-->
SELECT	  CONCAT(FirstName, ' ', LastName) AS EmployeeName
		, FORMAT(HireDate, 'd', 'de-de') AS HireDate
FROM Employees
WHERE YEAR(HireDate) = (SELECT YEAR(HireDate) FROM Employees WHERE FirstName = 'Robert' AND LastName = 'King' AND TitleOfCourtesy = 'Mr.')

-- ohne Robert King:
SELECT	  CONCAT(FirstName, ' ', LastName) AS EmployeeName
		, FORMAT(HireDate, 'd', 'de-de') AS HireDate
FROM Employees
WHERE YEAR(HireDate) = (SELECT YEAR(HireDate) FROM Employees WHERE FirstName = 'Robert' AND LastName = 'King' AND TitleOfCourtesy = 'Mr.') AND EmployeeID != 7





