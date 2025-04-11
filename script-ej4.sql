
/*
Ejercicio 4: Clasificación de Clientes por Total de Pedidos 🏷️

Enunciado:
Dadas las tablas Clientes y Pedidos, escribe una consulta que muestre el nombre del cliente y, en una columna adicional, indique:

    "Alto" si el total de sus pedidos es mayor a $5000.
    "Medio" si el total está entre $3000 y $5000.
    "Bajo" si es menor a $3000.
*/

# creamos una CTE (common table expression)
WITH ClientesTotales AS {
	SELECT c.nombre, 
    SUM(p.total) AS total_pedidos 
    FROM clientes C
    JOIN pedidos P
    ON c.id_cliente = p.id_cliente
}

# clasificamos los clientes en base al total de sus pedidos

SELECT nombre,
	CASE
    WHEN total_pedidos > 5000 THEN 'Alto'
        WHEN total_pedidos BETWEEN 3000 AND 5000 THEN 'Medio'
        ELSE 'Bajo'
    END AS clasificacion
FROM ClientesTotales;
