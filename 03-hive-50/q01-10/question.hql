-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `database.tsv`.
--
-- Compute la cantidad de registros por cada lett de la columna 1.
-- Escriba el resultado ordenado por lett. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<

DROP TABLE IF EXISTS database;
DROP TABLE IF EXISTS contador;

CREATE TABLE database (lett STRING, date DATE, num INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'; 

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE database;

CREATE TABLE contador
AS
    SELECT lett, count(1) AS cuenta
    FROM
        database

GROUP BY
    lett

ORDER BY
    lett;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM contador;
