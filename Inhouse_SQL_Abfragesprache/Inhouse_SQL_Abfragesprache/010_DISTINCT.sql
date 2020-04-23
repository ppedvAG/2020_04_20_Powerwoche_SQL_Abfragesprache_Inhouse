-- DISTINCT

-- wie bekomme ich alle L�nder, in die geliefert wird (in denen wir Kunden haben)?
SELECT Country
FROM Customers
-- da kommen alle Kunden raus, also L�nder stehen mehrfach da

-- L�sung:
SELECT DISTINCT Country
FROM Customers


-- mehrere Spalten?
SELECT DISTINCT Country, CustomerID
FROM Customers
-- das bringt nix, jetzt haben wir wieder alle Kunden
-- DISTINCT bezieht sich auf alle ausgew�hlten Spalten
-- wenn wir ein eindeutiges Feld wie bei CustomerID haben, dann k�nnen wir da keine Mehrfacheintr�ge weglassen, weil es keine gibt - somit m�ssen wir auch das Land mehrfach anschreiben, obwohl davor ein DISTINCT steht


SELECT DISTINCT Country, City
FROM Customers
-- 69 Treffer; so viele, wie es Cities gibt



SELECT DISTINCT Country, Region
FROM Customers
-- 34 Treffer - so viele, wie es Regionen gibt

-- zum �berpr�fen
SELECT *
FROM Customers
ORDER BY Country


-- Liste von allen St�dten, in denen wir Kunden haben?
SELECT DISTINCT City
FROM Customers


-- Liste von allen L�ndern, in denen Angestellte wohnen?
SELECT DISTINCT Country
FROM Employees
-- USA, UK


-- zur Kontrolle:
SELECT *
FROM Employees
ORDER BY Country
-- ja stimmt, es gibt tats�chlich nur Angestellte in USA und UK

