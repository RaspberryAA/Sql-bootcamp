-- Find the same pizza names that have the same price, but from different pizzerias. 
-- Make sure that the result is ordered by pizza name. The data sample is shown below. 
-- Please make sure that your column names match the column names below.
-- 
-- pizza_name	pizzeria_name_1	pizzeria_name_2	price
-- cheese pizza	Best Pizza	Papa Johns	700
-- ...	...	...	...
-- 

WITH p1 AS (
    SELECT pizzeria.name AS pizzeria_name_1, price, pizza_name, menu.id
    FROM pizzeria
    JOIN menu ON pizzeria_id = pizzeria.id
), p2 AS (
    SELECT pizzeria.name AS pizzeria_name_2, price, pizza_name, menu.id
    FROM pizzeria
    JOIN menu ON pizzeria_id = pizzeria.id
)
SELECT p1.pizza_name, pizzeria_name_1, pizzeria_name_2, p1.price
FROM p1
JOIN p2 ON p1.price = p2.price
WHERE (pizzeria_name_1 != pizzeria_name_2) AND p1.pizza_name = p2.pizza_name AND p1.id > p2.id
ORDER BY 1