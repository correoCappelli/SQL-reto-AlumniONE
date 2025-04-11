CREATE DATABASE alurasql;

USE alurasql;

CREATE TABLE productos(
	id_producto INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50)NOT NULL,
    precio FLOAT NOT NULL,
    PRIMARY KEY(id_producto) 
);

# otorgamos permisos para leer archivos CSV para cargar productos

SHOW VARIABLES LIKE "local_infile"; 
SHOW VARIABLES LIKE "secure_file_priv"; 
SET GLOBAL local_infile = 1;

# preparamos un archivo CSV ---> productos.csv

# lo cargamos  a la tabla

# LOAD DATA LOCAL INFILE '/var/lib/mysql-files/productos.csv' -- remplazar la ruta 
# INTO TABLE productos
# FIELDS TERMINATED BY ',' -- lo que separa los items
# LINES TERMINATED BY '\n' -- fin de linea
# IGNORE 1 ROWS -- encabezado
# (nombre, precio); -- columnas


SELECT *FROM productos;

