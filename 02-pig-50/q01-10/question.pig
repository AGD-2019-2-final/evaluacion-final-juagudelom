-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<

file = LOAD 'data.tsv' 
       AS (f1: CHARARRAY, 
           f2: CHARARRAY, 
           f3: INT);
           
agrup = GROUP file BY f1;
cont = FOREACH agrup GENERATE group, COUNT(file);
STORE cont INTO 'output';

fs -copyToLocal output output
