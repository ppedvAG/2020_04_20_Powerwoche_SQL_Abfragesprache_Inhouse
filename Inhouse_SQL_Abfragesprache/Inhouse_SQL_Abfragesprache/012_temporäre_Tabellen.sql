-- temporäre Tabellen
-- temporary tables

/*
	-- lokale temporäre Tabellen
	-- existiert nur in der aktuellen Session


	-- globale temporäre Tabellen
	-- Zugriff auch aus anderen Sessions



	-- Lebensdauer: hält nur so lange, wie die Verbindung (Session) besteht
	-- kann auch gelöscht werden

*/

-- lokale temporäre Tabelle
SELECT CustomerID, Freight
INTO #t1
FROM Orders



SELECT *
FROM #t1



-- globale temporäre Tabelle
SELECT CustomerID, EmployeeID, OrderDate
INTO ##t2
FROM Orders

SELECT *
FROM ##t2
