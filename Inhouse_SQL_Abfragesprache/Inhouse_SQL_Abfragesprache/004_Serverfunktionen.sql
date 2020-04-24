-- Häufige Serverfunktionen

-- ************************** TRIM, LEN, DATALENGTH ***************************

SELECT 'Test'

SELECT LEN('Test')


SELECT 'Test     '

SELECT LEN('Test     ')

SELECT DATALENGTH('Test     ')


SELECT RTRIM('Test     ')


SELECT DATALENGTH(RTRIM('Test     '))

-- bringt nix, die Leerzeichen rechts werden von LEN ignoriert
SELECT LEN(RTRIM('Test     '))


SELECT	  DATALENGTH(TRIM(FirstName))
		, FirstName
FROM Employees



SELECT	  LEN(TRIM(FirstName))
		, FirstName
FROM Employees

-- RTRIM schneidet Leerzeichen rechts weg
-- LTRIM schneidet Leerzeichen links weg
-- TRIM schneidet Leerzeichen links und rechts weg



-- ******************* REVERSE *****************************************
-- Text in umgekehrter Reihenfolge ausgeben

SELECT REVERSE('REITTIER')
SELECT REVERSE('Trug Tim eine so helle Hose nie mit Gurt?')


-- *********************** Zeichen ausschneiden: LEFT, RIGHT, SUBSTRING ************

-- schneidet die ersten vier Zeichen aus:
SELECT LEFT('Testtext', 4) -- Test


-- schneidet die letzten vier Zeichen aus:
SELECT RIGHT('Testtext', 4) -- text


-- Textausschnitt erstellen mit SUBSTRING
SELECT SUBSTRING('Testtext', 4, 2) -- tt
-- ab welcher Stelle (4)
-- wieviele Zeichen sollen ausgeschnitten werden (2)


-- ******************************* STUFF ************************************
-- Text einfügen

SELECT STUFF('Testtext', 5, 0, '_Hallo_')
-- WO wollen wir etwas einfügen/ersetzen? (Testtext)
-- an welcher Stelle beginnend? (5)
-- wieviele Zeichen wollen wir weglöschen? (0)
-- was soll eingefügt werden? (_Hallo_)


/*
	Angenommen, durch einen Fehler gibt es Leerzeichen in einem String:
'    Test    '
.a) Entferne die Leerzeichen
.b) Gib die Länge des Strings vorher und nachher in einer Tabelle aus:

*/

SELECT LEN('*'+'     Test     '+'*')-2 AS vorher
, LEN(TRIM('     Test     ')) AS nacher

SELECT '*'+'     Test     '+'*'

SELECT LEN('*'+'     Test     '+'*')-2


SELECT DATALENGTH(TRIM('     Test     ')) AS exklLeerzeichen
	  , DATALENGTH('     Test     ') AS inklLeerzeichen


SELECT LEN(TRIM('     Test     ')) AS exklLeerzeichen
		, LEN('     Test     ') AS inklLeerzeichen -- funktioniert nicht, LEN zählt die letzten Leerzeichen nicht mit, nur die vorne



-- ************************* CONCAT ***************************************
-- Strings zusammenfügen

SELECT CONCAT('abc', 'def', 'ghi', 'jkl')

SELECT CONCAT('Ich weiß, ', 'dass ich', ' nichts weiß.') AS Zitat

SELECT CONCAT('James', ' ', 'Bond') AS FullName

-- mit Information aus Datenbank:
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees


SELECT CONCAT(FirstName, ' ', LastName) AS [vollständiger Name]
FROM Employees



-- Die letzten drei Stellen einer Telefonnummer sollen durch xxx ersetzt werden:

-- Möglichkeit 1 
SELECT STUFF('086779889555', 10, 3, 'xxx')
-- geht nur bei gleicher Länge

-- Möglichkeit 2
SELECT LEFT('086779889555', 9)+'xxx'

SELECT CONCAT(LEFT('086779889555', 9), 'xxx')
-- geht nur bei gleicher Länge


-- Möglichkeit 3
SELECT CONCAT(LEFT('086779889555', LEN('086779889555')-3), 'xxx')
-- funktioniert auch unabhängig von der Länge


-- Möglichkeit 4

SELECT REVERSE('086779889555')
-- >
SELECT STUFF(REVERSE('086779889555'), 1, 3, 'xxx')
-- >
SELECT REVERSE(STUFF(REVERSE('086779889555'), 1, 3, 'xxx'))




-- mit Informationen aus der Datenbank
SELECT    Phone
		, CONCAT(SUBSTRING(Phone, 1, LEN(Phone)-3),'***') AS XXX
FROM Customers


