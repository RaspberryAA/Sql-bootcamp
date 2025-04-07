-- Write an SQL statement to see how restaurants are grouped by visits and by orders, and joined together by restaurant name.
-- You can use the internal SQL from Exercise 02 (Restaurants by Visits and by Orders) without any restrictions on the number of rows.
-- 
-- In addition, add the following rules.
-- 
-- Compute a sum of orders and visits for the corresponding pizzeria (note that not all pizzeria keys are represented in both tables).
-- Sort the results by the total_count column in descending order and by the name column in ascending order. Take a look at the example data below.
-- 
-- name	total_count
-- Dominos	13
-- DinoPizza	9
-- ...	...
-- 


WITH o AS (SELECT pizzeria.name, count(*) AS count, 'order' as action_type
FROM person_order
JOIN person on person_id = person.id
JOIN menu on menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY action_type ASC, count DESC
), v AS (SELECT pizzeria.name, count(*) AS count,'visit' as action_type
FROM person_visits
JOIN person on person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY action_type ASC, count DESC
)
SELECT v.name, COALESCE(o.count, 0) + COALESCE(v.count, 0) as total_count
FROM o
FULL OUTER JOIN v on o.name = v.name
ORDER BY 2 DESC, 1 ASC;