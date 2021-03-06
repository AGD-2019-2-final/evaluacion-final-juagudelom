-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<

date = FOREACH u GENERATE $3,ToDate($3,'yyyy-MM-dd');
year_ = FOREACH date GENERATE $0, GetYear($1);
agrup = GROUP year_ BY $1;
cont = FOREACH agrup GENERATE $0, COUNT(year_);

STORE cont INTO 'output' USING PigStorage(',');
fs -copyToLocal output output