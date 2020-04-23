-- häufig verwendete Datentypen

-- Stringdatentypen
/*
	char(n) - fixe Anzahl Zeichen
	varchar(n) - variable Anzahl Zeichen
	nchar(n) -- wie char aber Unicode
	nvarchar(n) -- wie varchar aber Unicode
*/

-- numerische Datentypen
/*
	bit - 0, 1, NULL
	int - ganze Zahlen (mit verschiedenen Variationen (tinyint, smallint, bigint))
	float - Nachkommastellen
	decimal(n,m) - n = wieviele Stellen insgesamt, m = wieviele nach Komma
	decimal(10,2) = 12345678,90 (insgesamt 10, 2 Nachkommastellen, 8 vor dem Komma)
	money - auf 4 Nachkommastellen genau
*/

-- Datumsdatentypen
/*
	datetime - auf mehrere ms genau
	datetime2 - auf mehrere ns genau
	date - nur Datum
	time - nur Zeit
*/