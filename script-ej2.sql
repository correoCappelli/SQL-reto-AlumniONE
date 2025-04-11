
/*
Ejercicio 2: Eliminación de Duplicados con UNION 🔄

Enunciado:
Considere las siguientes opciones de consultas que combinan datos de las tablas clientes_1 y clientes_2 junto con la tabla compras:

    Opción A:

    SELECT nombre, valor
    FROM clientes_1
    JOIN compras ON clientes_1.id_cliente = compras.id_cliente
    UNION
    SELECT nombre, valor
    FROM clientes_2
    JOIN compras ON clientes_2.id_cliente = compras.id_cliente;

Opción B:

SELECT nombre, valor
FROM clientes_1
JOIN compras ON clientes_1.id_cliente = compras.id_cliente
UNION ALL
SELECT nombre, valor
FROM clientes_2
JOIN compras ON clientes_2.id_cliente = compras.id_cliente;

Opción C:

SELECT DISTINCT nombre, valor
FROM clientes_1
JOIN compras ON clientes_1.id_cliente = compras.id_cliente
UNION ALL
SELECT DISTINCT nombre, valor
FROM clientes_2
JOIN compras ON clientes_2.id_cliente = compras.id_cliente;

Pregunta:
Indica cuál de las opciones garantiza que el resultado final no contenga duplicados y justifica tu respuesta.

*/

/*

La respuesta correcta es A

UNION no considera duplicados entre las dos tablas

DISTINCT no consider duplicados en cada tabla,  pero con UNION ALL entre ellas pueden incluirse duplicados intratablas