-- Möglichkeit 4 mit DB
SELECT REVERSE(STUFF(REVERSE(Phone), 1, 3, 'xxx'))
FROM Customers

-- Möglichkeit 3 mit DB
SELECT CONCAT(LEFT(Phone, LEN(Phone)-3), 'xxx')
FROM Customers


-- ********************** REPLICATE - Zeichen mehrfach ausgeben ********************
-- Zeichen oder Zeichenfolgen mehrfach ausgeben

SELECT REPLICATE('?', 5) -- ?????

SELECT REPLICATE('x', 3) -- xxx

SELECT REPLICATE('abc', 3) -- abcabcabc



-- ************** Groß- oder Kleinbuchstaben *****************************
-- alles in Großbuchstaben ausgeben:
SELECT UPPER(LastName)
FROM Employees


-- alles in Kleinbuchstaben:
SELECT LOWER(LastName)
FROM Employees


-- *********************** REPLACE **************************
-- bestimmte Zeichen ersetzen:

SELECT REPLACE('Hallo!', 'a', 'e')
-- WO möchte ich etwas ersetzen (Hallo!)
-- WAS möchte ich ersetzen (a)
-- WOMIT möchte ich es ersetzen (e)


-- mehr als ein Zeichen ersetzen:
SELECT REPLACE(REPLACE('Hallo!', 'a', 'e'), '!', '?')

SELECT REPLACE(REPLACE(REPLACE('Hallo!', 'a', 'e'), '!', '?'), 'H', 'B')



-- Von der Telefonnummer aus der Customers-Tabelle sollen nur die letzten 3 Zeichen angezeigt werden; alle anderen sollen mit x ersetzt werden. (xxxxxxxxxxxxxxx789)

-- langsam:
-- wie bekomme ich die letzten 3 Zeichen?
SELECT RIGHT(Phone, 3)
FROM Customers

SELECT SUBSTRING(Phone, LEN(Phone)-2, 3)
FROM Customers

-- 2. Parameter ist die STELLE, von der ausgehend wir Zeichen ausschneiden
SELECT SUBSTRING('1234567890', LEN('1234567890')-2, 3)


-- wie ersetze ich die Zeichen davor?
SELECT REPLICATE('x', 7)

SELECT REPLICATE('x', LEN(Phone)-3)
FROM Customers


-- zusammenfügen:
SELECT	  Phone
		, CONCAT(REPLICATE('x', LEN(Phone)-3), SUBSTRING(Phone, LEN(Phone)-2, 3))
FROM Customers



-- ********************** CHARINDEX **********************************
-- an welcher Stelle befindet sich ein gesuchtes Zeichen?

SELECT CHARINDEX('a', 'Hallo') -- 2

-- NICHT casesensitive
SELECT CHARINDEX('A', 'Hallo') -- 2

SELECT CHARINDEX('a', 'Leo') -- 0

SELECT CHARINDEX('$', '450$') -- 4

SELECT CHARINDEX('schnecke', 'Zuckerschnecke') -- 7

-- Zahlen gehen nicht, außer, wenn nicht als numerischer Datentyp
SELECT CHARINDEX(3, 12345) -- Argument data type int is invalid for argument 1 of charindex function.
SELECT CHARINDEX('3', '12345') -- 3


SELECT CHARINDEX(' ', 'James Bond') -- 6

-- CHARINDEX gibt mir die ERSTE Stelle an, an der das gesuchte Zeichen gefunden wird
SELECT CHARINDEX(' ', 'Wolfgang Amadeus Mozart') -- 9


-- Aufgabe: Wie bekomme ich das letzte Leerzeichen?
-- langsam:

SELECT REVERSE('Wolfgang Amadeus Mozart') -- trazoM suedamA gnagfloW

SELECT CHARINDEX(' ', 'trazoM suedamA gnagfloW') -- 7

SELECT LEN('Wolfgang Amadeus Mozart') -- 23

-- 23 - 7 = 16
-- 16 + 1 = Stelle, wo sich das letzte Leerzeichen befindet


SELECT LEN('Wolfgang Amadeus Mozart') - CHARINDEX(' ', 'trazoM suedamA gnagfloW') + 1

SELECT LEN('Wolfgang Amadeus Mozart') - CHARINDEX(' ', REVERSE('Wolfgang Amadeus Mozart')) + 1 -- 17


SELECT LEN('Johann Sebastian Bach') - CHARINDEX(' ', REVERSE('Johann Sebastian Bach')) + 1


SELECT LEN('Georg Friedrich Händel') - CHARINDEX(' ', REVERSE('Georg Friedrich Händel')) + 1 -- 16


SELECT	  CompanyName
		, LEN(CompanyName) - CHARINDEX(' ', REVERSE(CompanyName)) + 1
FROM Customers