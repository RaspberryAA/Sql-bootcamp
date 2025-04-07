-- Find a union of pizzerias that have orders from either women or men. 
-- In other words, you should find a set of names of pizzerias that have been ordered only by women and 
-- make "UNION" operation with set of names of pizzerias that have been ordered only by men. 
-- Please be careful with word "only" for both genders. 
-- For all SQL operators with sets don't store duplicates (UNION, EXCEPT, INTERSECT). 
-- Please sort a result by the name of the pizzeria. The sample data is shown below.
-- 
-- pizzeria_name
-- Papa Johns
-- 


WITH female_visits AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE gender = 'female'
    GROUP BY pizzeria.name
),
male_visits AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE gender = 'male'
    GROUP BY pizzeria.name
)
SELECT pizzeria_name
FROM female_visits
WHERE pizzeria_name NOT IN (SELECT pizzeria_name FROM male_visits)
UNION
SELECT pizzeria_name
FROM male_visits
WHERE pizzeria_name NOT IN (SELECT pizzeria_name FROM female_visits)
ORDER BY 1