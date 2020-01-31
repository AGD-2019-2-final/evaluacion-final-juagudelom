-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<

fs -rm -f -r output;
fs -rm -f -r data.tsv
fs -put data.tsv
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
file = LOAD 'data.tsv' 
        AS (f1: CHARARRAY, 
            f2: BAG{t:(p:CHARARRAY)});
            
lett = FOREACH file GENERATE f1, FLATTEN(f2);
lett2 = FOREACH lett GENERATE p;
agrup = GROUP lett2 BY p;
cont = FOREACH agrup GENERATE group, COUNT(lett2);
STORE cont INTO 'output';
fs -copyToLocal output output

