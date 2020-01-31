-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<

file = LOAD 'data.tsv' 
AS (f1: CHARARRAY, f2: CHARARRAY, f3: MAP[]);
lett = FOREACH file GENERATE f1, FLATTEN(KEYSET(f3)) AS f4;
lett2 = FOREACH lett GENERATE f4;
agrup = GROUP lett2 BY f4;
cont = FOREACH agrup GENERATE group, COUNT(lett2);

STORE cont INTO 'output' USING PigStorage(',');