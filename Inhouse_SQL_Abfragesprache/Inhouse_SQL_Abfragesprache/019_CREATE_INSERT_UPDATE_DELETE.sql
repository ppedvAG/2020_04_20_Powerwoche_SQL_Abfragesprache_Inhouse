-- CREATE, INSERT, UPDATE, DELETE
-- Erstellen von Tabellen und Ver�ndern von Werten


--SELECT *
--FROM Customers


-- DB erstellen
CREATE DATABASE MyTestDB7

-- DROP DATABASE MyTestDB7
-- ACHTUNG: Damit w�rde die gesamte DB inklusive Inhalt unwiederbringlich gel�scht!

USE MyTestDB7

-- Tabellen erstellen
-- CREATE TABLE tablename (columnname datatype)

CREATE TABLE Produkte 
	(
		ProduktID smallint identity(10000, 1),
		ProduktName varchar(50),
		Preis money
--		...
--      ...
	)

-- Tabelle inklusive Inhalt l�schen:
-- DROP TABLE Produkte
-- Achtung! Die Tabelle ist unwiederbringlich gel�scht!!!


-- Daten einf�gen in Tabelle
INSERT INTO Produkte (ProduktName, Preis)
	VALUES ('Spaghetti', 1.99)


-- wichtig: Spaltenreihenfolge angeben!
INSERT INTO Produkte (Preis, ProduktName)
	VALUES (4.99, 'Tartufo')



INSERT INTO Produkte (ProduktName, Preis)
	VALUES  ('Tiramisu', 4.89),
			('Penne', 1.89),
			('Tagliatelle', 2.10),
			('Profiterols', 5.29),
			('Carbonara', 2.99),
			('Arrabiata', 1.79)



-- DROP bedeutet: komplette Tabelle inklusive Inhalt l�schen
-- DELETE FROM tablename bedeutet: kompletten Inhalt der Tabelle l�schen, Tabelle selbst ist aber noch da
DELETE FROM Produkte


-- DELETE immer mit WHERE kombinieren!!!!
DELETE FROM Produkte
WHERE ProduktID = 10008


INSERT INTO Produkte (ProduktName, Preis)
	VALUES ('Risotto Funghi', 5.69)





-- Werte ver�ndern mit UPDATE
-- immer mit WHERE einschr�nken! sonst wird der Preis bei ALLEN gesetzt!
UPDATE Produkte
SET Preis = 1.59
WHERE ProduktID = 10003




-- an der Tabelle etwas ver�ndern mit ALTER
ALTER TABLE Produkte
ALTER COLUMN ProduktName varchar(255)


-- neue Spalte hinzuf�gen
ALTER TABLE Produkte
ADD AnzahlLagernd smallint


-- uups, Fehler:
ALTER TABLE Produkte
ADD Email nvarchar(50)
-- Spalte wieder wegl�schen:
ALTER TABLE Produkte
DROP COLUMN Email



-- Tabellen miteinander verkn�pfen
-- Keys (Schl�ssel)
-- Primary Key (Hauptschl�ssel)
-- Foreign Key (Fremdschl�ssel)

CREATE TABLE Kunden
	(
		KundenID int identity(1000, 1) PRIMARY KEY,
		Firmenname varchar(50) NOT NULL,
		Kontaktperson varchar(50)
--		...
--		...
	)


CREATE TABLE Bestellungen
	(
		BestellNr int identity(1000, 1) PRIMARY KEY,
		KundenID int,
		Bestelldatum date,
--		...
--		...
	)


-- FOREIGN KEYS angeben:
-- M�glichkeit 1:
CREATE TABLE Bestellungen
	(
		BestellNr int identity(1000, 1) PRIMARY KEY,
		KundenID int FOREIGN KEY REFERENCES Kunden (KundenID),
		Bestelldatum date,
--		...
--		...
	)
-- Vorsicht: funktioniert nur, wenn es die Kundentabelle schon gibt


-- M�glichkeit 2:
CREATE TABLE Bestellungen
	(
		BestellNr int identity(1000, 1) PRIMARY KEY,
		KundenID int,
		Bestelldatum date,
--		...
--		...
		CONSTRAINT FK_Bestellungen_Kunden FOREIGN KEY (KundenID) REFERENCES Kunden(KundenID)
	)


-- M�glichkeit 3:
-- erst Tabelle erstellen
CREATE TABLE Bestellungen
	(
		BestellNr int identity(1000, 1) PRIMARY KEY,
		KundenID int,
		Bestelldatum date,
--		...
--		...
	)
-- nachtr�glich Foreign Key �ber Constraint erstellen:
ALTER TABLE Bestellungen
ADD CONSTRAINT FK_Bestellungen_Kunden FOREIGN KEY (KundenID) REFERENCES Kunden(KundenID)




SELECT *
FROM Kunden k INNER JOIN Bestellungen b ON k.KundenID = b.KundenID




SELECT *
FROM Produkte