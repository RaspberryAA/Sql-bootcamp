-- Please find pizzerias that have been visited more often by women or by men. 
-- Save duplicates for any SQL operators with sets (UNION ALL, EXCEPT ALL, INTERSECT ALL constructions). 
-- Please sort a result by the name of the pizzeria. The sample data is shown below.
-- 
-- pizzeria_name
-- Best Pizza
-- Dominos
-- ...
-- 

WITH female_visits AS (
    SELECT pizzeria.name AS pizzeria_name, COUNT(*) AS female_visits
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE gender = 'female'
    GROUP BY pizzeria.name
),
male_visits AS (
    SELECT pizzeria.name AS pizzeria_name, COUNT(*) AS male_visits
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE gender = 'male'
    GROUP BY pizzeria.name
)
SELECT female_visits.pizzeria_name
FROM female_visits
JOIN male_visits ON female_visits.pizzeria_name = male_visits.pizzeria_name
WHERE female_visits != male_visits
ORDER BY 1;