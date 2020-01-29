-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `database.tsv`.
--
-- Escriba una consulta que devuelva los top valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<

DROP TABLE IF EXISTS database;
DROP TABLE IF EXISTS top;

CREATE TABLE database (lett STRING, date DATE, num INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'; 

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE database;

CREATE TABLE top
AS
    SELECT num
    FROM
        database
    GROUP BY num
    ORDER BY num
    LIMIT 5;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM top;
