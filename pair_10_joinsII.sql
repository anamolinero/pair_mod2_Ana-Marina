USE northwind;

/* 1. Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas.
Investiga el resultado, ¿sabes decir quién es el director? */

SELECT empleadas.firstname AS nombre_empleada, empleadas.LastName AS apellido_empleada, empleadas.City AS ubicacion_empleada,
jefas.firstname AS nombre_jefa, jefas.LastName AS apellido_jefa, jefas.City AS ubicacion_jefa
FROM employees AS empleadas, employees AS jefas
WHERE jefas.EmployeeID = empleadas.ReportsTo;


/* 2. El equipo de marketing necesita una lista con todas las categorías de productos, incluso si no tienen productos asociados.
Queremos obtener el nombre de la categoría y el nombre de los productos dentro de cada categoría. Podriamos usar un 
RIGTH JOIN con 'categories'?, usemos tambien la tabla 'products'. */

SELECT CategoryName, ProductName
FROM products
RIGHT JOIN categories
ON categories.CategoryID = products.CategoryID;

SELECT CategoryName, ProductName
FROM products
RIGHT JOIN categories
USING (CategoryID); -- para usar using hay que poner paréntesis en la columna que es igual, es igual que el código de arriba

/* 3. Desde el equipo de ventas nos piden obtener una lista de todos los pedidos junto con los datos de las empresas clientes.
Sin embargo, hay algunos pedidos que pueden no tener un cliente asignado. Necesitamos asegurarnos de incluir todos los pedidos,
incluso si no tienen cliente registrado. */

SELECT OrderID, customers.CustomerID, customers.CompanyName
FROM orders
LEFT JOIN customers
ON orders.CustomerID = customers.CustomerID;

/* 4. El equipo de Recursos Humanos quiere saber qué empleadas han gestionado pedidos y cuáles no.
Queremos obtener una lista con todas las empleadas y, si han gestionado pedidos, mostrar los detalles del pedido. */

SELECT employees.FirstName, employees.EmployeeID, orders.OrderID
FROM employees
LEFT JOIN orders
ON employees.EmployeeID = orders.EmployeeID;

/* 5. Desde el área de logística nos piden una lista de todos los transportistas (shippers) y los pedidos que han enviado.
Queremos asegurarnos de incluir todos los transportistas, incluso si no han enviado pedidos. */

SELECT ShipperID, OrderID
FROM shippers
LEFT JOIN orders
ON ShipVia = ShipperID;
