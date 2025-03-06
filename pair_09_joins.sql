USE northwind;

/* 1. conocer cuántos pedidos ha realizado cada empresa cliente de UK. Nos
piden el ID del cliente y el nombre de la empresa y el número de pedidos. */
SELECT customers.CustomerID, customers.CompanyName, COUNT(orders.OrderID)
FROM customers 
INNER JOIN orders
ON customers.CustomerID = orders.CustomerID
WHERE country = "UK"
GROUP BY customers.CustomerID;

/* 2. conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. 
Para ello hará falta hacer 2 joins.*/
SELECT customers.CompanyName, year(orders.OrderDate), SUM(orderdetails.Quantity)
FROM customers 
INNER JOIN orders ON customers.CustomerID = orders.CustomerID
INNER JOIN orderdetails ON orders.OrderID = orderdetails.OrderID
WHERE country = "UK"
GROUP BY customers.CompanyName, year(orders.OrderDate);

/* 3. una consulta que indique el nombre de cada compañía cliente junto con cada pedido que han realizado y 
su fecha. */
SELECT  customers.CompanyName, orders.OrderID, orders.OrderDate
FROM customers
INNER JOIN orders
ON customers.CustomerID = orders.CustomerID;

/* 4. lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y 
el nombre del producto, y el total de dinero por el que se ha vendido cada tipo de producto 
(teniendo en cuenta los descuentos). */
SELECT categories.CategoryName, products.CategoryID, products.ProductName, orderdetails.quantity*orderdetails.UnitPrice AS €total_productos
FROM products
INNER JOIN categories 
ON products.CategoryID = categories.CategoryID
INNER JOIN orderdetails ON orderdetails.ProductID = products.ProductID;

-- 5.obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente, los ID de sus
-- pedidos y las fechas.
SELECT OrderID, CompanyName, OrderDate
FROM customers
INNER JOIN orders
ON customers.CustomerID = orders.CustomerID;
