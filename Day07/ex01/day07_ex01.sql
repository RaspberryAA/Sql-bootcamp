-- Please modify an SQL statement from Exercise 00 and return a person name (not an identifier). 
-- Additional clause is we need to see only top 4 people with maximum visits in each pizzerias and sorted by a person name.
--  See the example of output data below.
-- 
-- name	count_of_visits
-- Dmitriy	4
-- Denis	3
-- ...	...
-- 

SELECT name, count(*) AS count_of_visits
FROM person_visits
JOIN person on person_id = person.id
GROUP BY name
ORDER BY count_of_visits DESC, name
LIMIT 4;