-- Please write a SQL statement to see 3 favorite restaurants by visits and by orders in a list 
-- (please add an action_type column with values 'order' or 'visit', it depends on the data from the corresponding table).
--  Please have a look at the example data below. 
-- The result should be sorted in ascending order by the action_type column and in descending order by the count column.
-- 
-- name	count	action_type
-- Dominos	6	order
-- ...	...	...
-- Dominos	7	visit
-- ...	...	...


(SELECT pizzeria.name, count(*) AS count, 'order' as action_type
FROM person_order
JOIN person on person_id = person.id
JOIN menu on menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY action_type ASC, count DESC
LIMIT 3
)

UNION All

(SELECT pizzeria.name, count(*) AS count,'visit' as action_type
FROM person_visits
JOIN person on person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY action_type ASC, count DESC
LIMIT 3
);