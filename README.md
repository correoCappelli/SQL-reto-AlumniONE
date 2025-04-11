# SQL Reto - AlumniONE

Bienvenido al repositorio del reto de SQL para AlumniONE. Este proyecto tiene como objetivo poner a prueba tus habilidades en el manejo de bases de datos utilizando SQL, con un enfoque especial en el uso de Common Table Expressions (CTE) y procedimientos para resolver ciertos ejercicios.
Fue presentado por la Instructora-Helper ORLI de AluraONE

## Enlace al repositorio

Accede al proyecto aquí: [SQL Reto - AlumniONE](https://github.com/correoCappelli/SQL-reto-AlumniONE.git)

## Descripción del Proyecto

Este reto está diseñado para evaluar tus conocimientos en SQL mediante una serie de ejercicios que requieren el uso de CTEs y procedimientos, entre otras funcionalidades avanzadas de SQL. Estas herramientas te permitirán escribir consultas más legibles y organizadas, especialmente al enfrentar consultas complejas.

## Uso de CTE y Procedimientos en el Proyecto

### Ejemplo de CTE: Clasificación de Clientes

Utilizamos CTE para calcular el total de pedidos de los clientes y clasificarlos según el total acumulado:

```sql
WITH ClientesTotales AS (
    SELECT c.nombre, 
           SUM(p.total) AS total_pedidos 
    FROM clientes c
    JOIN pedidos p ON c.id_cliente = p.id_cliente
    GROUP BY c.nombre
)
SELECT nombre,
       CASE
           WHEN total_pedidos > 5000 THEN 'Alto'
           WHEN total_pedidos BETWEEN 3000 AND 5000 THEN 'Medio'
           ELSE 'Bajo'
       END AS clasificacion
FROM ClientesTotales;
```

## Ejemplo de Procedimiento: Conteo de Pedidos

Para solucionar el problema de conteo de pedidos usando procedimientos:

```sql
DELIMITER $$
CREATE PROCEDURE FiltrarOrdenesPor2024()
BEGIN
    DECLARE fin INT DEFAULT 0;
    DECLARE id INT;
    DECLARE num INT;
 
    DECLARE c CURSOR FOR 
    SELECT id_cliente, COUNT(*) AS num_pedidos
    FROM pedidos
    WHERE YEAR(fecha_pedido) = 2024
    GROUP BY id_cliente;
 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;
 
    OPEN c;
 
    REPEAT
        FETCH c INTO id, num;
        IF fin = 0 AND num > 5 THEN
            SELECT id AS id_cliente, num AS num_pedidos;
        END IF;
    UNTIL fin END REPEAT;
 
    CLOSE c;
END$$
DELIMITER ;
```


En este ejemplo, utilizamos un cursor para iterar sobre los grupos de clientes y filtrar aquellos con más de cinco pedidos en 2024.
Instrucciones

 - Clona el repositorio:

> git clone https://github.com/correoCappelli/SQL-reto-AlumniONE.git

Explora los archivos dentro del repositorio para familiarizarte con la estructura de la base de datos y los ejercicios propuestos.

Resuelve los ejercicios utilizando SQL y emplea CTEs o procedimientos donde sea posible para simplificar tus consultas y hacerlas más eficientes.

Sube tus soluciones al repositorio. Asegúrate de documentar adecuadamente tus consultas para facilitar la comprensión de tu enfoque.












