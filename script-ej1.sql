#ejercicio 1 alura

/*
Ejercicio 1: Productos con Precio Superior al Promedio 📊
Enunciado:
Para la tabla productos (campos: id_producto, nombre, precio), 
escribe una consulta que muestre los nombres de los productos cuyo precio sea superior al precio promedio de todos los productos.
*/

# calcula el precio promedio y selecciona el producto con precios por arriba del promedio
SELECT 
    nombre, 
    precio, 
    -- diferencia precio y promedio
    precio - (SELECT AVG(precio) FROM productos) AS diferencia_con_promedio
FROM 
    productos
WHERE 
    -- compara el precio con el promedio
    precio > (SELECT AVG(precio) FROM productos)
ORDER BY 
    -- ordena la diferencia descendente
    diferencia_con_promedio DESC;
    
/*    
Columna Calculada:

Se agregó una nueva columna, diferencia_con_promedio, para mostrar la diferencia entre el precio del producto y el precio promedio.

Esto hace que la consulta sea más informativa.

Ordenación:

Los resultados se ordenan según la diferencia calculada en orden descendente (ORDER BY diferencia_con_promedio DESC), de manera que los productos más alejados del promedio aparezcan en la parte superior.

Comentarios:

Se incluyeron comentarios en el script para explicar cada paso, lo que facilita su comprensión para otros que revisen el código.    
*/