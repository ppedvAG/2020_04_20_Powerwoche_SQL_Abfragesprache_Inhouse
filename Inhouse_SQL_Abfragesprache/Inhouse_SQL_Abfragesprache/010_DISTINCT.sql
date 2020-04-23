-- DISTINCT

-- wie bekomme ich alle Länder, in die geliefert wird (in denen wir Kunden haben)?
SELECT Country
FROM Customers
-- da kommen alle Kunden raus, also Länder stehen mehrfach da

-- Lösung:
SELECT DISTINCT Country
FROM Customers


-- mehrere Spalten?
SELECT DISTINCT Country, CustomerID
FROM Customers
-- das bringt nix, jetzt haben wir wieder alle Kunden
-- DISTINCT bezieht sich auf alle ausgewählten Spalten
-- wenn wir ein eindeutiges Feld wie bei CustomerID haben, dann können wir da keine Mehrfacheinträge weglassen, weil es keine gibt - somit müssen wir auch das Land mehrfach anschreiben, obwohl davor ein DISTINCT steht


SELECT DISTINCT Country, City
FROM Customers
-- 69 Treffer; so viele, wie es Cities gibt



SELECT DISTINCT Country, Region
FROM Customers
-- 34 Treffer - so viele, wie es Regionen gibt

-- zum Überprüfen
SELECT *
FROM Customers
ORDER BY Country


-- Liste von allen Städten, in denen wir Kunden haben?
SELECT DISTINCT City
FROM Customers


-- Liste von allen Ländern, in denen Angestellte wohnen?
SELECT DISTINCT Country
FROM Employees
-- USA, UK


-- zur Kontrolle:
SELECT *
FROM Employees
ORDER BY Country
-- ja stimmt, es gibt tatsächlich nur Angestellte in USA und UK

