-- LIKE und Wildcards

/*
	% ... steht für beliebig viele unbekannte Zeichen (0 - ?)
	[] ... steht für genau 1 Zeichen aus einem bestimmten Wertebereich
			... funktioniert auch mit Sonderzeichen
			... funktioniert auch für von - bis 
	| ... ODER innerhalb der []
	^ ... NICHT innerhalb der []
	_ ... genau 1 unbekanntes Zeichen



*/


/*
	gesucht wird a%
	Treffer:
	a
	axxx
	aaaaxxxxxxxxxxxxxxxxxxxxxxx


	gesucht wird a_
	Treffer:
	ax
	aa
	au


*/


-- alle Kunden, wo die CustomerID mit ALF beginnt
SELECT *
FROM Customers
WHERE CustomerID LIKE 'ALF%'


-- endet mit... mi
SELECT *
FROM Customers
WHERE CustomerID LIKE '%MI'

-- enthält ... kist
SELECT *
FROM Customers
WHERE CompanyName LIKE '%kist%'



-- alle Kunden, die mit D beginnen
SELECT *
FROM Customers
WHERE CustomerID LIKE 'D%'


-- alle, die mit D enden
SELECT *
FROM Customers
WHERE CustomerID LIKE '%D'

-- alle, die ein d enthalten
SELECT *
FROM Customers
WHERE CustomerID LIKE '%D%'


-- alle Produkte, die mit "coffee" enden
SELECT *
FROM Products
WHERE ProductName LIKE '%coffee'


-- alle Produkte die "ost" im Namen haben
SELECT	  ProductID
		, ProductName
FROM Products
WHERE ProductName LIKE '%ost%'
ORDER BY ProductID ASC -- ascending, in aufsteigender Reihenfolge, vom kleinsten zum größten Wert - DEFAULT


SELECT	  ProductID
		, ProductName
FROM Products
WHERE ProductName LIKE '%ost%'
ORDER BY ProductID DESC -- descending (in absteigender Reihenfolge - vom größten zum kleinsten Wert)


-- Gib alle Produkte aus, die vom Anbieter (SupplierID) 5, 10 oder 15 stammen, von denen mehr als 10 Stück vorrätig sind und deren Stückpreis unter 100 liegt.
-- Ordne das Ergebnis absteigend vom höchsten zum niedrigsten Stückpreis.
SELECT *
FROM Products
WHERE SupplierID IN(5, 10, 15)
	AND UnitsInStock > 10
	AND UnitPrice < 100
ORDER BY UnitPrice DESC


-- alle Kunden, die ein d im Firmennamen haben und mit e enden
SELECT *
FROM Customers
WHERE CompanyName LIKE '%d%' AND CompanyName LIKE '%e'

-- bisschen kürzer:
SELECT *
FROM Customers
WHERE CompanyName LIKE '%d%e'


-- alle, die mit a beginnen, ein f im Namen haben und aus Deutschland sind
SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%f%' AND Country = 'Germany'


-- alle Bestellungen von Angestellten 1, 3, 5 bearbeitet
-- wo Kunde mit r beginnt
-- und wo Frachtkosten größer als 100 sind

SELECT *
FROM Orders
WHERE EmployeeID IN(1, 3, 5)
	AND CustomerID LIKE 'r%'
	AND Freight > 100



-- Firmenname beginnt entweder mit a oder mit c
SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%'
		OR CompanyName LIKE 'c%'


-- ODER:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[ac]%'




-- alle, deren Firmenname mit a-c beginnt
SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c]%'


-- Suche nach Sonderzeichen geht auch mit eckigen Klammern
SELECT *
FROM Customers
WHERE CompanyName LIKE '%[%]%'


-- andere Schreibweise für Suche nach Sonderzeichen: ESCAPE
SELECT *
FROM Customers
WHERE CompanyName LIKE '%!%%' ESCAPE '!'

SELECT *
FROM Customers
WHERE CompanyName LIKE '%!/%' ESCAPE '!'

SELECT *
FROM Customers
WHERE CompanyName LIKE '%?.%' ESCAPE '?'


SELECT *
FROM Customers
WHERE CompanyName LIKE '%$ö%' ESCAPE '$'



SELECT *
FROM Customers
WHERE CompanyName LIKE '%[/]%'


-- Suche nach Hochkomma
SELECT *
FROM Customers
WHERE CompanyName LIKE '%''%' -- Achtung: Ausnahme!


-- alle, die mit a-c oder e-g enden
-- entweder so:
SELECT *
FROM Customers
WHERE CompanyName LIKE '%[a-c]' OR CompanyName LIKE '%[e-g]'

-- oder so:
SELECT *
FROM Customers
WHERE CompanyName LIKE '%[a-c | e-g]'


-- soll NICHT mit a-c beginnen
SELECT *
FROM Customers
WHERE CompanyName LIKE '[^a-c]%'


SELECT *
FROM Customers
WHERE Phone LIKE '(5) 555-472_'


-- Alle Produkte, deren Name mit d, e, f, g, h, i, j, k oder l beginnt
-- und mit a, b, c, d oder m, n, o endet
-- Möglichkeit 1
SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%' AND ProductName LIKE '%[a-d | m-o]'

-- Möglichkeit 2 (kürzeste Variante)
SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%[a-d | m-o]'


-- Möglichkeit 3 (längste Variante)
SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%' AND (ProductName LIKE '%[a-d]' OR ProductName LIKE '%[m-o]')



-- alle Kunden, die mit d, e oder f beginnen
-- wo der letzte Buchstabe ein L ist
-- und der drittletzte Buchstabe ein d ist
SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-f]%' AND CompanyName LIKE '%d_l'

-- oder ein bisschen kürzer:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-f]%d_l'


/*
	mögliche Treffer:

	ddxl
	edel
	fidel
	fxxxxxxxxxxxxxdxl


	Ernst Handel (Northwind DB)
	E........d.l  

*/


-- unsere CustomerID besteht immer aus genau 5 BUCHSTABEN
-- angenommen, es ist ein Fehler passiert
-- ALFK5
-- wie finden wir die falschen Einträge?



-- wie finde ich die richtigen Einträge?
SELECT *
FROM Customers
WHERE CustomerID LIKE '[a-z][a-z][a-z][a-z][a-z]'

-- oder so:
SELECT *
FROM Customers
WHERE CustomerID LIKE REPLICATE('[a-z]', 5)



-- die falschen Einträge:
SELECT *
FROM Customers
WHERE CustomerID NOT LIKE '[a-z][a-z][a-z][a-z][a-z]'















