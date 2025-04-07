-- Find the names of all females over the age of 25 and sort the result by name. The sample output is shown below.
-- 
-- name
-- Elvira
-- ...
-- 

select name
from person
where gender = 'female' and age > 25
order by name