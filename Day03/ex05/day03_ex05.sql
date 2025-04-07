-- Write an SQL statement that returns a list of pizzerias that Andrey visited but did not order from. 
-- Please order by the name of the pizzeria. The sample data is shown below.
-- 
-- pizzeria_name
-- Pizza Hut
-- 

WITH visited AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE person.name = 'Andrey'
    GROUP BY pizzeria.name
),
ordered AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE person.name = 'Andrey'
    GROUP BY pizzeria.name
)
SELECT pizzeria_name 
FROM visited
EXCEPT
SELECT pizzeria_name 
FROM ordered
ORDER BY 1