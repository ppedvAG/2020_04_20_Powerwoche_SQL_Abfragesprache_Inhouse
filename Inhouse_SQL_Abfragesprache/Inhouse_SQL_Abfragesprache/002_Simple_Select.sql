-- SIMPLE SELECT, einfache Abfragen


/*
	
	Text, Zahlen, Berechnungen

*/


USE Northwind

-- Zahl ausgeben
SELECT 100

-- Text ausgeben
SELECT 'Testtext'

-- Berechnungen:
SELECT 100*3 -- 300


-- Achtung: das ist Text, keine Berechnung mehr
SELECT '100*3'


-- mehrere Spalten:
SELECT 100, 'Testtext', 'mehr Text'



-- Spaltenüberschrift:
-- ALIAS
SELECT 100 AS Zahl

-- man darf das AS auch weglassen
SELECT 100 Zahl
-- Empfehlung: AS im SELECT immer hinschreiben!!


-- Copy with Headers
-- im Resultfenster Rechtsklick, dann kann man auch die Spaltenüberschriften kopieren


-- FORMAT?
SELECT	  100,
		'Testtext', -- Achtung: Fehlermeldung, Problem: Komma
--		'mehr Text'


-- bisschen schönere Schreibweise:
SELECT	  100 -- dieser Fehler bezieht sich noch auf das Komma oben
		, 'Testtext'
--		, 'mehr Text'


-- Übung:
SELECT	  100 AS Zahl
		, 'Donaudampfschifffahrtsgesellschaft' AS Text
		, 400/2 AS Rechnung