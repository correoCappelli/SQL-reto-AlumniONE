/*
Ejercicio 6: Primera Venta en el Mes de Creación 🗓️
Enunciado:
Dadas las tablas Ventas y Productos, escribe una consulta para mostrar 
el producto_id de aquellos productos que fueron vendidos por primera vez en el mismo mes y año en el que fueron creados.
*/

/*
ventas
id_prod fecha_venta cant_venta
productos
id_prod   fecha_creacion categoria
*/

# utilizamos el concepto de CTE (common table expression) para primero crear ua tabla con unicamente las primeras ventas de cada producto

WITH PrimerasVentas {
	SELECT id_prod, 
    MIN(fecha_venta) AS primera_venta 
    FROM ventas
    GROUP BY id_prod;
}

# ya con la lista de primeras ventas podemos seleccionar las fechas entre las tablas que cumplan las condiciones de YEAR y MONTH
SELECT v.id_prod FROM
PrimerasVentas V
JOIN productos P ON v.id_prod = p.id_prod
WHERE YEAR(v.primera_venta) = YEAR(p.fecha_creacion)
  AND MONTH(v.primera_venta) = MONTH(p.fecha_creacion);





