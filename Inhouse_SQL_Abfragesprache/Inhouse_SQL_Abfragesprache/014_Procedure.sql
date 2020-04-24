-- Procedure (Prozedur)

CREATE PROC pDemo
AS
SELECT TOP 1 * FROM Orders ORDER BY Freight
SELECT TOP 3 Freight FROM Orders WHERE Freight < 30
SELECT Country FROM Customers

EXEC pDemo



CREATE PROC pAllCustomers5 @City varchar(30)
AS
SELECT * FROM Customers WHERE City = @City


EXEC pAllCustomers5 @City = 'Buenos Aires'



CREATE PROC pAllCustomersCountryCity @City varchar(30), @Country varchar(30)
AS
SELECT * FROM Customers WHERE City = @City AND Country = @Country


EXEC pAllCustomersCountryCity @City = 'Buenos Aires', @Country = 'Argentina'

