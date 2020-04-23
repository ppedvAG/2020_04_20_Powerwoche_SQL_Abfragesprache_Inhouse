-- Aggregatfunktionen
-- aggregate functions

-- COUNT
-- SUM
-- AVG
-- MIN
-- MAX

-- In wie vielen L�ndern haben wir Kunden?
SELECT Country
FROM Customers
-- damit bekommen wir auch doppelte Eintr�ge (alle Kunden)


-- mit DISTINCT
SELECT DISTINCT Country
FROM Customers
-- damit bekommen wir so viele Zeilen zur�ck, wie wir unterschiedliche L�nder haben


-- mit COUNT!!
SELECT COUNT(Country)
FROM Customers
-- oje, wir bekommen wieder 91 heraus (so viele, wie es Kunden gibt)

-- kombiniert mit DISTINCT, dann bekommen wir die Anzahl der L�nder, in denen wir Kunden haben
SELECT COUNT(DISTINCT Country)
FROM Customers


-- wenn es keine doppelten Eintr�ge gibt, z.B. bei einer ID, dann brauchen wir kein Distinct
SELECT COUNT(*)
FROM Products
-- oder:
SELECT COUNT(ProductID) AS [Anzahl Produkte]
FROM Products

-- Durchschnittswert: AVG
SELECT AVG(UnitPrice) AS [durschnittlicher St�ckpreis]
FROM Products

-- Summe bilden: SUM
SELECT SUM(Freight) AS [Summe aller Frachtkosten]
FROM Orders
-- das gibt die Summe aller Frachtkosten von ALLEN Bestellungen aus


-- Summe PRO ...?
SELECT SUM(Freight), CustomerID
FROM Orders
GROUP BY CustomerID


-- das bringt nix!
SELECT SUM(Freight), CustomerID, OrderID
FROM Orders
GROUP BY CustomerID, OrderID
-- das sind wieder alle Bestellungen, die Summe der Frachtkosten pro Bestellung sind wieder genau die Frachtkosten


-- das geht:
SELECT SUM(Freight), ShipCountry, ShipCity
FROM Orders
GROUP BY ShipCountry, ShipCity
-- Summe der Frachtkosten pro Stadt



-- durchschnittliche Frachtkosten pro Fr�chter
SELECT AVG(Freight), ShipVia
FROM Orders
GROUP BY ShipVia

-- k�nnen wir mit ORDER BY kombinieren:
SELECT AVG(Freight), ShipVia
FROM Orders
GROUP BY ShipVia
ORDER BY ShipVia


-- kleinster Wert, gr��ter Wert
SELECT MIN(UnitPrice)
FROM Products

SELECT MAX(UnitPrice)
FROM Products

