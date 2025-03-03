USE northwind;

SELECT MIN(UnitPrice) AS lowestPrice, MAX(UnitPrice) AS highestPrice
FROM products;
-- no vemos el nombre del producto

SELECT COUNT(ProductID), ROUND(AVG(UnitPrice), 2)
FROM products;
-- round con paréntesis y el 2 es para limitar el num de decimales)

SELECT MIN(Freight), MAX(Freight)
FROM orders
WHERE ShipCountry = 'UK';

SELECT ROUND(AVG(UnitPrice), 2)
FROM products;

SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice > 28.87;

SELECT COUNT(ProductName)
FROM products
WHERE Discontinued = 1;
-- El atributo Discontinued es un booleano: si es igual a 1 el producto ha sido descontinuado.

SELECT ProductID, ProductName
FROM products
WHERE Discontinued = 1
LIMIT 10;

SELECT COUNT(OrderID), MAX(Freight), EmployeeID
FROM orders
GROUP BY EmployeeID;

SELECT COUNT(OrderID), MAX(Freight), EmployeeID
FROM orders
WHERE ShippedDate IS NOT NULL
GROUP BY EmployeeID;

-- Nos hemos quedado por el bonus
