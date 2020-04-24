-- Index
-- Indizes, Indices, Indexe
-- indexes (engl)

-- genau 1 clustered Index pro Tabelle
-- 999 non-clustered Indizes pro Tabelle möglich

-- Unterarten von non-clustered Indizes
-- unique index (eindeutiger Index) - eine Spalte eindeutiger Wert
-- gefilterter Index (filtered index) - z.B. nur Kunden aus Deutschland
-- zusammengesetzer Index (mehrere, max 16 Spalten) (multicolumn index)
-- Index mit eingeschlossenen Spalten (included columns)
-- abdeckender Index (covering index)  - wenn alle Spalten in der Abfrage vom Index abgedeckt werden
-- Columnstore Index -- für Big Data (Data Warehouse); oder für Archivdaten, wo sich nix mehr ändert


-- clustered index
CREATE CLUSTERED INDEX IX_Produkte
ON Produkte (ProduktID)

-- non-clustered index (multicolumn index)
CREATE NONCLUSTERED INDEX IX_Preis_ProduktName
ON Produkte(Preis, ProduktName)