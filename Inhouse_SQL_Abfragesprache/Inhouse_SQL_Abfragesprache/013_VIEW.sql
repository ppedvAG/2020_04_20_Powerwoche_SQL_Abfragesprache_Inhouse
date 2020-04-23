-- VIEWS (Sichten)



CREATE VIEW vCustomerContacts5
AS
SELECT    CustomerID
		, CompanyName
		, ContactName
		, Phone
FROM Customers



CREATE VIEW vFrachtkosten
AS
SELECT	  c.CustomerID
		, c.CompanyName
		, o.OrderID
		, Freight
--		, ...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID


