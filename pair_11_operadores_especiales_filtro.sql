USE northwind;

-- 1.compañías que están afincadas en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la
-- ciudad, el nombre de la compañía y el nombre de contacto.
SELECT City, CompanyName, ContactName
FROM customers
WHERE City LIKE "A%" OR City LIKE "B%";

-- 2.Mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades
-- que empiezan por "L".
SELECT City, CompanyName, ContactName, COUNT(OrderID)
FROM customers
INNER JOIN orders
ON customers.CustomerID = orders.CustomerID
WHERE City LIKE "L%"
GROUP BY customers.CustomerID;

-- 3.extraer los clientes que no tengan el titulo de "Sales" en "ContactTitle" . Extraer el nombre de
-- contacto, su titulo de contacto y el nombre de la compañía.
SELECT ContactName, ContactTitle, CompanyName
FROM customers
WHERE ContactTitle NOT LIKE '%Sales%';

-- 4.Todos los clientes que no tengan una "A" en segunda posición en su nombre. Devolved unicamente el nombre de contacto.
SELECT ContactName
FROM customers
WHERE ContactName NOT LIKE '_A%';

-- 5.una query que nos devuelva todos los clientes y proveedores que tenemos en la bases de datos.
-- Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la
-- relación (Proveedor o Cliente). Pero importante! No debe haber duplicados en nuestra respuesta.
-- La columna Relationship no existe y debe ser creada como columna temporal. 
SELECT City, CompanyName, ContactName, 'clientes' AS 'Relationship'  
FROM customers
UNION
SELECT City, CompanyName, ContactName, 'proveedores'
FROM suppliers;

-- 6.Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".
SELECT CategoryID, CategoryName
FROM categories
WHERE description LIKE '%sweet%';

-- 7.Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la bases de datos:
-- Tendremos que combinar dos columnas usando concat para unir dos columnas
SELECT ContactName AS 'nombre y apellidos', 'clientes' AS 'Relationship' 
FROM customers
UNION
SELECT CONCAT(firstname, ' ', lastname), 'empleados'
FROM employees;