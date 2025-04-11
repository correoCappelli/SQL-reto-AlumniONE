
/*
SELECT id_cliente, COUNT(*) AS num_pedidos
FROM pedidos
WHERE YEAR(fecha_pedido) = 2024
GROUP BY id_cliente
HAVING COUNT(*) > 5;
*/



# otra manera de reolver , sin utilizar HAVING sobre el grupo. Es con procedures

DELIMITER $$

CREATE PROCEDURE FiltrarOrdenesPor2024()
BEGIN
    DECLARE fin INT DEFAULT 0;
    DECLARE id INT;
    DECLARE num INT;
    
    -- cursor para iterar sobre el grupo de id_clientes, y su cantidad,  donde el año es 2024
    DECLARE c CURSOR FOR 
    SELECT id_cliente, COUNT(*) AS num_pedidos
    FROM pedidos
    WHERE YEAR(fecha_pedido) = 2024
    GROUP BY id_cliente;
    
    -- handler que detecta el fin del procedure
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;
    
    -- abre el cursor
    OPEN c;
    
    -- lopea cada inea del cursor
    REPEAT
        FETCH c INTO id, num;
        IF fin = 0 AND num > 5 THEN
            -- elige id_clientes con count > 5
            SELECT id AS id_cliente, num AS num_pedidos;
        END IF;
    UNTIL fin END REPEAT;
    
    -- cierra el cursor
    CLOSE c;
END$$

DELIMITER ;
