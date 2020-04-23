-- WH 2

SELECT *
FROM Customers
WHERE Country IN('Germany', 'Austria')


SELECT *
FROM Products
WHERE ProductID BETWEEN 10 AND 15


SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c]%'


SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%' OR CompanyName LIKE 'c%'
-- oder:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[ac]%'


-- beginnt mit a, b, c, e, f oder g (kein d)
SELECT *
FROM Customers
WHERE CompanyName LIKE '[a]%[b]%[c]%[e]%[f]%[g]%'

/*
	damit würden wir folgende Treffer bekommen:

	abcefg
	axbxcxexfxgx
	axxxxbcxxxxexfxxxxxg

*/

SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c]%' OR CompanyName LIKE '[e-g]%'
-- oder:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c|e-g]%'


-- mit a-c beginnen und mit e-g enden:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c]%[e-g]'


-- letzte zwei Stellen der Telefonnummer sind unbekannt (z.B. eine Durchwahl)
SELECT *
FROM Customers
WHERE Phone LIKE '0621-084__' -- (zwei Unterstriche)



-- JOINS

SELECT	  CompanyName
		, OrderID
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID



SELECT	  c.CompanyName
		, o.OrderID
		, c.CustomerID
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID

-- mehrere Tabellen miteinander verknüpfen:
SELECT	  c.CompanyName
		, o.OrderID
		, c.CustomerID
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 
