-- MAXDOP
-- maximal degree of parallelism


set statistics io, time on

SELECT ShipCountry, SUM(UnitPrice*Quantity)
FROM Orders o INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY ShipCountry


