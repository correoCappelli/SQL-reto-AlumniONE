
/*
Ejercicio 7: Combinación de Ventas de 2023 y 2024 🔀
Enunciado:
Dadas las tablas Venta_2023 y Ventas_2024, escribe una consulta que combine las ventas de ambos años y 
añada una columna adicional llamada año.
*/


/*
venta_2023
id_venta total
venta_2024
id_venta total
*/


WITH Ventas2023 {
	SELECT id_venta, SUM(total) AS total_ventas, "2023" AS año
    GROUP BY id_venta
};

WITH Ventas2024 {
	SELECT id_venta, SUM(total) AS total_ventas, "2024" AS año
    GROUP BY id_venta
};

# hacemos un UNION ALL para combinar ambas tablas. No nos interesa si hay duplicados ya que seran de otro año o el mismo

SELECT id_prod, total_ventas, año
FROM Ventas2023
UNION ALL
SELECT id_prod, total_ventas, año
FROM Ventas2024;



