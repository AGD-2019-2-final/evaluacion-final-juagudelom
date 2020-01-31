-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<

fs -rm -f -r data.tsv
fs -put data.tsv

file = LOAD 'data.tsv' USING PigStorage('\t')
       AS (f1: CHARARRAY, 
           f2: CHARARRAY, 
           f3: INT);
           
order_ = ORDER file BY f3;
colum3 = FOREACH order_ GENERATE f3;
top5 = LIMIT colum3 5;
STORE top5 INTO 'output';

fs -copyToLocal output output
