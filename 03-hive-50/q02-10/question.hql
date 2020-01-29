-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `database.tsv`.
--
-- Construya una consulta que ordene la tabla por lett y valor (3ra columna).
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<

DROP TABLE IF EXISTS database;
DROP TABLE IF EXISTS order_lettval;

CREATE TABLE database (lett STRING, date DATE, num INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'; 

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE database;

CREATE TABLE order_lettval
AS
    SELECT *
    FROM
        database

ORDER BY
    lett, num, date;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM order_lettval;

