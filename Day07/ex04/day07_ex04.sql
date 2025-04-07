-- Denied	
-- Syntax construction	WHERE
-- Please write a SQL statement that returns the person's name and the corresponding number of visits to 
-- any pizzerias if the person has visited more than 3 times (> 3). Please take a look at the sample data below.
-- 
-- name	count_of_visits
-- Dmitriy	4
-- 


SELECT name, count(*) AS count_of_visits
FROM person_visits
JOIN person on person_id = person.id
GROUP BY name
HAVING count(*) > 3;