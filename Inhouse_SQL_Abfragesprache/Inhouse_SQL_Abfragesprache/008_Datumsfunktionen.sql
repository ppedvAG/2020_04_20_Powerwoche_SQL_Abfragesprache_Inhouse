-- Datumsfunktionen


/*
	Intervalle:

	year, yyyy, yy = Jahr
	quarter, qq, q = Quartal
	month, MM, M = Monat
	week, ww, wk = Woche
	day, dd, d = Tag
	minute, mi, n = Minute
	millisecond, ms = Millisekunde
	nanosecond, ns = Nanosekunde

	weekday, dw, w = Wochentag
	dayofyear, dy, y = Jahrestag


*/

-- ************************ Datum abfragen *************************

-- Datentyp datetime, auf 3-4 Millisekunden genau; 8 byte
SELECT GETDATE()

-- auf mehrere Nanosekunden genau; Datentyp datetime2; 6-8 byte
SELECT SYSDATETIME()


-- **************** Datumsberechnungen *****************************
-- DATEADD

-- wenn nicht Uhrzeit angegeben, gehen wir von 0:00 Uhr aus
SELECT DATEADD(hh, 10, '2020-04-22')

-- wir können auch eine Uhrzeit angeben
SELECT DATEADD(hh, 10, '2020-04-22 13:49')

-- wir können auch Sekunden, ms, usw angeben
SELECT DATEADD(hh, 10, '2020-04-22 13:49:15:456')
-- (Sinn?)

-- wir können das mit der jeweils aktuellen Uhrzeit kombinieren
SELECT DATEADD(hh, 10, SYSDATETIME())


-- negative Werte sind zulässig:
SELECT DATEADD(hh, -10, '2020-04-22') -- 2020-04-21 14:00:00.000
-- hier sind wir dann am Vortag - wir haben keine Uhrzeit angegeben, also 0:00 Uhr - 10 Stunden


-- ******************************* DATEDIFF *************************
-- Differenz zwischen zwei Daten bilden

-- wann ist der nächste Feiertag?
SELECT DATEDIFF(dd, '2020-04-22', '2020-05-01') -- 9 Tage bis dahin

SELECT DATEDIFF(dd, '2020-05-01', '2020-04-22') -- -9 (negatives Vorzeichen)

-- mit aktuellem Datum:
SELECT DATEDIFF(dd, SYSDATETIME(), '2020-05-01')


-- ******************** DATEPART ****************************************
-- einzelne Datumsteile ausgeben

SELECT DATEPART(dd, '2020-04-22') -- 22

-- Monat funktioniert hier auch mit Kleinbuchstaben, aber idealerweise gleich angewöhnen, MM immer großzuschreiben
SELECT DATEPART(MM, '2020-04-22') -- 4

-- in welchem Quartal liegt...?
SELECT DATEPART(qq, '2020-04-22')


-- *************************** DATENAME **************************

-- macht eigentlich nur mit zwei Intervallen Sinn (dw, MM)

-- bringt nicht viel:
SELECT DATENAME(dd, '2020-04-22') -- 22



SELECT DATENAME(dw, '2020-04-22') -- Wednesday

SELECT DATENAME(month, '2020-04-22') -- April




-- ************************************************ Übungen:
-- Welches Datum haben wir in 38 Tagen?
SELECT DATEADD(dd, 38, '2020-04-22')
SELECT DATEADD(dd, 38, GETDATE())


-- Welcher Wochentag war Dein Geburtstag?
SELECT DATENAME(dw, '1980-06-19')


-- Vor wie vielen Jahren kam der erste Star Wars Film in die Kinos? (25. Mai 1977 )
SELECT DATEDIFF(yy, GETDATE(), '1977-05-25') -- -43

SELECT DATEDIFF(yy, '1977-05-25', GETDATE()) -- 43


SELECT DATEDIFF(yy, '1977-05-25', '2020-04-22')

SELECT DATEDIFF(yy, '1977', '2020')
SELECT DATEDIFF(yy, '1977', GETDATE())


-- In welchem Quartal liegt der österreichische Nationalfeiertag (26.10.)?
SELECT DATENAME(qq, '2020-10-26') -- 4
SELECT DATEPART(qq, '2020-10-26') -- 4


-- Gib Tag, Monat und Jahr Deines Geburtstages in einer eigenen Spalte mit der jeweils entsprechenden Überschrift an:

-- Tag	 Monat	 Jahr
--  22	  04	 1981

SELECT    DATEPART(dd, '1980-01-31') AS Tag
		, DATEPART(MM, '1980-01-31') AS Monat
		, DATEPART (yyyy, '1980-01-31') AS Jahr

-- oder:
SELECT DAY('2020-04-22') AS Tag
	, MONTH('2020-04-22') AS Monat
	, YEAR('2020-04-22') AS Jahr


-- ************************* DAY, MONTH, YEAR *************************
-- gleiches Ergebnis wie mit DATEPART dd, MM oder yyyy
-- Rückgabedatentyp Integer
-- 4 byte Speicherplatz

SELECT DAY('2020-04-22')
SELECT MONTH('2020-04-22')
SELECT YEAR('2020-04-22')


-- mit Northwind DB:

-- in welchem Jahr sind meine Angestellten eingestellt worden:

SELECT YEAR(HireDate) AS Einstellungsjahr
FROM Employees

SELECT HireDate
FROM Employees

