-- CAST, CONVERT und FORMAT


-- ************************ CAST: Umwandeln von Datentypen *********************

-- funktioniert:
SELECT '123' + 3

-- funktioniert nicht:
SELECT '123.3' + 3
-- Conversion failed when converting the varchar value '123.3' to data type int.


-- funktioniert: 
SELECT CAST('123.3' AS float) + 3 -- 126,3


/*
	Microsoft-Dokumentation implizite/explizite Konvertierung:
	https://docs.microsoft.com/de-de/sql/t-sql/data-types/data-type-conversion-database-engine?view=sql-server-ver15
*/


-- funktioniert auch mit Datum, ABER rein mit CAST haben wir keinen Einfluss auf das Format
SELECT CAST(SYSDATETIME() AS varchar)

-- VORSICHT:
-- geht sich die Anzahl an Zeichen noch aus?
SELECT CAST(SYSDATETIME() AS varchar(3)) -- 202 (erste drei Stellen vom Jahr) -- macht keinen Sinn!!

-- mit Abfrage aus DB (auch damit kein Einfluss auf Ausgabeformat):
SELECT CAST(BirthDate AS varchar(11))
FROM Employees

-- macht etwas mehr Sinn:
SELECT CAST(BirthDate AS date)
FROM Employees



-- VORSICHT: umgekehrt kann es Probleme geben:
SELECT CAST('2020-04-22' AS date) -- was ist Tag, was Monat? Systemabhängig!

SELECT CAST('22.04.2020' AS date)
-- Conversion failed when converting date and/or time from character string.


-- **************************** CONVERT ***********************************
-- auch mit CONVERT werden, wie der Name schon sagt, Datentypen konvertiert; allerdings können wir hier auch einen sogenannten STYLE-Parameter eingeben

-- Syntax:
-- 1 in welchen Datentyp soll umgewandelt werden
-- 2 was soll umgewandelt werden
-- 3 wie soll es aussehen

-- SELECT CONVERT(data_type[(length)], expression[, style] )



-- funktioniert, aber Sinn?
SELECT CONVERT(varchar(10), 123456.9)

-- wie oben beim CAST, aber andere Funktion
SELECT CONVERT(float, '123.3')+3


-- funktioniert auch mit Datum:
SELECT CONVERT(varchar, SYSDATETIME())


-- wieder aufpassen mit Länge:
SELECT CONVERT(varchar(3), SYSDATETIME()) -- sinnlos

-- über den Style-Parameter geben wir das Format an, in dem die Datumsangabe erfolgen soll
SELECT CONVERT(varchar, SYSDATETIME(), 4) -- nur letzte zwei Stellen von Jahreszahl
SELECT CONVERT(varchar, SYSDATETIME(), 104) -- Jahreszahl vierstellig


-- unterschiedliche Regionen:
SELECT    CONVERT(varchar, SYSDATETIME(), 104) AS DE
		, CONVERT(varchar, SYSDATETIME(), 101) AS US
		, CONVERT(varchar, SYSDATETIME(), 103) AS GB


/*
	Microsoft-Dokumentation Styles:
	https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles
*/


-- mit Datenbankabfrage:
SELECT    CONVERT(varchar, BirthDate, 104)
		, LastName
FROM Employees



-- *************************** FORMAT *****************************
-- Ausgabe-Datentyp ist nvarchar

SELECT FORMAT(1234567890, '###-###/##-##') -- 123-456/78-90

SELECT FORMAT(431234567890, '+' + '##/### ## ## ###') -- +43/123 45 67 890


-- geht auch mit Datum:
SELECT FORMAT(GETDATE(), 'dd.MM.yyyy')-- ACHTUNG: MM groß schreiben!! Sonst Minute!!


SELECT FORMAT(GETDATE(), 'MM*yyyy*dd') -- funktioniert... Sinn?


-- Fehlermeldung:
SELECT FORMAT('2020-04-22', 'dd.MM.yyyy')
-- Argument data type varchar is invalid for argument 1 of format function.


-- wenn wir die Info aus der DB holen, funktioniert es:
SELECT FORMAT(BirthDate, 'dd.MM.yyyy')
FROM Employees



-- mit Culture-Parameter:
SELECT FORMAT(SYSDATETIME(), 'd', 'de-de') -- in dt. Schreibweise
SELECT FORMAT(SYSDATETIME(), 'D', 'de-de') -- mit großem "D" Monat und Tag als Text


SELECT    FORMAT(SYSDATETIME(), 'd', 'de-de') AS DE
		, FORMAT(SYSDATETIME(), 'd', 'en-US') AS US
		, FORMAT(SYSDATETIME(), 'd', 'en-GB') AS GB
		, FORMAT(SYSDATETIME(), 'd', 'sv') AS Schweden



SELECT    FORMAT(SYSDATETIME(), 'D', 'de-de') AS DE
		, FORMAT(SYSDATETIME(), 'D', 'en-US') AS US
		, FORMAT(SYSDATETIME(), 'D', 'en-GB') AS GB
		, FORMAT(SYSDATETIME(), 'D', 'sv') AS Schweden


/*
	Microsoft-Dokumentation: welche Culture-Codes werden unterstützt
	https://docs.microsoft.com/de-de/bingmaps/rest-services/common-parameters-and-types/supported-culture-codes

*/


