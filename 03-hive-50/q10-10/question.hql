-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que calcule la cont_c3 de registros por llave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la llave 
-- `aaa`?
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS t0;
CREATE TABLE t0 (
    c1 STRING,
    c2 ARRAY<CHAR(1)>, 
    c3 MAP<STRING, INT>
    )
    ROW FORMAT DELIMITED 
        FIELDS TERMINATED BY '\t'
        COLLECTION ITEMS TERMINATED BY ','
        MAP KEYS TERMINATED BY '#'
        LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE t0;
--
-- >>> Escriba su respuesta a partir de este punto <<<

DROP TABLE IF EXISTS cont_c3;
CREATE TABLE cont_c3 AS SELECT llave, count(*) 
    FROM (SELECT  llave FROM t0 LATERAL VIEW explode(c3) t0 AS llave, val ) t0
        GROUP BY llave
        ORDER BY llave;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
    SELECT * FROM cont_c3;

