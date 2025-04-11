/*
Ejercicio 5: Total de Ventas por Categoría 📦
Enunciado:
Para las tablas ventas y productos, escribe una consulta que muestre el total de la cantidad de productos vendidos por cada categoría.
*/
/*
ventas
id_prod  ,  total_venta

productos
id_prod, categoria_prod
*/

SELECT p.categoria, 
	   SUM(v.total_venta) AS cant_total_vendida
FROM ventas V       
JOIN productos P ON v.id_prod = p.id_prod
GROUP BY p.categoria

       