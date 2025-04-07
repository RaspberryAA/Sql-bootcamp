-- Denied	
-- Syntax construction	GROUP BY, any type (UNION,...) working with sets
-- Please write a simple SQL query that returns a list of unique person names who have placed orders at any pizzerias. 
-- The result should be sorted by person name. Please see the example below.
-- 
-- name
-- Andrey
-- Anna
-- ...
-- 


SELECT DISTINCT name 
FROM person_order
JOIN person on person_id = person.id
ORDER BY name;