-- NULL
-- NICHT die Übersetzung von "Null" (0)
-- NULL heißt, in dem Feld steht (noch) nix drin

-- jede mathematische Operation mit NULL führt wieder zu NULL
-- = NULL funktioniert NICHT!

-- NEIN: xx = NULL, xx != NULL, xx < NULL (macht sowieso keinen Sinn)...
-- Ja: xx IS NULL, xx IS NOT NULL

-- NEIN:
SELECT *
FROM Customers
WHERE Region < 'A' -- faaaaaalsch!


-- NEIN:
SELECT *
FROM Customers
WHERE Region = NULL -- faaaaaalsch!!!
-- wir bekommen keine Fehlermeldung, sondern einfach keine Treffer!!


-- JA:
SELECT *
FROM Customers
WHERE Region IS NULL


-- NULL in der Textausgabe mit anderem Text ersetzen:
SELECT	  CustomerID
		, CompanyName
		, ISNULL(Region, 'unbekannt') AS Region
FROM Customers
-- WHERE Region IS NULL
