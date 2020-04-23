-- tempor�re Tabellen
-- temporary tables

/*
	-- lokale tempor�re Tabellen
	-- existiert nur in der aktuellen Session


	-- globale tempor�re Tabellen
	-- Zugriff auch aus anderen Sessions



	-- Lebensdauer: h�lt nur so lange, wie die Verbindung (Session) besteht
	-- kann auch gel�scht werden

*/

-- lokale tempor�re Tabelle
SELECT CustomerID, Freight
INTO #t1
FROM Orders



SELECT *
FROM #t1



-- globale tempor�re Tabelle
SELECT CustomerID, EmployeeID, OrderDate
INTO ##t2
FROM Orders

SELECT *
FROM ##t2
